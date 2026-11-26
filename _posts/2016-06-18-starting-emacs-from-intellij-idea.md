---
layout: post
title: Starting Emacs from IntelliJ IDEA
excerpt: For when you really need the ultimate editor
---

I'm a big Emacs user, but Emacs is still not up to par with "real IDEs" when it comes to doing project configuration, code analysis, refactoring, etc., which take up much more time than text editing.

This is especially true for large and complex languages like Java. There are a few traits that make Java particularly difficult to support by editors like Emacs:

- Projects contain lots of files that are not Java source code
- Standard libraries are large and complex
- Third-party libraries are numerous
- The syntax is verbose and complex

I use [IntelliJ IDEA](https://www.jetbrains.com/idea/) when writing Java. IntelliJ IDEA is a powerful IDE, with particularly good support for autocompletion and refactoring. This is important when writing Java, which, in my experience, is a particularly tedious and error-prone language for all the reasons listed above.

Sometimes, however, I really need the editing capabilities of Emacs. The IntelliJ IDEA Emacs bindings work fine most of the time, but being able to open a file directly in Emacs is a totally different animal.

As it turns out, doing so is not difficult. Ken Fox from Atomic Object has a [great post](https://spin.atomicobject.com/2014/08/07/intellij-emacs/) on achieving this through an external command.

Long story short,

1. Go to _File > Settings > Tools > External Tools_ and create a new external tool.
2. Make sure to check **Synchronize files after execution** and uncheck **Open console**.
3. Fill in the following:
   - **Program**: `emacsclient`; I use the `ec` script from [MJ Wall](http://mjwall.com/blog/2013/10/04/how-i-use-emacs/).
   - **Parameters**: `+$LineNumber$:$ColumNumber$ $FilePath$`; confusingly, the parameters are for the `emacs` command, so you won't find them in the `emacsclient` [man page](http://linux.die.net/man/1/emacsclient); check the `emacs` [man page](http://linux.die.net/man/1/emacsclient) instead.
   - **Working directory**: `$ProjectFileDir$`
4. _OK_ out of the dialog.

The external tool can now be found under _Tools > External Tools_, but it would good to add a key binding for it.

1. Go to _File > Settings > Keymap_
2. Go to _External Tools > External Tools > <tool-name>_
3. Hit _Enter_, and select _Add keyboard shortcut_
4. Add a keyboard shortcut; I prefer `Ctrl-c e`.
