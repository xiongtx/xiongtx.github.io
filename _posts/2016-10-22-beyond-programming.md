---
layout: post
title: Beyond programming
excerpt: For developers, it's not enough to "code"
---

The rise of the [DevOps](https://newrelic.com/devops?_bt=51484354916&_bk=%2Bdev%20%2Bops&_bm=b&_bn=g) role over the past few years has been meteoric. [Entire companies](https://www.pagerduty.com/) now exist to serve this niche, and, by all accounts, DevOps personnel are in _very_ high demand[^1].

Wikipedia has a nice Venn diagram showing what DevOps is:

![](https://upload.wikimedia.org/wikipedia/commons/b/b5/Devops.svg){: width="400px" }

As a developer, it's easy to look at this and think that it's just a rebranding of IT.

Having worked with DevOps for a while, however, I've realized that it's much more than that. It's not merely that IT has moved closer to development--development has also moved closer to IT.

## Everything as a service

The nature of software has changed dramatically over the past few years. More web, more (micro-) services, less personal computer. In many ways, we're going [back to Big Iron](http://www.winestockwebdesign.com/Essays/Eternal_Mainframe.html).

These days, for reasons including:

- Ease of deployment
- Scale
- Customer lock-in
- Intellectual property rights

companies want everything to be a web service. This means an awful lot of infrastructure--so much so that it's a lot cheaper and more reliable to leverage the expertise of [Amazon](https://aws.amazon.com/), [Microsoft](https://azure.microsoft.com/en-us/), and [Google](https://cloud.google.com/compute/) than to manage it in-house[^2].

IT departments, therefore, can manage a lot less hardware. They spend much more of their time with [scripts](https://www.gnu.org/software/bash/) and [configurations](https://www.consul.io/); in other words, more programming and less wrestling cables.

## Change at the speed of human availability

Software that comes as a service rather than in a box is much more under the company's control, which means that it's easier to modify. And if it's _easier_ to modify, it _will_ be modified more often--and blow up more often. Amazon is one of the first companies to embrace the "software as a service" (SaaS) model, and it's not an accident that their developers were among the first to wear pagers.

When software is a service, it's harder to write some lines of code, throw it over the fence to QA, and move on. Developers have to **own** their code from development, to deployment, to production. Often, there _is_ no one on the other side of the fence. Funding Circle US, for example, has only one dedicated QA'er[^3] for _all_ development teams--nearly 30 developers in total--and no plans to hire more.

Developers, therefore, have an increased responsibility to be their own QA. Often, they have to be their own IT support as well--if a deployment goes wrong due to some infrastructure issue, it's up to the developer to investigate and resolve it.

## A grand unification

I have long thought that software development, like most roles, will become _more_ specialized over time; the current trend, however, points towards less. Development, QA, and operations are entering each others' territories[^4].

For the foreseeable future, it's less and less acceptable for developers to "only" write code. Spending more time on testing and infrastructure is to be expected.x

---

[^1]: Even more so than developers!

[^2]: Especially for companies that primary consume, rather than produce, software.

[^3]: A _really_ smart and productive guy

[^4]: And often stepping on each others' toes.
