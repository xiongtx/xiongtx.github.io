---
layout: post
title: SQL query planning
excerpt: The elegant ideas that made RDBMS possible
---

I've been working my way through [The Red Book](http://www.redbook.io/), a reference collection of seminal database papers with commentary by the most prominent researchers of the past few decades. One of the most interesting publications is Selinger et. al's 1979 [paper](https://dl.acm.org/doi/abs/10.1145/582095.582099) on access path selection for [System R](https://en.wikipedia.org/wiki/IBM_System_R), i.e. how the query optimizer takes a declarative SQL query and produces a procedural, near-optimal execution plan. The approach laid out in this paper remains highly relevant today, as it remains the foundation for most modern relational databases query optimizers.

## That's pretty dynamite

Consider a query that joins 4 tables \\( \\{T_1, T_2, T_3, T_4\\} \\) together. Naively, there are $$4! = 24$$ permutations of tables to be considered. Factorial growth quickly becomes prohibitive, but luckily query optimization has **optimal substructure**, meaning that the optimal solution for the whole query involves some combination of optimizing its parts. Thus, rather than consider every permutation of \\( \\{T_1, T_2, T_3\\} \\)  joined to \\( T_4 \\), we need only find the best way to join  \\( \\{T_1, T_2, T_3\\} \\), and use that solution with \\( T_4 \\). This naturally lends itself to **dynamic programming**, which is just a fancy way of saying that a large problem can be solved efficiently by solving smaller subproblems first and using those results in larger subproblems.

## Southpaws only

In System R, only [left deep](https://docs.oracle.com/en/database/oracle/oracle-database/23/tgsql/glossary.html#GUID-5697281B-74F7-4AF2-A73F-3CC1A96EA947) join plans were considered, meaning that for a join $$(R, T)$$, only $$R$$ can be the result of joins, while $$T$$ must be a base table. Thus, $$((T_1, T_2), T_3)$$ is allowed, but $$((T_1, T_2), (T_3, T_4))$$ (a [bushy join](https://docs.oracle.com/en/database/oracle/oracle-database/23/tgsql/glossary.html#GUID-4E921FAD-0F1B-47E7-A1A4-EAAAD5E043AB)) is not. This reduces the number of cases that need to be considered.

We build the solution by starting with single tables, then calculating the cost of joining two tables, three tables, and so on. When joining \\( k \\) tables \\( \\{T_1, \dots, T_k\\} \\), we have \\( k \\) possibilities to consider: \\( ((T_j \mid j \neq i) , T_i) \\) for \\( i \in \\{1, \dots, k\\} \\). So the total number of cases to consider for \\( n \\) tables is:

$$ \sum_{k = 1}^{n} \binom{n}{k} k $$

Making use of the symmetry of the binomial coefficients:

$$

\begin{align}
& \sum_{k=1}^{n} \binom{n}{k} \frac{n}{2} \\
&\Rightarrow \frac{n}{2} (2^n - 1)

\end{align}

$$

Which is $$\mathcal{O}(n2^n)$$. For small \\( n \\) (as is the case for real-world queries), this is close to \\( \mathcal{O}(2^n) \\).

## Bush(y) league

Now suppose we don't restrict ourselves to left deep join plans, but consider bushy join plans as well. Then for \\( \\{T_1, \dots, T_k\\} \\) we must consider the cases of one table being joined against \\( k - 1 \\) tables, two tables being joined against \\( k - 2 \\) tables, and so on. The number of cases is \\( 2^k - 2 \\), the number of ways to partition the \\( k \\) tables into two disjoint sets, absent the empty set and full set. For simplicity we'll just call it \\( 2^k \\). Then the total number of cases is

$$ \sum_{k = 1}^{n} \binom{n}{k} 2^k $$

Recall the [binomial identity](https://mathworld.wolfram.com/BinomialIdentity.html):

$$ (x + y)^n = \sum_{k=0}^{n} \binom{n}{k} x^{n-k}y^{k} $$

Substituting \\( x = 1 \\), \\( y = 2 \\), we get:

$$
\sum_{k=1}^{n} \binom{n}{k} 2^{k} = 3^n - 1
$$

Which is \\( \mathcal{O}(3^n) \\).

## Order, order!

For each subproblem, we also need to consider the different ways of ordering the results. If an index exists on a table column that serves as a join column, it may offer a faster access path. The paper calls the order in the query from an `ORDER BY` or `GROUP BY` an **interesting order**. If an interesting order exists, then the cost of unordered access plus a sort must be compared against any indexed accesses.

## Mind meets metal

The paper didn't satisfy itself with complexity bounds--it described an optimizer for a real database system, after all.

A major innovation was cost estimation based on CPU and disk accesses, taking into account factors like whether there was a **clustered index** (where tuples are physically stored in index order, therefore minimizing page reads).

Costs were also reduced via a **selectivity factor** \\( F \\) based on the predicates on tables, such as `COLUMN = value` or `COLUMN IN (list of values)`. This required statistics to be gathered on tables and indices. For example, `COLUMN = value` gave \\( F = 1 / ICARD(\text{column index}) \\), where \\( ICARD(\text{column index}) \\) is the number of unique values in the index.

## Oldie but goodie

Given the age of this paper, it's impressive how well it holds up. Modern databases have more features, such as bushy join plans, [hash joins](https://use-the-index-luke.com/sql/join/hash-join-partial-objects), [genetic algorithms](https://www.postgresql.org/docs/17/geqo-pg-intro.html), etc., but the basics are still the same: parse a query, consider the possible access paths, assign costs, and pick the optimal solution.

Selinger's work showed that declarative queries could be made performant, setting the stage for relational databases to replace hierarchical ([IMS](https://www.ibm.com/docs/en/zos-basic-skills?topic=product-ims-database-manager)) and network ([CODASYL](https://en.wikipedia.org/wiki/CODASYL)) databases, thus saving future programmers a whole lot of headache. For that, we should all be grateful.
