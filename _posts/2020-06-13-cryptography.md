---
layout: post
title: Cryptography
excerpt: An elegant area of computer science
---

Over the past few weeks I've been looking into cryptography, an area of computer science I've not had the chance to explore much before. I decided to start by taking a Coursera specialization on [Introduction to Applied Cryptography](https://www.coursera.org/specializations/introduction-applied-cryptography?), which turned out to be a high-quality program, rather to my surprise[^1].

The specialization comprises 4 courses:

- [Classical Cryptosystems and Core Concepts](https://www.coursera.org/learn/classical-cryptosystems/home/week/1)
- [Mathematical Foundations of Cryptography](https://www.coursera.org/learn/mathematical-foundations-cryptography)
- [Symmetric Cryptography](https://www.coursera.org/learn/symmetric-crypto)
- [Asymmetric Cryptography](https://www.coursera.org/learn/asymmetric-crypto)

In particular, the first two courses, taught by Prof. William Bahn, are both comprehensive and rigorous. The latter two courses, taught by Prof. Sang-Yoon Chang, are noticeably less so. Nonetheless, the overall program is a very worthwhile introduction to a broad and exciting field.

In the first course we learn about the history of cryptography, both _cryptology_, the study of hiding information, and _cryptanalysis_, the study of how to decode it. Together, the two comprise cryptography. From the [scytale](https://en.wikipedia.org/wiki/Scytale) of ancient Greece to the [Caesar cipher](https://en.wikipedia.org/wiki/Caesar_cipher) used by the famed Roman general to the [Vigenère cipher](https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher) of early Renaissance that was considered unbreakable for 300 yrs., we see that humans have sought clever ways to hide information since time immemorial. We also see how to break these codes using [frequency analysis](https://en.wikipedia.org/wiki/Frequency_analysis), how [polyalphabetic ciphers](https://en.wikipedia.org/wiki/Polyalphabetic_cipher) hinder frequency analysis by hiding the distribution of letters, and how the only truly unbreakable cipher is the [one-time pad](https://en.wikipedia.org/wiki/One-time_pad), which relies on pure randomness.

In the second course, probably my favorite, we launch into the mathematics behind cryptography. Modular arithmetic and primes are introduced as the foundations for important results like [Euler's Theorem](https://en.wikipedia.org/wiki/Euler%27s_theorem). The [Chinese Remainder Theorem](https://en.wikipedia.org/wiki/Chinese_remainder_theorem) is presented as a different way of _representing_ numbers, which is a mind-opening insight. Finally, probabilistic primality testing[^2] via [Fermat's little theorem](https://en.wikipedia.org/wiki/Fermat%27s_little_theorem) and the [Miller-Rabin test](https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test) are covered.

In the third course, we delve into symmetric cryptography, in which encryption and decryption use the same key, a secret that is shared between sender and receiver. The differences between _block ciphers_ (which encrypt a fixed number of bits at a time) and _stream ciphers_ (which encrypt a stream of data byte by byte) are presented. An _ideal block cipher_ is shown to be one that randomly (but reversibly) maps inputs and outputs[^3]. The [Feistel cipher](https://en.wikipedia.org/wiki/Feistel_cipher), an approximation of an ideal block cipher, and [DES](https://en.wikipedia.org/wiki/Data_Encryption_Standard), the widely used standard based on the Feistel cipher, are covered, as is the later replacement [AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard).

Finally, in the fourth course, asymmetric cryptography is presented. For millenia it was widely assumed that cryptography had to be symmetric. This made secret distribution a major weak point, allowing only the largest organizations, like nation-states, to use cryptography. Asymmetric cryptography changed this by allowing two parties to establish secure communication by sending each other _non-secret_ information. This is the idea behind [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)), which relies on the difficulty of prime factorization to allow parties to authenticate each other and send confidential information, and [Diffie-Hellman key exchange](https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange), which relies on the hardness of the [discrete log problem](https://en.wikipedia.org/wiki/Discrete_logarithm) to allow two parties to end up with a shared secret.

Cryptography is at the heart of cybersecurity, a field that is exploding in importance as more activity goes digital. Its foundation is mathematics, which gives it a beauty, elegance, and intellectual challenge that many of its practitioners find intoxicating. I've only scratched the surface here, and will eagerly look for opportunities to learn more in the future.

---

[^1]: Coursera has been moving away from its founding principles of "university education for all" in the direction of rivals like Udemy and Udacity, hosting low-quality "nanodegrees" and corporate certification programs. It's still centered around university-generated content, though, so occasional gems do shine through.

[^2]: The first deterministic, polynomial-time primality test, [AKS](https://en.wikipedia.org/wiki/AKS_primality_test), was published in 2002, but its _theoretical_ polynomial-time is much too slow in practice.

[^3]: The theme of absolute security being equivalent to randomness is a recurring one, and has been noted before with one-time pads.
