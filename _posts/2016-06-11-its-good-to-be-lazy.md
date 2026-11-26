---
layout: post
title: It's good to be lazy
excerpt: Making things for lazy people takes a lot of work
---
As part of my attempt to introduce good programming practices to my team at work, I created a presentation on good API design. It draws heavily on material covered by Parse CTO Kevin Lacker's [talk at Parse Developer Day 2013](https://www.youtube.com/watch?v=qCdpTji8nxo). The key point that Kevin makes is that

> A good API has to appeal to the most important emotion of all: laziness

A similar sentiment is expressed by [Perl creator Larry Wall](http://threevirtues.com/):

> ...the three great virtues of a programmer: laziness, impatience, and hubris.

Clojure creator Rich Hickey has also observed that [programmers favor _ease_, which is closely related to laziness, over _simplicity_](https://www.infoq.com/presentations/Simple-Made-Easy), which is what good software design demands.

When creating products--especially products for other programmers--it's important that we take the extra effort to **make our products useful to lazy people**. This means, among other things:

- Consistency
  - Every exception to a rule is itself a rule!
- Completeness
  - Documentation as well as code!
- Good defaults
  - [Convention over configuration](https://en.wikipedia.org/wiki/Convention_over_configuration)

It's easy to release a product that is 90% of the way there and say, "the last bit shouldn't be too much work for the user". But if the number of users is large, or each user has to do "the last bit" many times, or if "the last bit" is not obvious, the product may end up performing at far below 90% of its full potential. Depending on the product, it may not perform at all.

When working on a product, it can be easy to lose sight of how much mental real estate a user is willing or able to give to the product. Realizing that a user is _unwilling_ to spend even 15 minutes learning to use, let alone configure and refine, your product is always a shock (if not a wound to the ego).

User experience is something all developers and companies claim to prioritize, but few truly demonstrate it. Going the extra mile could actually have negative effects on a developer--one may end up with a reputation as "the slow guy" on the team who takes an extra week to finish a project. That the product is easy to use and has fewer bugs is something that the user will appreciate, but may not show up in any meaningful developer metrics.

Nonetheless, do go that extra mile. It'll make you a better developer, and you'll feel a lot better about your own work.
