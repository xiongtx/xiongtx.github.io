---
layout: post
title: Pattern matching
excerpt: A great language feature for writing clean code
---

I've long had a vague idea of what **pattern matching** is, but never really appreciated why it is a desirable feature in programming languages. We recently covered the topic of pattern matching in the [Functional Programming Principles in Scala](https://www.coursera.org/learn/progfun1/lecture/cdHAM/lecture-4-6-pattern-matching) course I'm taking, and I feel that I now have a much better understanding of it.

The C2 wiki's [page on pattern matching](http://c2.com/cgi/wiki?PatternMatching) contains a much better description than [Wikipedia's](https://en.wikipedia.org/wiki/Pattern_matching), which is to be expected for such technical topics. In short,

> Pattern matching is the compiler's ability to compare both the form and the content of two expressions.

It is a **dispatch mechanism** for choosing which variant of a function to call based on the form and content of its argument(s).

The value of pattern matching is in making programming more _declarative_ and _logical_. Declarative programming lets the programmer to focus on the _what_ instead of the _how_. This allows programming at a higher level and focusing more on the problem domain, which should increase the odds that the program is correct.

Coming from Clojure, I can best understand pattern matching as a combination of two familiar concepts:

- [case](https://clojuredocs.org/clojure.core/case) expressions
- [Destructuring](http://clojure.org/guides/destructuring)

In languages without pattern matching, it is necessary to explicitly check the form and content of inputs, which leads to a lot of boilerplate.

Consider the following implementation of `flatten` in Scheme:

```scheme
(define (flatten x)
  (cond ((null? x) '())
        ((pair? x) (append (flatten (car x)) (flatten (cdr x))))
        (else (list x))))
```

Here, we have to explicitly use a `cond` on `x` to decide what to do.

In Scala, the [solution](http://stackoverflow.com/a/24128335/864684) is more declarative, and therefore easier to read and understand:

```scala
def flatten(xs: List[Any]): List[Any] = xs match {
  case List() => List()
  case (y :: ys) :: yss => flatten(y :: ys) ::: flatten(yss)
  case y :: ys => y :: flatten(ys)
}
```

In fact, Philip Wadler wrote a [whole critique of SICP](https://www.cs.kent.ac.uk/people/staff/dat/miranda/wadler87.pdf), and lack of pattern matching is the first issue he raises (along with non-mathematical synatx, lack of static and user-defined types, and lack of lazy evaluation). For more, see a [critique of the critique](http://www.leonardoborges.com/writings/2013/03/25/clojure-and-why-calculating-is-better-than-scheming/) by Leonardo Borges using Clojure and Haskell.

Clojure supports pattern matching through a library, [core.match](https://github.com/clojure/core.match). As a dispatching mechanism, however, pattern matching [seems to be less idiomatic](http://programmers.stackexchange.com/a/237026/194163) than [multimethods](http://clojure.org/reference/multimethods). Multimethods allow dispatching on arguments based on an arbitrary **dispatching function**, which is even more general than pattern matching; however, it is less concise and, in my opinion, less elegant.
