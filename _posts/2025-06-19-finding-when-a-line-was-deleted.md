---
layout: post
title: Finding when a line was deleted
excerpt: git-blame --reverse and git log come to the rescue
---

[`git blame`](https://git-scm.com/docs/git-blame) is a very useful tool for finding out when a line in a file was added or changed. I mostly use it through [Magit](https://magit.vc/manual/magit/Blaming.html), and it's helped identify when a regression was introduced on many occasions. However, sometimes it's useful to know the opposite: given a line in an older commit, when was it later modified or deleted?

Fortunately, there's `git blame --reverse`, which works like:

```sh
git blame --reverse <old commit>..<new commit> <file>
```

For each line corresponding to file state in `<old commit>`, it reports last commit between `<old commit>` and `<new commit>` where the line remained unmodified.

Consider the following example with file `test.txt`:

| Commit  | Message  |
|:--------|:---------|
| c7e761c | Delete B |
| 6983da5 | Add C    |
| 0bc06ca | Add B    |
| 2686bf3 | Add A    |

In `2686bf3` we add `A`:

```
A
```

In `0bc06ca`, we add `B`:

```
A
B
```

In `6983da5`, we add `C`:

```
A
B
C
```

And in `c7e761c`, we delete `B`:

```
A
C
```

Suppose we want to find the commit that deleted `B`. We can start at `0bc06ca` (or any commit where `B` is still present) and stop at `HEAD`[^1]:

```
git blame --reverse 0bc06ca..HEAD test.txt
```

This gives the following:

```
c7e761c7 (Tianxiang Xiong 2025-06-19 12:48:12 -0700 1) A
6983da5c (Tianxiang Xiong 2025-06-19 12:48:03 -0700 2) B
```

We can see that `6983da5c` was the last commit where `B` was unmodified. The next commit would be the one to delete it. We can find that commit with `git log` (or better yet, `git log --reverse`, so older commits are shown first and we don't need to scroll):

```
git log --reverse 6983da5c^..HEAD
```

```
commit 6983da5c7bca0c2b1a81f8611ba1eeeb83b7f9fd
Author: Tianxiang Xiong <tianxiang.xiong@gmail.com>
Date:   Thu Jun 19 12:48:03 2025 -0700

    Add C

commit c7e761c7c87540f69e2cae8749b0e3a89c69a794 (HEAD -> master)
Author: Tianxiang Xiong <tianxiang.xiong@gmail.com>
Date:   Thu Jun 19 12:48:12 2025 -0700

    Delete B
```

So we see that `c7e761c` is the one that deleted `B`.

---

[^1]: In Magit, `magit-blame-reverse` must be used on a _blob_--a file being visited from an older commit. Checking out the older commit and calling `magit-blame-reverse` from the file doesn't work, as it would be the most recent known state.
