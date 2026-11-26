---
layout: post
title: Being too clever with LaTeX files
excerpt: The backwards-compatibility headache of shared LaTeX preambles
---

After several years of using LaTeX for various reports and lab write-ups, I feel that I've got a pretty comfortable set-up going. This is a far-cry from freshman year, when I spent entire nights in the computer lab (didn't have a laptop back then) trying to figure out why my document in Emacs wasn't compiling (it was inevitably because of a single misplaced symbol).

Perhaps due to the steep learning curve, I find that I am one of only a few engineers who use LaTeX regularly. Everyone else seems determined to stick to Microsoft Word, or, at best, LibreOffice Writer.

For general purposes, I have a document called `report_prototypes.tex` that includes several other files:

1. The first file is called `custom_headings_1.tex`, which contains a lot of general preamble stuff.
2. The second file is called `graphics_1.tex`, which contains exactly one thing: a command to generate an image page divider. It's pretty useless for now.
3. The third file is called `proofs_headings_1.tex`, which contains stuff related to mathematical proofs.

It's a fine setup, and I've even got it working on both Windows and Linux using the `ifplatform` package:

```latex
\usepackage{ifplatform}
\ifwindows
  \newcommand{\dropboxprefix}{D:/Dropbox/Code_Library/LaTeX}
\else
  \newcommand{\dropboxprefix}{/home/txx/Dropbox/Code_Library/LaTeX}
\fi
```

However, today I ran into a problem. The `subfig` package I've included as part of `custom_headings_1.tex` has been deprecated; in fact, it's been deprecated since mid-2011, and I simply hadn't known about it. The new package, [`subcaption`](http://www.ctan.org/pkg/subcaption), has much more sensible syntax.

Long story short, I eagerly changed `custom_headings_1.tex` to use the new package, before I realized that this can't be done. The problem is that all of my old documents are dependent on `custom_headings_1.tex` and its `subfig` package. If I change it, the old documents would no longer compile. Therefore I had no choice but to create a new `custom_headings_2.tex` file to accommodate this tiny update. Of course, every time I make an update in the future, I'll have to create a new headings file while making sure I don't lose the old ones.

In some ways this is really unavoidable. The current situation still beats including local copies of headings files with every new document by a long shot. However, it's an inconvenience I hadn't thought about when I first came up with the method of including shared headings files. It just goes to show that the best-laid plans can be stymied, or at least inconvenienced, by the smallest obstacles.
