---
layout: post
title: Don't be a hacker
excerpt: '"Hacking" is not a satisfactory way of writing software'
---

I've recently been working on improving the help functions for Emacs (e.g. `describe-variable`). The particular file I've been looking at is [`help-fns.el`](https://github.com/emacs-mirror/emacs/blob/master/lisp/help-fns.el).

What really struck me is how _hacky_ much of the functionality seems to be. The file is littered with regexps (a clear sign that data is being treated as [stringly typed](http://c2.com/cgi/wiki?StringlyTyped)), comments on edge cases that don't work, and lamentations that such-and-such functionality simply isn't "good enough".

This is really surprising, since the data that help functions work with are from Emacs itself. "String typing" and other workarounds are often necessary for gluing together disparate systems or working with poorly-designed interfaces, but there's really no reason to do this when all the data comes from your own system[^1].

This leads me to a conclusion I've made for quite some time:

> "Hacking" is not a satisfactory way of writing software

I was a math and engineering major. Briefly,

- **Math:** the solution is correct
- **Engineering:** the solution is not exactly correct, but I have carefully analyzed the margin of error and found it to be satisfactory
- **Hacking:** it _seems_ to work, and is _mostly_ good enough for my _current_ use case

Programming culture seems to value quickly putting together prototypes, which are then inevitably shipped as the final product. I don't understand this mentality. At first, I thought that it must be the business aspect that is applying pressure towards this end, but the phenomenon seems to happen with a lot of free and open-source software as well.

Prototyping is important, but it should be the first step, not the whole step. A real solution should tackle the problem at the right level of abstraction, solving it (or even the whole class of problems like it) in an elegant way. This takes time and comprehension, which the open source world should have in plenitude.

---

[^1]: I suspect the predilection for regexps is due to Emacs being viewed as a "text editor" whose "primitives" are strings, buffers, etc. Actually, Emacs Lisp has [many data types](https://www.gnu.org/software/emacs/manual/html_node/elisp/Sequences-Arrays-Vectors.html), and strings are most often _not_ the right data format to use until the final step of **presenting** data.
