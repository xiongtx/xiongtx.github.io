---
layout: post
title: Getting Dell WLAN 1397 Wireless card to work with Fedora 16
excerpt: Installing Broadcom BCM4312 firmware on Fedora 16
---

So I decided to dual-boot my computer with Linux. I've been mildly aware of wireless card problems with Linux before, but I never would have thought that it would be this difficult to get things to work right. Here's the solution, courtesy of a forum post~~ I can't find the link to now~~. Thanks ~~to that mysterious person~~ user `stoat` from fedoraforums.org ([link to post](http://forums.fedoraforum.org/showthread.php?t=264315)) who saved me from hours (more) of frustration.

The Dell WLAN 1397 Wireless card is shown to be the Broadcom BCM4312 802.11b/g LP-PHY (rev 01) card through the `lspci` command. The file needed is called:

```
broadcom-wl-4.150.10.5.tar.bz2
```

It should be floating around on the internet, available through a quick search. Too bad WordPress won't allow upload of `.tar.bz2` files.

Get the file onto Fedora through a USB, then navigate to the containing folder using the terminal. Run the following commands in the terminal:

```bash
tar xjf broadcom-wl-r.150.10.5.tar.bz2
cd broadcom-wl-r.150.10.5/driver
su
b43-fwcutter -w /lib/firmware wl_apsta_mimo.o
```

Finally, restart the computer. Wireless internet should be working.
