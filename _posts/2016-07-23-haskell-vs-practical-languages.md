---
layout: post
title: Haskell vs. practical languages
excerpt: Why are languages favored by academics wildly unpopular in industry?
---

The [Functional Programming in Scala](https://www.coursera.org/learn/progfun1) course I'm taking from Coursera has stimulated a (renewed) interest in [Haskell](file+sys:).

For lovers of functional programming, Haskell is the language other functional languages aspire to--uncompromising in its commitment to purity , pursuing fundamental ideas instead of following trends, and actively developed by the smartest functional programmers and academics around.

As an introduction to Haskell, I'm reading the popular [Learn You a Haskell for Great Good!](http://learnyouahaskell.com/chapters), a "gentle" introduction to functional programming in general and Haskell in particular. As with all "gentle" introductions, the book avoids theoretical topics in favor of illustrations, code examples, and grab-bags of useful library functions.

This is fine with me, because my intention is not to _write_ Haskell programs, but to be able to _read_ them fluently--a much easier task, as any student of foreign languages would agree.

Haskell is a trend-setter, much like Lisp, which is perhaps why other languages and communities look up to it. New ideas in functional programming tend to be implemented first in Haskell by the academics and hackers that invent them. If the ideas are judged worthy by the Haskell community, it becomes broadly adopted, and slowly filters outward to other functional language communities over time. [Scala](http://www.scala-lang.org/) is very much inspired by Haskell; even some of its syntax is similar. [Clojure](https://clojure.org/), in turn, took many ideas from Scala, and a few directly from Haskell itself.

Why, then, is Haskell not popular with programmers "in general"?

There are a few possible answers:

- Most programmers first learn to code imperatively, then move on to object-oriented languages. Being forced to _think_ in a purely functional style is frustrating, and most never move beyond the initial frustration.
- Functional programming in general contains many new words unfamiliar to most programmers; Haskell kicks this up to 11 by embracing terms like **monad** and **functor**.
- The Haskell community is full of very smart people, which, intentionally _and_ unintentionally, creates cultural barriers to outsiders.
  - As with many technical communities, there are newly minted amateurs who see themselves as "gatekeepers", whose responsibility is to "weed out" newbies with claims such as "You _must_ know category theory to understand Haskell"[^1].
- Haskell's strengths, like a powerful type system, do not necessarily address "real-world needs", which mostly involve hacking into the software to address the latest ridiculous user demand.
  - This perhaps explains the victory of dynamic languages in the language wars of the 1990's.

If I could compare Haskell to anything, it'd be Latin--something all who claim to be educated (in functional programming) should have a working knowledge of, but which few will use in their jobs.

In summary: learn Haskell (or ML, or some other "academic" language) to expand your way of thinking. It's sure to do so.

---

[^1]: As a math major, I responded by watching [lectures on category theory](https://www.youtube.com/watch?v=BF6kHD1DAeU&list=PLGCr8P_YncjVjwAxrifKgcQYtbZ3zuPlb) by Steve Adowey. While enlightening, it reinforced my initial assumption that the theoretical stuff is not really necessary to "understand Haskell".
