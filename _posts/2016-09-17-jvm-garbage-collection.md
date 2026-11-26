---
layout: post
title: JVM garbage collection
excerpt: Memory management on the JVM
---

Now that I'm [programming Clojure professionally](https://www.fundingcircle.com/us/simplified-loans/?utm_source=google&utm_medium=cpc&utm_campaign=Brand-Search-Alpha&utm_term=funding_cir&utm_device=c&utm_placement=&mkwid=s93IeB55P_dc&pcrid=75110439889&pkw=funding%20cir&pmt=e&gclid=Cj0KEQjw0_O-BRCfjsCw25CYzYoBEiQAqO9BDKyTawip2PrNG9QrWf1J1O-7E2DKBVcOA6L8Toc1sWcaAjiz8P8HAQ), I wanted to learn more about Java and the JVM. Much of the work we do involves Java interop with third-party libraries.

Creating thin wrappers around Java libraries is a common practice in the Clojure community, which is too small to write everything it needs in Clojure (especially when there are Java libraries readily available). What's more, writing Java libraries allows sharing with other JVM languages like [Scala](http://www.scala-lang.org/).

I started by tackling an topic about which I knew very little: the [JVM garbage collector](http://www.oracle.com/webfolder/technetwork/tutorials/obe/java/gc01/index.html) (GC). I knew that the GC is a program that occasionally runs to free memory, and thus relieve programmers of the burden of memory management, but little beyond that. I suspect that most developers are at the same level: they know that the GC exists and what it's supposed to do, but not the specifics of how it goes about doing it.

Fortunately, [Kevin Jones of Pluralsight](http://app.pluralsight.com/author/kevin-jones) has created an excellent [introductory course](https://app.pluralsight.com/library/courses/understanding-java-vm-memory-management/table-of-contents) to JVM memory management. It's well worth checking out!

## Memory regions

The way the JVM manages memory is not as complex as I thought. Basically, memory is divided into several regions:

- **Young generation**
  - Region more frequently GC'ed
- **Old (tenured) generation**
  - Region less frequently GC'ed
  - Where objects that survive a number of GCs above some threshold are copied.
- **Permanent generation** / **metaspace**
  - Where objects are never GC'ed
  - Permanent generation is [replaced by metaspace in Java 8](https://dzone.com/articles/java-8-permgen-metaspace).

The young generation is further divided into several spaces:

- **Eden space**
  - Where new objects are allocated
- **Survivor spaces**
  - Usually two, where objects that survive GC are copied before being **promoted** to old generation

## GC process

The high-level memory allocation-deallocation process goes something like this:

1. A new object is allocated to Eden space
2. Some time later, **minor collection** begins in the young generation
3. Starting from a set of **root references**, the GC follows references and _marks_ those that it finds as "live" references.
4. Objects referred to by live references are copied to a survivor space (call it \( S_1 \))
5. Objects in other survivor space (call it \( S_2 \)) are copied to \( S_1 \)
6. Objects that survive GC have their "survival counter" increased by 1
7. Memory is _swept_ clean in Eden space and \( S_2 \)
8. Survivor spaces are swapped, so that the next round of GC copies from \( S_1 \) to \( S_2 \)
9. Objects whose survival counter is above a certain threshold are copied the old generation
   - The heuristic is that an object that survives a few GCs is stick around for a long time, and therefore does not need to be checked for GC each time
10. If the old generation has too many objects, **major collection** beings
    - For Oracle's JVM, major collection is always followed by a minor collection; the combination is a **full GC**

## Garbage collectors

JVM has a number of GC algorithms available:

- Serial
- Parallel for young space, serial for old space
- Parallel for young and old space
- Concurrent mark-sweep (CMS) with serial young space
- Concurrent mark-sweep with parallel young space
- G1

There are different trade-offs between these GCs, which are explained in detail by Kevin and [Oracle](http://www.oracle.com/webfolder/technetwork/tutorials/obe/java/gc01/index.html).

Overall, I learned a lot in 2 hours' worth of lessons. It would be nice if Kevin had mentioned how other programming languages do GC (**reference counting** was mentioned in the context of [COM](https://en.wikipedia.org/wiki/Component_Object_Model)), if there are superior algorithms available, etc., but I can't really complain, since the course is clearly JVM-specific.
