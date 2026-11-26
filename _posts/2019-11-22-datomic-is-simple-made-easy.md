---
layout: post
title: Datomic is simple made easy
excerpt: The hits keep coming from Cognitect
---

I've recently begun evaluating [Datomic](https://www.datomic.com) for a project at work. Though the product has been around for [over 7 years](https://www.youtube.com/watch?v=Cym4TZwTCNU), it's the first opportunity I've had to investigate it in depth[^1]. Having had some experience with it, I've come to really like it, and will provide some thoughts on why I think Datomic is the _right_ database for many applications.

In Datomic, all data is stored as [datoms](https://docs.datomic.com/on-prem/glossary.html#datom), 5-tuples of entity-attribute-value-transaction-added. **Data is immutable**. Once you put (_assert_") a datom (a _fact_) into the database, it's there forever. A new fact can supersede, but not remove[^2], an old fact. This has amazing implications for **information retention**. Ever wanted to run a report against your data or experiment with a "what if" scenario from 6 months ago? With Datomic, it's as easy as [requesting a snapshot](https://docs.datomic.com/on-prem/clojure/index.html#datomic.api/as-of) of the database on that date.

The system is **easy to reason about**. Transactions are [ACID](https://docs.datomic.com/on-prem/acid.html) and serial, so there's a total ordering of events, which is [available via the API](https://docs.datomic.com/on-prem/log.html) as data structures to easily inspect and manipulate. This is a _much_ simpler model than the various [transaction isolation levels](https://www.postgresql.org/docs/current/transaction-iso.html) seen in RDBMS systems. It does limit the system's write performance, but many applications are more read than write-intensive, and a single thread kept busy, not contending with others, can be highly efficient.

**Read performance**, which Datomic is designed for, is dependent on caching and storage. Queries can be [cached](https://docs.datomic.com/on-prem/caching.html), and there's never a need to evict outdated data because the they're immutable facts that are _always true_. As memory is getting [cheaper](https://jcmit.net/memoryprice.htm) and more plentiful very quickly, especially via cloud providers like AWS, Datomic's performance stands to benefit as many users' result sets--or even entire databases--can be held in memory. The same is true r.e. [storage](https://docs.datomic.com/on-prem/storage.html), which is separated from other database concerns. Datomic can make use of various storage backends, from in-memory (amazing performance for tests) to [Cassandra](http://cassandra.apache.org/) (highly scalable & distributed).

The [query language](https://docs.datomic.com/on-prem/query.html), which seems formidable at first, has a number of advantages, including **composability**, due to use of data structures instead of strings, and **expressiveness**, thanks to the power of Datalog, the subset of Prolog the query language is based on. Logic programming makes navigating relationships between entities a breeze, as it spares the user the worry of going from here to there or there to here.

Speaking of navigation, "everything is a datom" makes [indexing](https://docs.datomic.com/on-prem/indexes.html) straightforward. There are only a few to worry about, and most are automatic--no worrying about which columns in which tables to index based on usage patterns. The configuration judgment calls[^3] and pervasive manual tweaking typical of other databases just isn't present in Datomic. And like the transaction log, indexes are [exposed via the API](https://docs.datomic.com/on-prem/clojure/index.html#datomic.api/index-range) as data structures, in case you need to do something the query language can't do fast enough.

There's a lot more to Datomic that can be discussed, but the point is this: the good folks at Cognitect designed a database chock full of lessons learned and good ideas from the past 40 years, which translates to a downright _pleasing_ product to work with. I highly recommend anyone starting a new project to give Datomic a try; even if you decide it's not right for you, I guarantee you'll have learned a lot about database design from the experience.

---

[^1]: Previous attempts at playing with it in my own time had been discouraged by the closed source, [novel architecture](https://docs.datomic.com/on-prem/architecture.html), and alien, [Datalog](https://en.wikipedia.org/wiki/Datalog)-inspired [query language](https://docs.datomic.com/on-prem/query.html).

[^2]: There's an [excision API](https://docs.datomic.com/on-prem/excision.html) that serves as an escape valve for e.g. regulatory and performance needs, but in general once something is in Datomic, it's there forever.

[^3]: Which doesn't mean there aren't [things to configure](https://docs.datomic.com/on-prem/system-properties.html)--just different, higher-level, more interesting decisions to be made.
