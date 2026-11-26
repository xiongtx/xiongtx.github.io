---
layout: post
title: Split PDF files by bookmarks
excerpt: Sejda, a Java library and CLI utility for manipulating PDF files.
---

[Sejda](http://www.sejda.org/download/) is a Java library and command line utility for manipulating PDF
files. It's the best solution I've been able to find for a free, CLI utility
that can split PDF documents by bookmarks.

There are many websites and desktop applications, mostly non-free, for
manipulating PDF files. Not many, however, offer the ability to split PDF
files by bookmark. Adobe Acrobat [does offer this capability](https://answers.acrobatusers.com/how-split-multipage-pdf-file-q100034.aspx), but it's much too
heavy-weight for the simple tasks I'd like to perform.

PDF files are nice because they're portable and (relatively) tool-friendly
(e.g. you can search PDF documents with [pdfgrep](https://pdfgrep.org/)), although not as
[Emacs-friendly](https://github.com/emacs-helm/helm/wiki/Info-Files) as Info files. Emacs, however, cannot display large PDF files
efficiently, because the default [DocView mode](https://www.gnu.org/software/emacs/manual/html_node/emacs/Document-View.html#Document-View) has to render each page of the
PDF document as an image.

The Common Lisp Recipes book weighs in at 755 pages, which is much too for
DocView to handle. What to do? Well, we'll split the book by chapter.

First, give yourself execution permission on the file:

```bash
chmod +x bin/sejda-console
```

Next, check out the [tutorial](http://www.sejda.org/shell-interface/tutorial/) for available commands. We want
`splitbybookmarks`, which

> Splits a given pdf document before each page where exists a GoTo action in the
> document outline (bookmarks) at the specified level (optionally matching a
> provided regular expression).

The command we want is

```bash
sejda-console splitbybookmarks -f <file-name>.pdf -o <output-dir> -l 2 -e "(.*)([1-9I])(.+)" -p "[BOOKMARK_NAME_STRICT]"
```

Explanations of the command options:

- `-l <level>` means split by bookmarks at `<level>`, in this case `2`, which
  is the level for Common Lisp Recipes' chapters.
- `-e <regexp>` means split only on bookmarks matching the
  `<regexp>`. `([1-9I])` means "bookmarks with names including a digit or the
  letter I", the letter "I" being the first letter of the "Index" chapter. The
  way that we have to specify regexp is a bit strange (having to use `(.*)`
  and `(.+)`).
- `-p <output-prefix-option>` means to use an [output prefix](http://www.sejda.org/development/the-outputprefix-option/) to name
  files. `[BOOKMARK_NAME_STRICT]` uses the bookmark (i.e. chapter) name, but
  strips out non-alphanumeric characters.
