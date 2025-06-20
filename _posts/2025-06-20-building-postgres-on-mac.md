---
layout: post
title: Building Postgres on macOS
excerpt: Of course it wasn't going to be straightforward
---

I recently decided to check out [Postgres hacking](https://wiki.postgresql.org/wiki/So,_you_want_to_be_a_developer%3F#How_to_get_started), and ran into a few issues when trying to build on an ARM Mac. The basic three-step of:


```
./configure
make
make check
```

each has a problem that needs to be fixed.


## Dodging the ICU

First, when running `./configure`, there's an [ICU](https://icu.unicode.org/) library issue:

> configure: error: ICU library not found

A [quick search](https://viggy28.dev/article/postgres-v16-icu-installation-issue/) suggests that we need to set the right `PKG_CONFIG_PATH`. `brew info icu4c` offers more information:

```
For pkg-config to find icu4c@77 you may need to set:
  export PKG_CONFIG_PATH="/opt/homebrew/opt/icu4c@77/lib/pkgconfig"
```

Doing so successfully runs `./configure`.

## Make-ing it a little further


Next, when runnning `make`, there's an [issue](https://github.com/theory/pgenv/issues/93) with `strchrnul` on macOS Sequoia when trying to build a recent release like [17.4](https://www.postgresql.org/docs/release/17.4/):

```
snprintf.c:414:27: error: 'strchrnul' is only available on macOS 15.4 or newer [-Werror,-Wunguarded-availability-new]
  414 |                         const char *next_pct = strchrnul(format + 1, '%');
      |                                                ^~~~~~~~~
snprintf.c:366:14: note: 'strchrnul' has been marked as being introduced in macOS 15.4 here, but the deployment target is macOS 15.0.0
  366 | extern char *strchrnul(const char *s, int c);
```

Note that this occurs on 15.4 too, even though the error message says `strchrnul` is available on 15.4 and newer.

This has been [fixed](https://www.postgresql.org/message-id/385134.1743523038@sss.pgh.pa.us) on `master`, so just `git pull` the latest.

## Don't SIP while you test

Running regression tests with `make check` gives yet another error:

```
dyld[65265]: Library not loaded: /usr/local/pgsql/lib/libpq.5.dylib
```

`make check` runs tests against a [temporary installation](https://www.postgresql.org/docs/current/regress-run.html#REGRESS-RUN-TEMP-INST), which requires remapping library paths with `DYLD_LIBRARY_PATH`. However, macOS's [System Integrity Protection](https://support.apple.com/en-us/102149) (SIP) mechanism [prevents](https://briandfoy.github.io/macos-s-system-integrity-protection-sanitizes-your-environment/) `DYLD_` and `LD_` environment variables from being passed to child processes.

There have been [attempts](https://www.postgresql.org/message-id/CA+HWA9Zhz+QqaKrWkBd4UVfxL1FANJvRyCTFY5J_hq3AhDBpJQ@mail.gmail.com) to fix this within Postgres, but no uptake due to the large number of locations where changes have to be made.

The Postgres [installation docs](https://www.postgresql.org/docs/current/installation-platform-notes.html#INSTALLATION-NOTES-MACOS) note that we can run [`make installcheck`](https://www.postgresql.org/docs/current/regress-run.html#REGRESS-RUN-EXISTING-INST) to [avoid](https://www.postgresql.org/docs/current/regress-run.html#REGRESS-RUN-EXISTING-INST) the temporary installation. However, it's easier to just [turn off](https://developer.apple.com/documentation/security/disabling-and-enabling-system-integrity-protection) SIP.

Naturally, the official instructions for turning off SIP [don't work](https://discussions.apple.com/thread/253397576):

> The OS environment does not allow changing security configuration options.
> Ensure that the system was booted into Recovery OS via the standard user action.

We need to first run `csrutil clear`, then restart into Recovery Mode again, run `csrutil disable`, and restart normally.

After that, we successfully run regression tests:

```
$ make check
...
# All 228 tests passed.
```
