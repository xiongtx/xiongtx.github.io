---
layout: post
title: The churn of being cutting edge
excerpt: Early adoption has its drawbacks
---

One reason that technology is a young man's game[^1] is that there is constant **churn** in the sector. Not _progress_ or _advancement_, necessarily--just rapid change. The only stable technologies are those that people are no longer interested in. Cutting-edge technologies, therefore, are constantly changing and shifting, which imposes a cost on those using them.

## Stream processing

[Stream processing](https://en.wikipedia.org/wiki/Stream_processing) is a hot topic these days, and I've had to learn quite a lot about it at work for the past two months.

There is an endless number of frameworks for stream processing. To name a few,

- [Samza](http://samza.apache.org/)
- [Storm](http://storm.apache.org/)
- [Spark Streaming](http://spark.apache.org/streaming/)
- [Onyx](http://www.onyxplatform.org/)
- [Kafka Streams](http://docs.confluent.io/3.0.1/streams/)

Having _choice_ is not necessarily a bad thing, but having too many choices has downsides like [analysis paralysis](https://en.wikipedia.org/wiki/Analysis_paralysis), [changing horses midstream](http://idioms.thefreedictionary.com/change%2Bhorses%2Bin%2Bmidstream), and incompatibilities between different platforms.

Choosing Kafka Streams over Samza, for example, is a good decision if you're using Kafka as your messaging system--but the cost of porting your application(s) is non-trivial, and can significantly add to the project's timeline.

## Whither longevity?

The rapid development of technology has another undesirable property: rapid deprecation.

With so many technologies--and companies behind the technologies--in competition, no one can afford to provide support for older versions of the technologies. And since development is so rapid, "old" can mean as little as 12-18 months.

This imposes a large burden on users of these technologies to upgrade their software instead of focusing on the business needs, which will, again, add to a project's timeline.

Don't think upgrading versions is a trivial thing--version dependencies can get [real complex, real fast](http://kmkeen.com/pacgraph/desktop.png), and an attempt to upgrade one library in one app could end up requiring upgrades to many libraries and many apps. This is especially painful for a small team, which lacks the manpower to constantly maintain libraries.

## Is it worthwhile?

So is it worthwhile to be on the cutting edge?

For businesses whose primary concern is not technology--that is, the business is primary a consumer of, not producer of, technology--I would say that it's good idea to _wait_ a while for technology to mature.

After all, if you're not selling tech, there's no business interest in getting to the forefront of it. It's good not to lag behind too much, as many business are wont to do, but it's also wise to avoid being a trailblazer and encountering all the difficulties that entails.

---

[^1]: And it _is_ usually young _men_, not women, for reasons I hope to discuss in a futue post
