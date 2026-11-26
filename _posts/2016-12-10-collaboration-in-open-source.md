---
layout: post
title: Collaboration in open source
excerpt: How to organize contributors to open source projects?
---

The [emacs-devel](https://lists.gnu.org/archive/html/emacs-devel/) mailing list recently lit up with a new controversy, as it is wont to do from time to time, regarding a proposal for a "portable dumper". Jonathan Corbet kindly wrote up a [summary of the events](https://lwn.net/Articles/707615/) as of the end of November.

In short, there is a technical issue on which stakeholders have different opinions, and tensions rose steadily as discussion turned less technical and more personal. [Daniel Colascione](https://github.com/dcolascione), author of the portable dumper[^1], has expressed intense frustration at the unwillingness of Eli Zaretskii, current Emacs co-maintainer, to consider merging the patch. Jonathan summarizes the technical minutiae well, but the technical issues are not what's prompted such heated discussion.

## Organization and authority

Every open-source project faces a fundamental question, one which all human organizations grapple with: **who gets to make decisions**?

Many open-source projects, starting with [Perl](https://www.perl.org/), have gone with the "benevolent dictator" approach. The progenitor of the project, who may no longer contribute any code, serves as project manager and ultimate arbiter of what direction the project goes in, what code should be included, etc.

Other projects choose to be governed by committee instead. C++, for example, has a standards committee. The problem with this approach are well known: [design by committee](https://en.wikipedia.org/wiki/Design_by_committee) is how C++ ended up becoming the complex beast it is today. Standards committees, in particular, tend to include members whose interest are diametrically opposed with each other's, resulting in conflict[^2] and stagnation[^3].

Even worse is a model in which a committee exists, but revolves around a charismatic leader. [Python](https://www.python.org/) has just such a model, in which complex layers of bureaucracy all lead to Guido van Rossum, resulting in awful decisions like breaking backward compatibility between [Python 2 and 3](https://www.digitalocean.com/community/tutorials/python-2-vs-python-3-practical-considerations-2).

Emacs, being a project of the [Free Software Foundation](http://www.fsf.org/) (FSF), is not governed by a benevolent dictator or committee, but rather by a "gerontocracy" of long-time contributors. In the early days Richard Stallman (rms) decided what went into Emacs, but as the project grew and an increasing proportion of his time was taken up by traveling and speaking, those who spent the most time on the project ended up becoming decision-makers.

## Old and new

Being governed by people who've been around a long time has certain advantages. For one thing, the decision-makers are Emacs experts and know what they're talking about, down to the smallest technical details.

A major disadvantage, though, is that it raises the barrier of entry for new contributors. Putting aside the inconveniences[^4] of actually submitting a patch for Emacs, it's very difficult to get anything accepted--new ideas that deviate from Emacs' long-established behavior--like the portable dumper--are viewed with suspicion, and breaking backward compatibility is nearly always a no-no[^5].

## Don't just do something, stand there

To get anything accepted into Emacs, it's best for new contributors to first post an issue to the mailing list, then propose--in words, not code--a solution. A slow, torturous discussion[^6] is sure to follow regarding basic strategy. At some point, the contributor should propose creating a proof of concept (POC), which should in fact be a thorough and complete solution to the problem. If the POC is too cursory, it'll need many rounds of code review, and reviewers may take a long time to go through the code, if they bother following the discussion at all.

The key to winning over stakeholders is to demonstrate that you've thought long and hard about the patch's impact on the project and its users, and that, if it's something which will require ongoing maintenance, you'll be the one doing the maintaining. What's really at stake is demonstrating that you're a reliable and trustworthy individual who won't contribute a piece of code, then disappear, burdening other maintainers with it.

## Poisoning the well

Where Daniel's good intentions went wrong is that he submitted a patch with several thousand lines of non-trivial C code, then listed a number of (good) reasons why his code should be merged. This goes against the usual process of discussing the problem with stakeholders first. Once the well's been poisoned, discussion quickly became less about the technical issues and more about a relatively new member of the community threatening its norms.

The FSF was founded not merely as an open-source software shop, but as an ideological organization promoting a certain type of software and a way of developing that software. The process is at the heart of the project, and becoming a member of the community means following it closely. Changing the process, if it could be done at all, is a long-term effort, and certainly not something that's welcomed by a newcomer.

---

[^1]: And other low-level functionality for Emacs, including support for [double-buffered rendering](https://www.facebook.com/notes/daniel-colascione/buttery-smooth-emacs/10155313440066102/).

[^2]: See the [Common Lisp standards committee](https://en.wikipedia.org/wiki/X3J13)

[^3]: No new Common Lisp standard has been put out since the initial version in 1994, and none are forthcoming.

[^4]: Signing the contributor's agreement, navigating a mail-based bug tracker, corresponding via mailing list (instead of, say, GitHub issues), and so on.

[^5]: There are advantages to maintaining backward compatibility, as the Java ecosystem has shown, but keeping big mistakes around prevent a project from moving forward.

[^6]: More so if the issue is a deep or important one
