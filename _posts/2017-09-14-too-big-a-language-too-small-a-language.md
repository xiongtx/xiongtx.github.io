---
layout: post
title: Too big a language, too small a language
excerpt: Programming languages should be as practical as necessary, but no more
---

I've recently been looking into some Lisp classics, namely:

- [Paradigms of Artificial Intelligence Programming](http://norvig.com/paip.html) (PAIP), by Peter Norvig
- [The Art of the Metaobject Protocol](https://mitpress.mit.edu/books/art-metaobject-protocol) (AMOP), by Kiczales, Rivières, and Bobrow

and, of course, [Structure and Interpretation of Computer Programs](http://sarabander.github.io/sicp/html/index.xhtml#SEC_Contents) (SICP) by Abelson and Sussman[^1].

PAIP and AMOP are about Common Lisp (CL). SICP is about building computer programs and happens to use Scheme. The contrast between the two languages is dramatic, but both are in a different ways responsible for Lisp never going "mainstream".

Though both Lisps, Common Lisp and Scheme are opposites in their design philosophies. Scheme is a small language; Scheme's R6RS standard is only [90 pages long](http://www.r6rs.org/final/r6rs.pdf), _including indices_. The CL ANSI standard is [over 1,000 pages](http://xahlee.info/comp/Common_Lisp_quotations.html), as is the "informal" standard, [Common Lisp the Language, Second Edition](https://www.cs.cmu.edu/Groups/AI/html/cltl/cltl2.html) (Ctcl2) by Guy Steele[^2].

Scheme prides itself on _minimalism_. It's so minimal, in fact, that there are very few libraries for doing anything "practical"[^3]. A popular joke is that Scheme is the best language--for writing Scheme interpreters. Indeed, that pedagogical use case _does_ seem to be the reason most working programmers touch Scheme at all.

In contrast, Common Lisp prides itself on _maximalism_. It describes itself as an "industrial-strength" Lisp, and was intented to be the One True Lisp, a Lisp to end all Lisps[^4]. No surprise, then, that it became an archetypal case of [design by committee](https://en.wikipedia.org/wiki/Design_by_committee). Though the committee was [full of brilliant people](https://en.wikipedia.org/wiki/X3J13), it was also riddled with compatibility conerns, conflicting corporate interests, and big egos. As Dan Weinreb, co-founder of [Symbolics](https://en.wikipedia.org/wiki/Symbolics) and a committee member, [later recalled](http://people.csail.mit.edu/gregs/ll1-discuss-archive-html/msg02374.html):

> We at Symbolics were forced to insist on [Common Lisp being a Lisp-2], in the face of everyone's knowing that it was not what we would have done absent compatibility constraints.

The inclusion of the [loop](http://www.lispworks.com/documentation/lw51/CLHS/Body/m_loop.htm) macro, one of the committee's [most controversial decisions](http://paulgraham.com/loop.html)[^5], was another case of one faction's interests winning out over good language design.

The result is an enormous language with over 700 functions and not one but _two_ major DSLs (for `loop` and [format](http://www.lispworks.com/documentation/lw50/CLHS/Body/f_format.htm)). Instead of creating a small core language and accompanying it with a large standard library[^6], Common Lisp decided to shove everything and the kitchen sink into the language itself.

If Scheme is too small, Common Lisp is _much_ too big. The enormous number of functions, together with the extensibility of Lisp via macros, means that one person's code could be utterly incomprehensible to another. The large size is in part due to a stunning lack of orthogonality; functions like `count-if-not` and `delete-if-not` shouldn't be necessary with function composition.

It's a real shame that the two defining Lisps took extreme positions along the spectrum of language design. [Arc](http://arclanguage.org/), a much-hyped new Lisp from the early 2000's that was supposed to address these issues, never picked up stream. It wouldn't be until [Clojure](https://clojure.org/)'s arrival in 2008 that the world would finally be treated to a well-designed, practical Lisp.

---

[^1]: Which I return to again and again in a two-steps forward, one-step back fashion.

[^2]: Interestingly, Cltl1 is only ~500 pages. Half the 2nd edition, it seems, was spent describing [loop](http://www.lispworks.com/documentation/lw51/CLHS/Body/m_loop.htm), [CLOS](http://www.gigamonkeys.com/book/object-reorientation-classes.html), and a few other topics.

[^3]: [Racket](http://www.racket-lang.org/), a newer dialect of Scheme, seems to have a [fairly large package repository](https://pkgs.racket-lang.org/). No wonder the main site advertises the language as "batteries included".

[^4]: And that it did. The ANSI standard was published in 1994, Symbolics [filed for bankruptcy in 1996](http://smbx.org/symbolics-bancruptcy-filed/), and Lisp seemed doomed to be consigned to history (or at least the classroom) until [Clojure](https://clojure.org/) came along in 2008.

[^5]: Due to `loop`'s unlispy syntax, difficult-to-understand behavior, and lack of extensibility.

[^6]: Which is how _all_ new languages are designed today, for good reason.
