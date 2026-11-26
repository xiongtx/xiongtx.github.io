---
layout: post
title: Laziness and chunking in Clojure
excerpt: Interesting behavior with Clojure's lazy sequences
---

## Surprises with side effects

One of Clojure's more surprising behaviors is the interaction between functions like `map` [^1] and functions with side effects[^2].

Let's map a side-effecting function like `prn` over a list[^3]:

```clojure
(take 1 (map prn '(1 2 3 4 5)))
```

You may expect that, since there is a `(take 1 ...)`, only one number will be printed. This is indeed the case:

```
1
(nil)
```

But try doing the same to a vector:

```clojure
(take 1 (map prn [1 2 3 4 5]))
```

We get:

```
1
2
3
4
5
(nil)
```

What's going on?

## Chunking

In the [definition of `take`](https://github.com/clojure/clojure/blob/clojure-1.8.0/src/clj/clojure/core.clj#L2776), `seq` is called on the collection. `seq` causes a lazy sequence to realize its value, i.e. the `(map prn ...)` is evaluated.

Now we need to take a look at the [definition of `map`](https://github.com/clojure/clojure/blob/clojure-1.8.0/src/clj/clojure/core.clj#L2636); it is sufficient to look at one arity:

```clojure
([f coll]
   (lazy-seq
    (when-let [s (seq coll)]
      (if (chunked-seq? s)
        (let [c (chunk-first s)
              size (int (count c))
              b (chunk-buffer size)]
          (dotimes [i size]
              (chunk-append b (f (.nth c i))))
          (chunk-cons (chunk b) (map f (chunk-rest s))))
        (cons (f (first s)) (map f (rest s)))))))
```

The difference is that `[1 2 3 4 5]` goes down the `chunked-seq?` path, while `(1 2 3 4 5)` does not.

- `(seq [1 2 3 4 5])` returns a `clojure.lang.PersistentVector$ChunkedSeq`, which is a **chunked seq** (an instance of `IChunkedSeq`).
- `(seq '(1 2 3 4 5))` simply returns a `clojure.lang.PersistentList`, which is not.

From above, we see that if the collection is a chunked seq, `map` uses `chunk-first` to take elements from it. For performance reasons, `chunk-first` takes 32 elements. Therefore, `prn` is called 32 times.

We can see this in the following:

```clojure
(take 1 (map prn (range 100)))
```

which outputs:

```
0
1
2
...
31
(nil)
```

If the collection is _not_ a chunked seq, `map` realizes only one element of it.

## Avoiding chunking

To avoid chunking, we can explicity "[unchunk](http://www.markhneedham.com/blog/2014/04/06/clojure-not-so-lazy-sequences-a-k-a-chunking-behaviour/)" the lazy sequence:

```clojure
(defn unchunk [s]
  (when (seq s)
    (lazy-seq
      (cons (first s)
            (unchunk (next s))))))
```

In short, `unchunk` turns the collection into something that's not chunkable (a cons cell).

We see that:

```clojure
(take 1 (map prn (unchunk (range 100))))
```

produces

```
0
(nil)
```

## Laziness and side effects

In general, mixing laziness and side effects is a [bad idea](https://stuartsierra.com/2015/08/25/clojure-donts-lazy-effects). It makes [reasoning about when thing will be evaluated difficult](https://www.schoolofhaskell.com/school/starting-with-haskell/introduction-to-haskell/6-laziness#side-effects-and-purity).

If it has to be done, however, understanding chunking and when it occurs is important. Most of the time, the side effects are much costlier than printing a value.

---

[^1]: And `concat`, `reduce`, `filter`, and many others.

[^2]: Since [Clojure 1.1.0](https://github.com/clojure/clojure/releases/tag/1.1.0)

[^3]: For some interactive examples, see [Ian Truslove's presentation](https://github.com/iantruslove/chunking).
