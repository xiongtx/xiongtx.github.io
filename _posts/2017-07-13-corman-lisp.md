---
layout: post
title: Corman Lisp
excerpt: An interesting story of Lisps, by Roger Corman
---

I had the pleasure today of attending a Common Lisp / Clojure meetup at [Factual](https://www.factual.com/jobs#problems) SF. The talk was given by Roger Corman, creator of [Corman Lisp](http://www.cormanlisp.com/), on his personal history with Lisps. It was equal parts educational and entertaining, and gave real insight into how different the world of programming was 35 years ago.

Roger began by explaining how he got into Lisp: he was a computer science and music major, and a music professor interested in using Lisp to generate [Gregorian chants](https://en.wikipedia.org/wiki/Gregorian_chant) introduced him to [LISP 1.5](http://wiki.c2.com/?LispOnePointFive). The two corresponded by writing LISP by hand on postcards--there was no email in 1982! He's kept a whole album of the exchanges, presumably for donation to a museum at some point.

The next Lisp he worked on was [PowerLisp](http://www.cormanlisp.com/PowerLisp.html), so-named because it was developed on a [PowerPC](https://en.wikipedia.org/wiki/PowerPC). A Lisp compiler in the late 1980's / early 1990's cost $500, a princely sum. PowerLisp, despite being quite slow due to poor garbage collection and other reasons, proved to be rather popular due to its price of zero, and was even shipped by AOL on CDs.

The next Lisp is the one Roger is most famous for: Corman Lisp, a Lisp specialized for the Windows platform. The idea came when [Fritz Kunze](https://en.wikipedia.org/wiki/Franz_Inc), founder of [Franz Inc](https://franz.com/), asked him to come in for a discussion on porting [Allegro CL](https://franz.com/products/allegrocl/) to the Mac. Roger noticed that Franz targeted Unix, had little interest in Mac, and didn't care at all about Windows, despite the rising popularity of the latter as a platform in the mid 90's. Roger saw an opportunity and started Corman Lisp, the first (and perhaps to date only) CL to target the Windows platform.

Work on Corman Lisp slowed down somewhat in the mid-2000's, and stopped completely around 2008-09, when the Great Recession hit Roger's consulting company hard and he dedicated his time to keeping the business alive. Recently, however, [Zach Beane](http://xach.com/) convinced Roger to [open-source](https://github.com/sharplispers/cormanlisp) Corman Lisp, to which he gladly obliged. Since then, it's attracted some capable contributors giving it a new lease on life.

It's a fascinating history of Lisp, and one that I'm not sure has been told until today. A big thanks to Roger and Factual for hosting the event!
