---
layout: post
title: Decompiling Java classfiles in Emacs
excerpt: If you have an itch, Emacs helps you scratch it
---

Working with Clojure, I've often run into situations in which I've needed to decompile Java classfiles. This is especially true when working with packages that break backward compatibility[^1] (I'm looking at you, [Kafka](https://kafka.apache.org/)).

Often, the most straightforward way to track down a bug is to look at source code, and if only bytecode is available, it's time to bring in the decompilers. There are a a number of high-quality Java decompilers available today:

- [CFR](http://www.benf.org/other/cfr/)
- [Fernflower](https://github.com/JetBrains/intellij-community/tree/master/plugins/java-decompiler/engine)
- [Procyon](https://bitbucket.org/mstrobel/procyon)
- [JD-Core](https://github.com/nviennot/jd-core-java)
- [Krakatau](https://github.com/Storyyeller/Krakatau) (Python)

and more. This is a far cry from a mere decade ago, when the best decompilers were quite poor and often proprietary.

Most of these decompilers are command-line tools, however, with a few having third-party GUIs (e.g. [JD-GUI](http://jd.benow.ca/) for JD-Core,  [Luyten](https://github.com/deathmarine/Luyten) for Procyon). Fernflower is somewhat of an exception--it's a plugin, designed for use inside of [IntelliJ IDEA](https://www.jetbrains.com/idea/).

Since relying on third-party apps is not The Emacs Way, I decided to put together a package, [JDecomp](https://github.com/xiongtx/jdecomp), that makes using various decompilers easy. It currently supports CFR and Fernflower, with intended support for more Java decompilers in the future.

Try it out and let me know what you think. Happy hacking!

---

[^1]: Which is very much against Java culture. For more on why backward compatibility should _never_ be broken, see [Rich Hickey's keynote](https://www.youtube.com/watch?v=oyLBGkS5ICk) from [Clojure/conj 2016](https://clojure.org/events/2016/clojureconj).
