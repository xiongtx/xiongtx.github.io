---
layout: post
title: An adventure in resizing partitions
excerpt: A simple task is surprisingly hard
---

Recently I began working with some [VirtualBox](https://www.virtualbox.org) VMs. My [Asus Zenbook](https://www.amazon.com/gp/product/B00SGS7ZH4/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1), which comes with 256 GB of SSD dual-booted with Windows and Fedora, soon found its Fedora installation aching for more disk space.

So I fired up [GParted](https://gparted.org), shrank the Windows partition, and tried to extend the Fedora one. Well, turns out you can't modify a partition that GParted is running from (duh!), so I created a [Fedora Live USB](https://docs.fedoraproject.org/en-US/quick-docs/creating-and-using-a-live-installation-image/index.html) with [Fedora Media Writer](https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/install/Preparing_for_Installation/#_fedora_media_writer), booted into the live image, and installed GParted. I moved the unallocated space to the right of several partitions, but it came to the Fedora partition, I again found that I couldn't modify it. What's going on?

Turns out that the Fedora partition is set up as a [logical volume group](https://www.digitalocean.com/community/tutorials/an-introduction-to-lvm-concepts-terminology-and-operations)[^1]. The volume group contains several logical volumes like `root`, `home` (the one I'm interested in adding more space to), and `swap`. By default, Fedora uses swap space when it's available, and since `swap` is being used, the partition is locked. So I had to turn off swap and unmount the partition:

```bash
swapoff -a
umount /dev/fedora/swap
```

And now I'm able to extend it! Phew!

After GParted finished resizing the partitions, I rebooted and...disaster! After being stuck on the logo for what seemed like an eternity, Fedora dropped into a `dracut` console and complained that

> Warning: /dev/fedora/swap does not exist

Turns out that by turning off swap and resizing the partition, I'd [gotten rid of the swap volume](https://creativeandcritical.net/help-articles/how-to-safely-delete-swap-volume-extend-root-volume-fedora-20) altogether!

OK, no need to panic. After `exit` from `dracut`, Fedora was able to reboot. A look at the [System Monitor](https://wiki.gnome.org/Apps/SystemMonitor), though, confirmed that no swap space was being used. This is a real [bummer for performance](https://haydenjames.io/linux-performance-almost-always-add-swap-space/), so I had to add the swap space back.

The easiest way to do this was to create a logical volume with the same name as the old one so that I didn't need to modify `/etc/fstab`. Fortunately, the internet is [full of good tutorials](https://www.2daygeek.com/how-to-create-extend-swap-partition-in-linux-using-lvm/) on how to do this:

```bash
sudo lvcreate -L 8G -n swap fedora
sudo mkswap /dev/fedora/swap
sudo swapon -va
```

Great! I've got swap space back.

A look at `df -h`, however, showed that `/dev/mapper/fedora-home` hadn't actually increased in size. Even though we'd increased the size of the volume group, we hadn't specified that the space should be used by a logical volume and file system. So it's off to the internet again to [figure out how to do that](https://www.rootusers.com/lvm-resize-how-to-increase-an-lvm-partition/):

```bash
sudo lvextend -l +100%FREE /dev/fedora/home # to use all the free space in the volume group
sudo resize2fs /dev/fedora/home # since the volume is ext4
```

Finally! I've enough disk space to work with my VMs without running into `DISK_FULL` errors.

---

[^1]: This is the default for new Fedora installations, though in my case it's not really necessary, as I only have one hard drive.
