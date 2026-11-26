---
layout: post
title: Clojure with-redefs gotcha
excerpt: A Clojure compiler optimization breaks a problematic macro
---

The `with-redefs` macro in Clojure is one of the most problematic. The [description](https://clojuredocs.org/clojure.core/with-redefs) says:

> binding => var-symbol temp-value-expr
>
> Temporarily redefines Vars while executing the body.  The
> temp-value-exprs will be evaluated and each resulting value will
> replace in parallel the root value of its Var.  After the body is
> executed, the root values of all the Vars will be set back to their
> old values.  These temporary changes will be visible in all threads.
> **Useful for mocking out functions during testing**.

The last part about being "useful for mocking out functions during testing" (emphasis mine) has encouraged many users, myself included, to use `with-redefs` frequently. However, there are some unfortunate gotchas, one of which I encountered recently.

Take the following:

```clojure
(defn foo
  [^long a]
  "foo")

(with-redefs [foo (fn [x] "bar")]
  (foo "x"))
```

We'd expect `(foo "x")` to return `"bar"`, but it instead throws an exception:

```
ClassCastException user$eval20544$fn__20545 cannot be cast to clojure.lang.IFn$LO  user/eval20544/fn--20547 (form-init538441322648284404.clj:45)
```

Getting the Var directly and applying it to `"x"` _does_ work, however:

```clojure
(with-redefs [foo (fn [x] "bar")]
  ((var foo) "x"))
;; => "bar"
```

What's going on? As it turns out, the Clojure compiler optimizes [functions whose parameters have primitive type hints](https://github.com/clojure/clojure/blob/clojure-1.8.0/src/jvm/clojure/lang/IFn.java#L97). The compiler "knows" that `foo` takes a `long` and returns an `Object` (`String`). By redefining `foo` to a function that takes an `Object` (the default without a type hint) and returns an `Object`, we fail to match types. Invoking the _Var_ of `foo` gets around this.

We see that `foo` _can_ be redefed with a function that has the same type:

```clojure
(with-redefs [foo (fn [^long x] "bar")]
  (foo 1))
;; => "bar"
```
