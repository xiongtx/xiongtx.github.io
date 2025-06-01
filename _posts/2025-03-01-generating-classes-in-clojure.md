---
layout: post
title: Generating classes in Clojure
excerpt: JVM adventures await!
---

I rarely use the [`gen-class`](https://clojure.github.io/clojure/clojure.core-api.html#clojure.core/gen-class) facility in Clojure, but when I do, I usually trip over one issue or another. After finally spending some time to read the [documentation](https://clojure.org/reference/compilation) and peruse [source code](https://github.com/clojure/clojure), I've got a better understanding of how it all fits together.

## Write that down, write that down!

When Clojure code is evaluated, the compiler generates JVM bytecode and loads it into memory. For various reasons, such as improved startup time, it can be advantageous to compile namespaces into actual classfiles. These compiled namespaces need to be `import`ed instead of `require`d.

A namespace is normally compiled into a class ending in `__init`. For the simplest namespace:

```clojure
(ns clj-genclass.core)
```

We can compile with [Leiningen](https://leiningen.org/):

```bash
lein compile clj-genclass.core
```

And see the class `core__init.class` under `target/classes/clj_genclass`.

## Lookin' fresh

The resulting class isn't very convenient to work with, however. That's where `:gen-class` comes in: it provides a large number of options[^1] that make the generated class more like the Java library classes we interop with.

To automatically compile classes before starting a Lein REPL, the namespace needs to be added under [:aot](https://codeberg.org/leiningen/leiningen/src/commit/8cda41784545bef71d1d605d739f4935c8fe4f21/sample.project.clj#L280) in `project.clj`. Consider the following:

```clojure
(ns clj-genclass.MyClass
  (:gen-class
   :constructors {[String] []}
   :init init
   :state state
   :methods [[print [] void]]))

(defn -init
  [txt]
  [[] txt])

(defn -print
  [this]
  (println (.state this)))
```

Running `lein repl`, we see that the class is compiled:

```bash
$ lein repl
Compiling clj-genclass.MyClass
nREPL server started on port 57734 on host 127.0.0.1 - nrepl://127.0.0.1:57734
```

And can be immediately imported and used:

```clojure
clj-genclass.core=> (import 'clj_genclass.MyClass)
clj_genclass.MyClass

clj-genclass.core=> (.print (MyClass. "My own class"))
My own class
```

## The function is dead, long live the function

If we update `MyClass`'s `-print` method, e.g.

```clojure
(defn -print
  [this]
  (println "foo" (.state this)))
```

We can see the changes take place either by compiling the class in the REPL:

```clojure
clj-genclass.core=> (compile 'clj-genclass.MyClass)
clj_genclass.MyClass

clj-genclass.core=> (import 'clj_genclass.MyClass)
clj_genclass.MyClass

clj-genclass.core=> (.print (MyClass. "My own class"))
foo My own class
```

Or just evaluating it in [CIDER](https://github.com/clojure-emacs/cider). `lein compile` does *not* work because it only writes to classfiles and doesn't load anything into memory.

## The old switcheroo

Classes in Java are loaded by instances of [ClassLoader](https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/lang/ClassLoader.html)[^2]. Once an instance of `ClassLoader` has loaded a class, it must always [return what it already loaded](https://docs.oracle.com/javase/specs/jvms/se21/html/jvms-5.html#jvms-5.3.2). This means that it cannot reload a class whose definition has changed.

To get around this, Clojure takes advantage of the fact that a class is distinguished not just by its name but also [by its classloader](https://docs.oracle.com/javase/specs/jvms/se21/html/jvms-5.html#jvms-5.3.2). Every time a form is (re)evaluated, a [new instance](https://github.com/clojure/clojure/blob/clojure-1.12.0/src/jvm/clojure/lang/Compiler.java#L7662) of Clojure's own [DynamicClassLoader](https://github.com/clojure/clojure/blob/clojure-1.12.0/src/jvm/clojure/lang/DynamicClassLoader.java) is used. We can see this in action:

```clojure
clj-genclass.core=> (defn foo [] "foo")
#'clj-genclass.core/foo

clj-genclass.core=> (.getClassLoader (.getClass foo))
#object[clojure.lang.DynamicClassLoader 0x41f045a1 "clojure.lang.DynamicClassLoader@41f045a1"]

clj-genclass.core=> (defn foo [] "bar")
#'clj-genclass.core/foo

clj-genclass.core=> (.getClassLoader (.getClass foo))
#object[clojure.lang.DynamicClassLoader 0x32035f8f "clojure.lang.DynamicClassLoader@32035f8f"]
```

When `foo` was redefined, the new version was loaded by a different classloader. All instances of `DynamicClassLoader` share a [cache](https://github.com/clojure/clojure/blob/clojure-1.12.0/src/jvm/clojure/lang/DynamicClassLoader.java#L26-L27) so they can all find previously loaded classes. Classes that are no longer used (such as those that have been redefined) are eventually [removed](https://github.com/clojure/clojure/blob/clojure-1.12.0/src/jvm/clojure/lang/DynamicClassLoader.java#L45).

## Footnotes

[^1]: `:gen-class` by itself does not compile a class--it only specifies *how* a class should be compiled.

[^2]: Except for the classes of the Java Runtime itself, which are loaded by a [bootstrap classloader](https://docs.oracle.com/javase/jndi/tutorial/beyond/misc/classloader.html) written in native code.
