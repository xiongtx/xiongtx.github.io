---
layout: post
title: Java appletviewer
excerpt: Viewing Java applets when browsers stop supporting them
---

I had a tough time today trying to view Java applets in the browser.

Chrome started deprecating support for NPAPI (the API supporting plugins like Java applets) [all the way back in 2013](https://blog.chromium.org/2013/09/saying-goodbye-to-our-old-friend-npapi.html), and Firefox will [stop supporting it (except for Flash)](https://bugzilla.mozilla.org/show_bug.cgi?id=1269807) in Firefox 52. Oracle is [deprecating](http://openjdk.java.net/jeps/289) (though not removing) support for Java applets in Java 9.

Java applets won't run in Firefox 49, so I tried to [install an older version of Firefox](https://support.mozilla.org/t5/Install-and-Update/Install-an-older-version-of-Firefox/ta-p/1564). This is surprisingly difficult, by design--Mozilla really doesn't want Average Joe to install an older version of Firefox, so they stuck all the older versions in a directory as tarballs.

First, I tried instally 64-bit Firefox 45, but apparently [64-bit Firefox hasn't supported Java applets](https://java.com/en/download/help/firefox_java.xml) since I-don't-know-when. I then installed 32-bit Firefox 45--no dice. 32-bit Firefox _41_? Still doesn't work.

Finally, I found that there's a much easier way to view Java applets: using the bundled `appletviewer`, which works with [both local and remote HTML files](http://docs.oracle.com/javase/8/docs/technotes/tools/windows/appletviewer.html).
