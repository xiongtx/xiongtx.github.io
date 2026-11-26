---
layout: post
title: Using Python with Emacs
excerpt: A first taste of turning a text editor into an IDE.
---

After trying to build my website using HTML, PHP, and the Bluefish Editor for a while, I decided to learn to use a modern web application framework. Of the two popular choices I know of, Django and Ruby-on-Rails, I chose Django because I am more familiar with Python than Ruby.

I also decided to learn to use Emacs as a secondary goal. Many individuals on StackOverflow suggest that spending time and effort to master a text editor such as Vim or Emacs is a sound investment. At first, I was skeptical. Aren't powerful, feature-rich IDE's such as Visual Studio and Eclipse more capable of helping me write code? Emacs is around 35 years old, and I'm wary of software 15 years older than me.

Without a doubt, it's very frustrating to get started with Emacs. What's all this about _points_ and _buffers_? How do I set up a Python REPL? Can I get the nifty auto-completion that Eclipse provides?

The problem was that I kept thinking of Emacs as _just_ a text editor, akin to Notepad. It's better to think of it as an easily customizable and extensible tool that requires the user to tell it what to do.

[Huseyin Yilmaz](http://www.yilmazhuseyin.com/) has written a three-part tutorial on how to configure Emacs, get it to run Python, and work with HTML and such. I followed his tutorial, and therefore won't repeat anything here.

1. [Basic Emacs setup](http://www.yilmazhuseyin.com/blog/dev/basic-emacs-setup/)
2. [Emacs setup for Python development](http://www.yilmazhuseyin.com/blog/dev/emacs-setup-python-development/)
3. [Emacs setup for web development](http://www.yilmazhuseyin.com/blog/dev/emacs-setup-web-development/)

I will, however, give brief descriptions of the components I used, if only so I'll remember what they do.

### Basic Emacs setup tools

- [IDO](http://www.emacswiki.org/emacs/InteractivelyDoThings)
  - Stands for "Interactive Do". Tool that allows for quick directory and buffer switching, as well as quick file search. It's built-in for Emacs 23, so there's no need to install it separately.
- [Autocomplete mode](http://cx4a.org/software/auto-complete/index.html)
  - Tool that provides autocompletion for Emacs.
- [Color themes](http://www.nongnu.org/color-theme/#sec5)
  - Color themes for Emacs. I prefer the Bharadwaj theme. Use `M-x, color-theme-bharadwaj` to select it.

### Emacs setup for Python development tools

- [pymacs](http://pymacs.progiciels-bpi.ca/index.html)
  - Python binding for Emacs. Can be installed separately, or from Fedora repository using `sudo yum install emacs-pymacs`.
- [rope](http://rope.sourceforge.net/)
  - Python refactoring library, not specific to Emacs.
- [rope-mode](http://pypi.python.org/pypi/ropemode)
  - Minor mode for Ropemacs.
- [ropemacs](http://rope.sourceforge.net/ropemacs.html)
  - Rope bindings for Emacs. `pymacs`, `rope`, and `rope-mode` should be installed before `ropemacs`.
- [flymake](http://flymake.sourceforge.net/)
  - On-the-fly syntax checker for Emacs. Not specific to Python. Needs `pyflakes` or some other tool to work.
- [flymake-mode](http://www.plope.com/Members/chrism/flymake-mode)
  - Minor mode for `flymake`
- [pyflakes](http://pypi.python.org/pypi/pyflakes)
  - Passive checker for Python programs.

I have not tried any of the Emacs setup for web development tools yet. I'll provide updates if and when I try them.
