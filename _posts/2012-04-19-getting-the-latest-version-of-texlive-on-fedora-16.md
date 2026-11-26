---
layout: post
title: Getting the latest version of TeXLive on Fedora 16
excerpt: Installing TeXLive 2011 manually and managing packages with tlmgr
---

In line with Fedora's (and many other Linux distributions') design philosophy, all installed packages should be managed centrally through `yum`. This is great in principle, because it allows all software on the system to be updated with a single click.

The downside is that not all desired packages are available through Fedora's official repositories. Or, if they are, they may not be regularly updated and properly maintained. The Fedora team also strips out package features that allow updates independent of the operating system.

In this case, I wanted to use TeXLive 2011, but the pre-installed version is TeXLive 2007 (recall that this is the middle of 2012). An update seems to be in progress, but won't be 100% complete until Fedora 17[^1].

Even if TeXLive 2011 was available, however, the policy on banning alternate update methods means that a part of the TeXLive distribution, `tlmgr`, will be stripped out. `tlmgr` allows connection to a LaTeX repository and automates the installation/removal of LaTeX packages.

Since I needed some external packages and `tlmgr`, I downloaded TeXLive manually (see [here](http://www.tug.org/texlive/acquire-netinstall.html) for instructions). I also needed to install some packages not available via LaTeX repositories. Here's how to install packages using `tlmgr` and by hand:

## By `tlmgr`

`BASH` is unable to find `tlmgr` without being told its location. To do so, use the `export` command. The overall process of launching `tlmgr` is:

- Log into shell as root user.
- Run: `export PATH=/usr/local/texlive/2011/bin/x86_64-linux:$PATH`
- Run: `tlmgr --gui`
- Install packages via the GUI

## By hand

- Log into shell as root user
- Run: `mkdir /usr/local/texlive/2011/texmf/tex/latex/[directory_name]`
- Run: `mv [file_path] [new_directory_path]`
- Run: `texhash /usr/local/texlive/2011/texmf`

`texhash` updates the package database.

---

[^1]: In the meantime, partial updates can be installed using directions found [here](http://fedoraproject.org/wiki/Features/TeXLive).
