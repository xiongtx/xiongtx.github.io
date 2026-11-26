---
layout: post
title: Quantum computing is real
excerpt: A visit to a quantum computing company...that uses Lisp!
---

Tonight I had the pleasure of visiting [Rigetti Computing](https://www.rigetti.com/), a quantum computing start-up in Berkeley, for a [Lisp at the Frontier of Computation](https://www.meetup.com/balisp/events/244921835/) meet-up. While I'm always happy to attend a talk on Lisp, this time I (and I'm sure many other attendees) was drawn more by the opportunity to see quantum computing's outside of academia.

The night began with a brief tour of the facilities. Whereas most software startups are little more than a collection of desks, chairs, and Macbooks, half of Rigetti's premises is dedicated to serious hardware, the most significant of which are several "fridges" that cool their custom-made[^1] quantum processors (QPUs) to 10 milikelvins. It's all very physics-y and impressive--"SCIENCE!", it screams in all caps. We were also shown a [quantum processor](https://fsmedia.imgix.net/a1/16/9d/df/f2e6/479d/8619/9ad419ef6040/an-experimental-8-qubit-chip-from-rigetti.jpeg?auto=format%2Ccompress&w=700), which looks more or less like a standard chip, except for the distinct "sunburst" shapes that indicate qubits.

The talk by [Robert Smith](https://github.com/tarballs-are-good), director of software at Rigetti, was about using Common Lisp (CL) to build a quantum computing VM (QVM) for [Quil](https://www.rigetti.com/index.php/forest)[^2], the in-house quantum instruction language[^3]. At this time, real processor time is _very_ valuable, so a good VM is absolutely necessary for testing. Currently, the QVM is even able to simulate _more_ qubits than the real chips, though performance degrades exponentially w.r.t. the number of qubits[^4].

Motivations for using CL include the usual strengths of Lisp, such as expressiveness and rapid iteration, as well as some SBCL specifics, particularly performance. Difficulties include a lack of good libraries (particularly for linear algebra) and no interest on the part of SBCL maintainers to improve performance in key areas[^5].

A few more points from my chat with Robert after the talk:

- Quantum processors are not better for _every_ problem; a general-purpose computer will use the QPU for certain tasks, just like GPUs.
- There's no scientific barrier to quantum computing now[^6]; it's an engineering (particularly fabrication) problem
- Adding qubits is not very difficult; within 5 years, 100's of qubits is possible.
  - However, using [Shor's algorithm](https://en.wikipedia.org/wiki/Shor%27s_algorithm)[^7] to crack today's cryptographic security would require _10,000's_ of qubits, which is still a ways off!
- [D-Wave](https://www.dwavesys.com/home), another quantum computing company, does a more limited sort of computing called [quantum annealing](https://en.wikipedia.org/wiki/Quantum_annealing)
  - Interestingly, D-Wave's also known to use CL, though we don't know for which purposes
- Nielsen and Chuang's [Quantum Computation and Quantum Information](https://www.amazon.com/Quantum-Computation-Information-10th-Anniversary/dp/1107002176) is the recommended book for learning about quantum computing

All in all, this was a _very_ enlightening night. While quantum computing is quite beyond my grasp at the moment, I'm excited to think where it may be in a decade.

---

[^1]: The fab used to be on-premise, but later moved to Fremont.

[^2]: See [paper](https://arxiv.org/pdf/1608.03355.pdf).

[^3]: As most programmers have a great fear of Lisp, high-level programs are written in Python via [PyQuil](https://github.com/rigetticomputing/pyquil), then compiled down to Quil instructions for running on the QVM.

[^4]: Beyond 30 or so qubits, the VM becomes unbearably slow, even with 2 _TB_ of RAM.

[^5]: Not even for pay! This lack of enterprise support is cited as one reason a proprietary CL may be used in the future.

[^6]: At least not for Rigetti's cloud-based model. Putting a quantum processor in a phone would require new materials with [much higher superconductivity temperatures](https://en.wikipedia.org/wiki/Room-temperature_superconductor).

[^7]: Shor's algorithm is a quantum algorithm for integer factorization that runs in polynomial time.
