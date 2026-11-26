---
layout: post
title: Category theory
excerpt: The foundations of Haskell
---

As I've been learning some Haskell with the excellent [Learn You a Haskell for Great Good!](http://learnyouahaskell.com/chapters), I've come across [category theory](https://ncatlab.org/nlab/show/category%2Btheory#idea), which is the theoretical mathematical foundation of Haskell, in much the same way that lambda calculus is the foundation of Lisp.

As with any field of expertise, you often hear exaggerated claims like "you can't _really_ understand Haskell unless you understand category theory"; I've heard similar claims about Lisp and lambda calculus, so I knew not to take such claims very seriously. While learning the theoretical foundations will improve understanding, which is a good thing, it is certainly not _necessary_ to use the language proficiently.

Imagine requiring every driver to understand thermodynamics, or simply the basics of automobile construction, before they get to turn the keys on a car--we'd have very few drivers. These sorts of claims, which are usually made by amateurs rather than experts, serve as a **gatekeeping mechanism** to prevent the "everyman" from joining the language community.

As a math major, however, my curiosity was piqued. While I was learning Lisp, I had read Greg Michaelson's [An Introduction to Functional Programming Through Lambda Calculus](https://www.cs.rochester.edu/~brown/173/readings/LCBook.pdf), which is a fine introduction to the topic.

I looked for a similar introduction to category theory, and came across [Steve Adowey's lectures](https://www.youtube.com/watch?v=BF6kHD1DAeU). The lectures are from the University of Oregon's [2012 summer school on Logic, Languages, Compilation, and Verification](https://www.cs.uoregon.edu/research/summerschool/summer12/curriculum.html). Lecture notes, exercises, and Prof. Adowey's textbook [available on his website](http://www.andrew.cmu.edu/user/awodey/SummerSchool/).

Category theory is, as Prof. Adowey puts it, the **abstract algebra of functions**. It is definitely a harder topic to approach than lambda calculus. To begin, you'll need a good grasp of abstract algebra and be _very_ comfortable with mathematical abstraction. In fact, the greatest benefit I've derived from learning category theory has been to exercise my "abstraction muscles".

Learning category theory while studying Haskell is doubly useful, because I get to _apply_ the knowledge to something concrete--which is not often the case in mathematics. Thanks to category theory, I have a better understanding of what types, functions, and functors are. Much to my frustration, however, monads are still a ways off--they are not covered until the last chapter of the textbook.

Has learning category theory made me a better programmer? I don't think so, but that's not _why_ I'm learning it. I'm learning it purely out of curiosity about the foundations of programming. That's the only _good_ reason, I think, for a developer to spend time on the topic.
