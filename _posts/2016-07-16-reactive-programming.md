---
layout: post
title: Reactive programming
excerpt: A surprisingly hard concept to define
---

I'm currently taking the [Functional Programming in Scala](https://www.coursera.org/learn/progfun1) course from Coursera, which covers a bit of **functional reactive programming** (FRP). While the course is excellent overall, the material on functional reactive programming seems rushed and incomplete.

In a [single week](https://www.coursera.org/learn/progfun2/home/week/4), we are introduced to FRP, latency, combinators, futures, and more. It seems like too much material to cover in a week, and fails to answer the most important question of all:

> What is reactive programming?

As it turns out, there was a separate course, [Principles of Reactive Programming](https://www.lightbend.com/blog/principle-of-reactive-programming-coursera), that covered this topic exhaustively. However, it is no longer available on Coursera. I do not know whether it will still be available again; the old course page seems to redirect to the Functional Programming in Scala course.

There is a [video from that course](https://www.youtube.com/watch?v=7D9QfMj_KwI), available on YouTube, that tries to answer just this question. In it, Prof. Martin Odersky provides some context on the changing requirements of web services (from 10's of servers to 1000's, hours of downtime per month to none, etc.), as well as the key properties of reactive applications:

- Event-driven (react to events)
- Scalable (react to load)
- Resilient (react to failures)
- Responsive (react to users)

However, this is a _description_, not a _definition_. It's like saying that an elephant is large, gray, and has a long nose; I'm looking for the precise phylogenetic classification.

Fortunately, [The Introduction to Reactive Programming You've Been Missing](https://gist.github.com/staltz/868e7e9bc2a7b8c1f754), by André Staltz, doesn't mince words:

> Reactive programming is programming with asynchronous data streams.

In fact, this definition meshes well with the one provided by the description of the Reactive Programming course:

> Reactive programming is an emerging discipline which combines concurrency and event-based and asynchronous systems.

Alright--reactive programming is about working with **asynchronous** events presented as **streams**. Functional programming is just a paradigm that makes manipulating those streams (mapping, filtering, composing, etc.) easy.

I still wish the old Reactive Programming course was available to provide more details and implementations, but this seems like a good start.
