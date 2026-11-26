---
layout: post
title: Syntax highlighting on Wordpress.org blog
excerpt: Choosing a syntax-highlighting plugin for self-hosted WordPress
---

Syntax highlighting on `Wordpress.org` blog requires a plug-in, while syntax highlighting on `Wordpress.com` is built-in.

Different plug-ins use different methods for highlighting code. Some use the `pre` tag, some use the `code` tag, while the rest use various forms of shortcode such as `[code][/code]` or `[language_name]`.

Ideally, I'd like my syntax highlighter to fulfill the following criteria:

1. Use Alex Gorbatchev's [SyntaxHighlighter](http://alexgorbatchev.com/SyntaxHighlighter/) library
2. Auto-format code
3. Collapse/expand large code blocks

Despite the large number of syntax-highlighting plugins available, there are none that fulfill all of these criteria. In the end, I settled for what seems to be the most popular plug-in, Viper007Bond's [SyntaxHighlighter Evolved](http://wordpress.org/extend/plugins/syntaxhighlighter/). It uses Alex's SyntaxHighlighter and allows the viewer to expand code that is initially collapsed, but there is no auto-formatting capability and no way to re-collapse the code.

A bonus is that it supports the `[sourcecode language="language_name"][/sourcecode]` tag, which is the same shortcode that `Wordpress.com` uses, so I don't have to reformat my old posts (not that there are too many).

Here is a code sample using the default theme:

```cpp
#include <iostream.h>
main()
{
	char C = 64;
	cout << C++ << " ";
	C = 96;
	return 0;
}
```
