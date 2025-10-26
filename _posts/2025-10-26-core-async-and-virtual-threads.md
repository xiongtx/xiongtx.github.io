---
layout: post
title: core.async and virtual threads
excerpt: Surprising semantic changes in a popular library
---

In a [previous post]({% post_url 2024-07-08-virtual-threads %}) we explored the introduction of [virtual threads](https://docs.oracle.com/en/java/javase/21/core/virtual-threads.html) into the JVM. One concern about virtual threads was [pinning](https://docs.oracle.com/en/java/javase/21/core/virtual-threads.html#GUID-04C03FFC-066D-4857-85B9-E5A27A875AF9), the sticky association of virtual threads to platform threads due to use of [`synchronized`](https://docs.oracle.com/javase/tutorial/essential/concurrency/sync.html)[^1]. Since the whole point is to execute a large number of virtual threads on a smaller number of platform threads, pinning greatly reduces scalability. Third-party libraries have tried to mitigate this by [replacing](https://clojure.atlassian.net/browse/CLJ-2804) `synchronized` with [`ReentrantLock`](https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/util/concurrent/locks/ReentrantLock.html), but pinning can [still occur](https://mikemybytes.com/2024/02/28/curiosities-of-java-virtual-threads-pinning-with-synchronized/) due to use of first-party functionality like [`ConcurrentHashMap`](https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/util/concurrent/ConcurrentHashMap.html).

As of JDK 24, `synchronized` [no longer pins](https://openjdk.org/jeps/491). This greatly reduces the concerns around using virtual threads. [`core.async`](https://github.com/clojure/core.async), a popular Clojure concurrency library, is moving towards [using virtual threads](https://clojure.org/news/2025/10/01/async_virtual_threads) by default. But first, we need to address a surprising semantic changes the library introduced as part of the virtual thread transition.

## If it's fixed, break it

`core.async` was inspired by Go's [goroutines](https://go.dev/tour/concurrency/1), which popularized language-level first-class concurrency. Go and its libraries were designed from the outset to park goroutines on blocking operations, so a large number of goroutines can run on a smaller number of OS threads. Unfortunately, the JVM at the time could not do this, so `core.async`'s [go-blocks](https://clojure.org/guides/core_async_go) were only recommended for CPU-bound tasks, not I/O-bound ones. This greatly limited their appeal as most web developers and such are a lot more likely to do I/O (API calls, DB queries, etc.) than compute. Virtual threads promise to rectify this, so that go-blocks can be used for both.

In preparation for this cutover, however, a strange decision was made to [replace](https://github.com/clojure/core.async/commit/fb61cdce2386d2bb6b88c969af9158a32a491073) the long-standing [`FixedThreadPool`](https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/util/concurrent/Executors.html#newFixedThreadPool(int)) used to execute go-blocks with a [`CachedThreadPool`](https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/util/concurrent/Executors.html#newCachedThreadPool()). As the name suggests, a `FixedThreadPool` uses a constant number of threads, while a `CachedThreadPool` spins up a new thread per task. This means that users who assumed fixed resource usage by platform threads may be [unpleasantly surprised](https://ask.clojure.org/index.php/14428/core-async-beta1-cached-thread-pools-hundreds-threads-doing) after upgrading the library. Perhaps the change was a reasonable attempt to make `core.async` more useful out-of-the-box for programmers expecting I/O concurrency, but it's nonetheless unusual for Clojure, which [prizes stability](https://dl.acm.org/doi/pdf/10.1145/3386321).

## Do more with less

Now let's see how go-blocks behave with and without virtual threads.

The JVM system property [`clojure.core.async.vthreads`](https://clojure.org/news/2025/10/01/async_virtual_threads#_virtual_thread_control) controls whether virtual threads are used. Since we're using JDK $$ \ge $$ 21, we can leave it unset to use virtual threads, but let's set it to `target` anyway.

```clojure
(defproject virtual_threads "0.1.0-SNAPSHOT"
  :description "Testing virtual threads functionality with `core.async`."
  :dependencies [[clj-http "3.13.1"]
                 [com.taoensso/timbre "6.8.0"]
                 [org.clojure/clojure "1.12.3"]
                 [org.clojure/core.async "1.9.829-alpha2"]]
  :jvm-opts ["-Dclojure.core.async.vthreads=target"]
  :profiles {:uberjar {:aot :all}}
  :main virtual-threads.core
  :repl-options {:init-ns virtual-threads.core})
```

We fire off 100 HTTP requests in go-blocks, wait for them to complete, and report the time taken.

```clojure
(ns virtual-threads.core
  (:gen-class)
  (:require
   [clj-http.client :as http]
   [clojure.core.async :as a]
   [taoensso.timbre :as log])
  (:import
   (java.lang.management ManagementFactory)))

(def test-url
  "httpstat.us is frequently offline. Mirrors can be used instead.

  See: https://github.com/aaronpowell/httpstatus/issues/135"
  "https://tools-httpstatus.pickup-services.com/200")

(defn -main
  [& _]
  (let [n 100
        ch (a/chan 1)
        mx-bean (ManagementFactory/getThreadMXBean)
        t-start (System/nanoTime)]
    (log/info {:vthreads? (System/getProperty "clojure.core.async.vthreads")})
    (doseq [i (range n)]
      (a/go
        (http/get test-url {:query-params {:sleep 1000}})
        (log/info {:i i
                   :n-threads (.getThreadCount mx-bean)
                   :is-virtual (.isVirtual (Thread/currentThread))})
        (a/>! ch :done)))
    (a/<!! (a/go-loop [i n]
             (when (pos? i)
               (a/<! ch)
               (recur (dec i)))))
    (log/info {:ms (/ (- (System/nanoTime) t-start) 1E6)})))
```

We see that virtual threads were used, and there were about 25 threads active at any one time[^2]:

```
INFO [virtual-threads.core:22] - {:vthreads? "target"}
INFO [virtual-threads.core:26] - {:i 40, :n-threads 25, :is-virtual true}
INFO [virtual-threads.core:26] - {:i 0, :n-threads 25, :is-virtual true}
INFO [virtual-threads.core:26] - {:i 52, :n-threads 25, :is-virtual true}
...
INFO [virtual-threads.core:34] - {:ms 3652.99125}
```

Now let's try without virtual threads:

```clojure
:jvm-opts ["-Dclojure.core.async.vthreads=avoid"]
```

```
INFO [virtual-threads.core:22] - {:vthreads? "avoid"}
INFO [virtual-threads.core:26] - {:i 0, :n-threads 107, :is-virtual false}
INFO [virtual-threads.core:26] - {:i 65, :n-threads 107, :is-virtual false}
INFO [virtual-threads.core:26] - {:i 71, :n-threads 107, :is-virtual false}
...
INFO [virtual-threads.core:34] - {:ms 4712.404833}
```

We see that platform threads were used, and the number of threads active at one time is ~100. So, with virtual thread enabled go-blocks, we can do the same work in the same time with far less resources.

## Piping up

I frequently use [`pipeline-blocking`](https://github.com/clojure/core.async/blob/v1.9.829-alpha2/src/main/clojure/clojure/core/async.clj#L682) to manage parallel I/O operations. However, [`:blocking`](https://github.com/clojure/core.async/blob/v1.9.829-alpha2/src/main/clojure/clojure/core/async.clj#L637-L640) pipelines are assumed to handle [`:mixed`](https://github.com/clojure/core.async/blob/v1.9.829-alpha2/src/main/clojure/clojure/core/async/impl/dispatch.clj#L132) workloads, which use a `CachedThreadPool`. To use virtual threads, we now need to use [`pipeline-async`](https://github.com/clojure/core.async/blob/v1.9.829-alpha2/src/main/clojure/clojure/core/async.clj#L688), which uses [go-blocks](https://github.com/clojure/core.async/blob/v1.9.829-alpha2/src/main/clojure/clojure/core/async.clj#L641).

This is another instance where code has changed out from under us. Previously, `:compute` pipelines used go-blocks, but were [changed to use threads](https://github.com/clojure/core.async/commit/3429e3e1f1d49403bf9608b36dbd6715ffe4dd4f). It's really not clear at this point why a certain type of pipeline uses go-blocks or threadpools. I [asked](https://ask.clojure.org/index.php/14732/choosing-between-core-async-pipelines) about it on the Clojure forums; let's see what the devs say.

## One thread to rule them all?

As far as I'm concerned, virtual threads are the way to go unless the task is highly CPU-bound and needs to avoid any and all overhead. For most use cases, programmers no longer have to carefully think about the implications of putting code in a go-block. This is a welcome change, and one I'll take advantage of going forward.

---

[^1]: Executing native code also pins a virtual thread.

[^2]: We're only counting the number of active theads. Parked virtual threads are not included.
