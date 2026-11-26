---
layout: post
title: Default editor in GNOME
excerpt: Changing the default text editor in GNOME.
---

Here's a quick tip: you can change the default text editor in GNOME (and
likely any [Free Desktop](https://www.freedesktop.org/wiki/)) by creating a `defaults.list` file in
=~/.local/share/applications/=.

I'm using Emacsclient through a bash script taken from [MJ Wall](http://mjwall.com/blog/2013/10/04/how-i-use-emacs/). After creating
an `ec.desktop` file, where `/my-user-name/` is obviously my user name:

```
[Desktop Entry]
Categories=Utility;TextEditor
Comment=Edit files with the ec command
Exec=/home/my-user-name/.emacs.d/ec %f
Icon=/home/my-user-name/img/emacs.png
MimeType=text/plain
Name=ec
Type=Application
```

I created a `defaults.list` file containing:

```
[Default Applications]
text/plain=ec.desktop
```

And voila! Sure beats having to specify the default editor for _every_ file type!
