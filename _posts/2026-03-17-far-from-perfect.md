---
layout: post
title: Far from perfect
excerpt: Where AI tooling can go next
audio: /audio/2026-03-17-far-from-perfect.mp3
---

Since an earlier post on [whether AI will replace programmers]({% post_url 2025-08-21-will-ai-replace-programmers %}), AI coding tools have improved substantially. Models demonstrate better understanding of existing codebases--they're more likely to follow established patterns and conventions rather than imposing their own. The kinds of careless errors that plagued early tools--renaming some usages of a variable while leaving other instances unchanged, for example--have become less frequent. Code generation feels less like autocomplete and more like working with an assistant that has actually read the project.

However, significant gaps remain between what these tools deliver and what productive software development requires.

## Zero taste, more filling

AI tools still lack taste. Given a high-level instruction like "build a chat interface," the result is typically something barely functional--a text box, a submit button, messages rendered as plain text. It works, in the narrowest sense. But it does not reflect the dozens of small decisions that make software feel considered: sensible defaults, graceful error handling, responsive layout, keyboard shortcuts, loading states. Getting these requires finer-grained instructions as a sort of parallel to [Clarke's third law](https://en.wikipedia.org/wiki/Clarke%27s_three_laws):

> Any sufficiently precise instruction is indistinguishable from code

Current AI benchmarks focus on whether models can solve well-defined problems in one shot. [SWE-bench](https://www.swebench.com/) measures whether a model can fix a GitHub issue. [HumanEval](https://github.com/openai/human-eval) tests whether it can implement a function given a docstring. These are useful for comparing models, but do not reflect how quality work is actually done.

Intellectual work is iterative. An artist begins with a rough sketch, then applies successive passes--shading, texture, color. A writer produces drafts, each tightening arguments and clarifying prose. A programmer writes code, tests it, refactors, and repeats. Quality emerges through refinement, not initial correctness. More fundamentally, intellectual work is a search process. The space of possible solutions is vast, and the task is to explore and partition that space until a specific solution emerges.

What we want from AI is what we want from a skilled colleague: the ability to analyze high-level problems and offer insights, alternatives, and even rebuttals. A good colleague questions assumptions, identifies edge cases, proposes different approaches, and pushes back when a proposed solution has flaws. Current AI systems are improving at this, but the benchmark focus on correctness rather than collaboration quality means progress in these dimensions remains undervalued and undermeasured.

Iteration is not just about quality, but also ownership. [Parkinson's law of triviality](https://en.wikipedia.org/wiki/Law_of_triviality), or "bike-shedding," describes how people--particularly managers--feel obligated to offer superficial critiques to demonstrate contribution. Humans exhibit the same behavior when working with AI--they are, in effect, managing the model. Even if an AI system could produce perfect output in one shot, it would not feel satisfactory if it could not subsequently incorporate modifications according to human preferences.

## Bending reality

While AI models improve in tool use and environment interaction, the tools and environments themselves will become more AI-friendly. This co-evolution is already underway. Many websites implement [llms.txt](https://llmstxt.org/) to make their content more navigable for LLMs, and software vendors release first-party [plugins](https://code.claude.com/docs/en/discover-plugins) for AI tools to help them better interact with their products.

This trend will deepen. Compilers and linters will produce messages designed not just for human readability but for LLM consumption, providing structured context that helps models resolve issues more effectively. Programming languages may evolve syntax that is easier for LLMs to learn and generate[^1]. Operating systems will expose APIs and features specifically to help AI agents manipulate their environment--managing files, configuring settings, and orchestrating workflows.

In a previous post on ["artificial Darwinism"]({% post_url 2025-11-01-artificial-darwinism %}), we discussed how AI-written tools can be improved over time through selection and refinement. But the evolution is not limited to functions and programs that AI writes--it extends to everything around the AI. The entire software stack will develop a dual interface--one for humans, one for AI--just as the web evolved from human-readable pages to machine-readable APIs. Better models working with AI-optimized tools will be more effective than either improvement alone.

## Good fences make good agents

The success of any search process depends on good constraints. The more feedback an AI receives about whether its output is correct, the more efficiently it can navigate the solution space.

This favors statically typed languages. In past decades, dynamic languages like Python won adoption because they reduced friction for the programmer. Going forward, statically typed languages like TypeScript may have an advantage: type checks provide deterministic constraints that verify structural correctness without running the program. Every type error is a signal that narrows the search.

[Formal verification](https://www.youtube.com/watch?v=JHEO7cplfk8) tools like theorem provers represent the gold standard in this regard. They impose invariants on program behavior--a way of defining the fundamental properties a program must satisfy. An AI constrained by a formal specification cannot produce code that violates it, regardless of how plausible the code looks.

Most programs will not be formally specified, however. In these cases, comprehensive test suites can serve as a de facto specification. Cloudflare demonstrated this by [vibe-coding their own NextJS alternative](https://blog.cloudflare.com/vinext/), using the framework's extensive test suite to generate code that satisfies the same behavioral contracts. High-level designs, such as [UML diagrams](https://www.uml-diagrams.org/), may also prove useful for communicating program intent to AI--providing architectural constraints that complement the low-level feedback of types and tests.

The tools that provide the richest feedback--type systems, theorem provers, test suites, design specifications--will become increasingly valuable not because they help human programmers (though they do), but because they constrain AI behavior. Organizations that invest in these constraints will get better results from AI, creating a virtuous cycle: better constraints produce better AI output, which justifies further investment in constraints.

## Pushing humans apart

AI's growing capabilities carry social implications that are easy to overlook. As AI becomes better at answering questions, developers interact less with each other. Instead of asking a colleague how a system works, you ask the model. The informal exchanges that build shared understanding, mentorship, and trust quietly disappear.

Companies looking to reduce headcount with AI amplify this effect. When the implicit message is that fewer people should produce the same output, the incentive shifts from collaboration to visible productivity. Developers churn out AI-generated code to appear busy rather than spending time on the slower, harder work of aligning with teammates, reviewing each other's designs, and building shared context. The result is more code and less communication--exactly the wrong trade-off for complex systems.

AI's ability to implement ad-hoc solutions is a related double-edged sword. On one hand, teams can reduce external dependencies and avoid [supply-chain attacks](https://en.wikipedia.org/wiki/Supply_chain_attack) by generating their own implementations (assuming the AI code is safe and correct). On the other hand, standards are likely to be tossed aside for the sake of speed[^2]. Everyone is encouraged to reinvent the wheel instead of collaborating on shared interfaces. Why adopt a library when you can generate one?

The aforementioned Cloudflare / NextJS episode provoked a [sharp backlash](https://www.youtube.com/watch?v=ateDMU5EGeg) from the software community. Many saw it as a company exploiting an open-source project's test suite to clone its behavior without contributing back--a form of free-riding enabled by AI. If test suites become blueprints for competitors, there is a strong incentive to keep them private. SQLite already keeps its [test suite](https://sqlite.org/testing.html) proprietary because it charges for custom implementations to verify correctness. This decision, made for commercial reasons long before LLMs, looks prescient: in the AI era, specifications, designs, and test suites may increasingly be treated as trade secrets rather than shared artifacts. The open-source ethos of sharing and collaboration sits uneasily with a world where any public artifact can be consumed by AI to produce a competing implementation overnight.

## Conclusion

AI coding tools have made real progress in reliability and codebase comprehension. The remaining gaps--taste, iteration, collaboration quality--are harder to close but not intractable. The path forward involves co-evolution: models improving alongside the tools and environments they operate in, with richer feedback mechanisms like type systems, test suites, and formal specifications constraining AI behavior toward correctness. But the social dynamics matter too: if AI tools erode the collaboration and shared standards that make software ecosystems work, the productivity gains may come at a cost we have not yet reckoned with.

---

[^1]: For an example of syntax that is easier for LLMs, see Google's [pipe syntax for SQL](https://research.google/pubs/sql-has-problems-we-can-fix-them-pipe-syntax-in-sql/). Regular SQL was a problem for LLMs because it reads "inside-out", and changing one part (e.g. a `GROUP BY`) often requires changing a spatially unrelated part (e.g. `SELECT`). The pipe syntax breaks SQL down into independent left-to-right operations, so changes in one part of the pipeline do not need to reference other parts.

[^2]: Technology that gets deployed more quickly and broadly becomes the de facto new standard, regardless of quality. Richard Gabriel describes this phenomenon well in his ["Worse is Better"](https://www.dreamsongs.com/WorseIsBetter.html).
