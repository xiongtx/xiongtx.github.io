---
layout: post
title: How will we work with AI?
excerpt: What AI productivity will actually look like
---

The tech industry is [abuzz](https://www.mckinsey.com/capabilities/mckinsey-digital/our-insights/the-economic-potential-of-generative-ai-the-next-productivity-frontier) with claims of massive productivity gains from AI. Consultants project trillions in economic value, and vendors promise tools that'll make workers 10x more effective. But productivity gains, no matter the source, are subject to fundamental constraints. Chief among them is [Amdahl's law](https://en.wikipedia.org/wiki/Amdahl%27s_law), which places hard limits on how much any improvement can speed up overall performance.

## Benchmarks vs. iteration

One problem with current AI benchmarks is their focus on whether models can solve well-defined problems in one shot, or perhaps a few attempts. [SWE-bench](https://www.swebench.com/) measures if a model can fix a GitHub issue. [HumanEval](https://github.com/openai/human-eval) checks if it can implement a function given a docstring. These are useful for comparing models, but they don't reflect how quality work actually gets done.

Real intellectual work is iterative. An artist starts with a rough sketch based on skeletal structure, then applies multiple passes filling in detail--shading, texture, color. A writer produces drafts, each one tightening arguments and clarifying prose. A programmer writes code, tests it, refactors, and repeats. Quality emerges through refinement, not through getting it right the first time.

More fundamentally, intellectual work is a search process. The space of possible solutions is vast, and the task is to explore and partition that space until a specific solution comes into view. Early stages are amorphous--broad strokes that establish direction. Later stages add constraints, making the solution less vague and more concrete. This is true whether you're designing a building, writing a legal brief, or architecting software.

AI tools that excel at one-shot generation may struggle with this iterative process. They can produce plausible first drafts, but incorporating feedback, maintaining consistency across revisions, and progressively refining toward a goal remain challenging. The human role, then, is not just to prompt but to guide--to be the editor, the critic, the one who knows when "good enough" has been reached.

## The law of diminishing speedups

Amdahl's law, formulated by computer scientist Gene Amdahl in 1967, states that the speedup of a system is limited by the portion that cannot be improved. Mathematically:

$$S = \frac{1}{(1 - p) + \frac{p}{s}}$$

Where $S$ is the overall speedup, $p$ is the proportion of work that can be accelerated, and $s$ is the speedup factor for that portion. Even if $s$ approaches infinity--that is, some part of the task becomes instantaneous--the overall speedup is bounded by $\frac{1}{1 - p}$.

Consider a task where AI can accelerate 50% of the work. Even if AI makes that portion infinitely fast, the overall speedup is only 2x. If AI can accelerate 90% of the work, the maximum speedup is 10x. To achieve the 100x improvements often touted by AI proponents, 99% of work would need to be AI-acceleratable--a bar that's unrealistic for most knowledge work.

## What AI can and cannot accelerate

AI excels at certain tasks: generating boilerplate code, summarizing documents, answering well-defined questions, and pattern matching across large datasets. These are tasks with clear inputs, outputs, and success criteria.

But much of knowledge work doesn't fit this mold. Defining the problem, understanding stakeholder needs, navigating organizational politics, making judgment calls with incomplete information--these remain stubbornly human activities. A programmer might use AI to write code faster, but still spends hours in meetings clarifying requirements, debugging integration issues, and explaining trade-offs to non-technical colleagues.

The proportion of work that AI can accelerate varies widely by domain. Data entry and transcription? Perhaps 90%. Creative strategy and leadership? Maybe 10%. Most jobs fall somewhere in between, with AI-acceleratable portions often smaller than enthusiasts assume.

## Implications for productivity claims

This framework helps explain why real-world productivity gains from AI often [disappoint](https://www.nytimes.com/2024/08/25/technology/ai-productivity-tools.html) relative to expectations. A tool that makes coding 5x faster sounds transformative, but if coding is only 30% of a developer's job, the overall productivity gain is closer to 1.5x. Still valuable, but not the revolution promised.

It also suggests where to focus AI development efforts. Rather than making already-fast tasks faster, the bigger wins come from expanding the proportion of work that AI can handle at all. This is why [agentic systems]({% post_url 2025-11-17-agentic-utopia-deferred %}) are so appealing--they promise to take on entire workflows, not just individual tasks.

## Strong scaling vs. weak scaling

In parallel computing, there's a crucial distinction between [strong and weak scaling](https://hpc-wiki.info/hpc/Scaling). Strong scaling means completing the same amount of work in less time. Weak scaling means completing more work in the same amount of time.

Many envision AI enabling strong scaling--workers finish their tasks faster and enjoy more leisure. But Amdahl's law suggests this is constrained by the irreducible portion of work that AI cannot accelerate. If 40% of a job resists automation, no amount of AI improvement will reduce work hours by more than 60%.

What's more likely is weak scaling: AI allows workers to produce more output in the same hours. A developer writes more features. A lawyer handles more cases. A designer creates more variations. The employer's preference aside, this may be the only technically feasible option. When the non-AI-acceleratable portion of work sets a floor on time spent, the only way to capture AI's benefits is to increase the AI-acceleratable portion--that is, do more of the work AI is good at.

This distinction matters for expectations about AI's societal impact. Strong scaling would mean broadly shared gains through reduced working hours. Weak scaling means productivity gains flow primarily to those who can leverage AI to increase their output--and to their employers, who capture the surplus.

## The irreducible human element

Amdahl's law isn't just a limitation--it's a reminder that productivity is about more than raw speed. The parts of work that resist automation are often the most valuable: creativity, judgment, relationship-building, and navigating ambiguity. These aren't inefficiencies to be optimized away, but core competencies that define human contribution.

AI will continue to deliver real productivity gains, but they'll be bounded by the nature of work itself. Those expecting AI to eliminate the need for human effort will be disappointed. Those who understand AI as a tool for accelerating specific tasks--while remaining clear-eyed about which tasks those are--will benefit the most.
