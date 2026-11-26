---
layout: post
title: Different strokes for different folks
excerpt: Companies approach technology differently--for good reason
---

A few months ago, I began working for [Funding Circle](https://www.fundingcircle.com/us/), an online marketplace for small business loans. It's been an interesting experience, but a big culture shock in terms of the company's approach to technology.

## Two approaches to technology

My previous employer, [Epic](http://www.epic.com/), had some ideas about technology that I found hard to swallow. These include:

- Be wary of tech trends
- Use as much [in-house technology](https://www.techopedia.com/definition/3848/not-invented-here-syndrome-nihs) as possible
- Only get third-party technology when necessary, and only from [large, trusted vendors](https://www.microsoft.com/en-us/)
- Avoid open-source technology

Funding Circle takes a different approach:

- Embrace cutting-edge ideas
- Use open-source technologies
- Get third-party technology from [smaller](http://www.confluent.io/) [companies](https://www.hashicorp.com/) (unless it's [infrastructure](https://aws.amazon.com/)...)

As with most things, there are advantages and disadvantages to both approaches.

## Epic

Epic sells software and consulting services to medium and large healthcare organizations. This is a [long-term relationship](http://healthtechreality.com/we-buy-for-life/)--the time that it takes for an organization to "[go live](http://healthtechreality.com/roles-at-epic-implementers/)" can be longer than the entire existence of a Bay Area start-up. The relationship will be particularly long-lived given Epic's utter dominance in this sector.

Epic itself has been around since 1979--the same year that [VisiCalc](https://en.wikipedia.org/wiki/VisiCalc) was released. The company and its technology have outlived many tech trends, and will no doubt outlive many more. Long after everyone has forgotten what a Docker container is, Epic's Caché-based backend will still be serving the world's largest hospitals.

## Funding Circle

Funding Circle is competing in a relatively new space: a marketplace for small businesses to get loans online and investors to purchase those loans. The dust has not yet settled in this sector, so "move fast and break things" is a more feasible--perhaps necessary--approach.

The US operation, which was purchased by UK-based Funding Circle a few years ago, has already gone through two tech stacks--first Excel[^1], then Ruby on Rails. Now we are moving to Clojure[^2], Kafka, micro-services, etc.--exciting, but perhaps also ephemeral. How long before another tech stack switch? I doubt anyone knows.

## Which approach do you prefer?

The approach to technology at a company are dictated by many factors, including the company's longevity, size, and culture.

The approach that a company takes no doubt works for that company, but as a developer, it's worth asking: which approach do you prefer? Would you want to work at an Epic-like company or a Funding Circle-like company?

---

[^1]: Like most [financial-sector companies](https://www.youtube.com/watch?v=hKcOkWzj0_s), it seems.

[^2]: Which is why I'm here.
