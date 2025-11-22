---
layout: post
title: AI and Amdahl's law
excerpt: AI productivity gains are bounded by the work AI can accelerate
---

The tech industry is [abuzz](https://www.mckinsey.com/capabilities/mckinsey-digital/our-insights/the-economic-potential-of-generative-ai-the-next-productivity-frontier) with claims of massive productivity gains from AI. Consultants project trillions in economic value, and vendors promise tools that'll make workers 10x more effective. But productivity gains, no matter the source, are subject to fundamental constraints. Chief among them is [Amdahl's law](https://en.wikipedia.org/wiki/Amdahl%27s_law), which places hard limits on how much any improvement can speed up overall performance.

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

## The irreducible human element

Amdahl's law isn't just a limitation--it's a reminder that productivity is about more than raw speed. The parts of work that resist automation are often the most valuable: creativity, judgment, relationship-building, and navigating ambiguity. These aren't inefficiencies to be optimized away, but core competencies that define human contribution.

AI will continue to deliver real productivity gains, but they'll be bounded by the nature of work itself. Those expecting AI to eliminate the need for human effort will be disappointed. Those who understand AI as a tool for accelerating specific tasks--while remaining clear-eyed about which tasks those are--will benefit the most.
