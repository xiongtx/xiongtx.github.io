---
layout: post
title: How will we work with AI?
excerpt: What AI productivity will actually look like
---

The tech industry is [abuzz](https://www.mckinsey.com/capabilities/mckinsey-digital/our-insights/the-economic-potential-of-generative-ai-the-next-productivity-frontier) with claims of massive productivity gains from AI. Consultants project trillions in economic value, and vendors promise tools that will make workers 10x more effective. Yet productivity gains, regardless of source, are subject to fundamental constraints--and AI is no exception.

## Amdahl's law

[Amdahl's law](https://en.wikipedia.org/wiki/Amdahl%27s_law), formulated by computer scientist Gene Amdahl in 1967, states that the speedup of a system is limited by the portion that cannot be improved. Mathematically:

$$S = \frac{1}{(1 - p) + \frac{p}{s}}$$

Where $S$ is the overall speedup, $p$ is the proportion of work that can be accelerated, and $s$ is the speedup factor for that portion. Even if $s$ approaches infinity--that is, some portion becomes instantaneous--the overall speedup is bounded by $\frac{1}{1 - p}$.

Consider a task where AI can accelerate 50% of the work. Even if AI completes that portion infinitely fast, the overall speedup is only 2x. If AI can accelerate 90%, the maximum speedup is 10x. To achieve the 100x improvements often claimed by AI proponents, 99% of work would need to be AI-acceleratable--an unrealistic bar for most knowledge work.

## What AI can and cannot accelerate

AI excels at tasks with clear inputs, outputs, and success criteria: generating boilerplate code, summarizing documents, answering well-defined questions, and pattern matching across large datasets.

Much of knowledge work does not fit this profile. Defining the problem, understanding stakeholder needs, navigating organizational politics, and making judgment calls with incomplete information remain human activities. A programmer may use AI to write code faster, yet still spend hours in meetings clarifying requirements, debugging integration issues, and explaining trade-offs to non-technical colleagues.

The proportion of work that AI can accelerate varies by domain. Data entry and transcription: perhaps 90%. Creative strategy and leadership: perhaps 10%. Most occupations fall in between, with AI-acceleratable portions often smaller than enthusiasts assume.

## Implications for productivity

This framework explains why real-world productivity gains from AI often [disappoint](https://www.nytimes.com/2024/08/25/technology/ai-productivity-tools.html) relative to expectations. A tool that makes coding 5x faster sounds transformative, but if coding constitutes only 30% of a developer's job, the overall productivity gain is closer to 1.3x--valuable, but not revolutionary.

Economic analysis supports this skepticism. MIT economist Daron Acemoglu, who shared the 2024 Nobel Prize in Economic Sciences, [estimates](https://news.mit.edu/2024/what-do-we-know-about-economics-ai-1206) that AI will produce only a 1.1 to 1.6 percent increase in GDP over the next 10 years--roughly 0.05 percent annual productivity gain. His methodology is grounded in concrete constraints: only 20% of U.S. job tasks are exposed to AI capabilities, and only 23% of computer vision tasks that could ultimately be automated can be profitably automated within the next decade. These figures stand in stark contrast to projections from McKinsey suggesting AI could add $17.1 to $25.6 trillion to the global economy. Acemoglu's concern is that "we currently have the wrong direction for AI"--too much focus on automation, not enough on augmenting workers with expertise and information.

Even if AI delivers real gains, they may not appear in productivity statistics for years. Andrej Karpathy has [argued](https://www.youtube.com/shorts/hACQl93GhrE) that AI will not show up in GDP--just as previous revolutionary technologies like the internet failed to appear in economic measures despite their transformative impact. This echoes the [Solow productivity paradox](https://en.wikipedia.org/wiki/Productivity_paradox) from the 1980s: "You can see the computer age everywhere but in the productivity statistics." Computers were ubiquitous, yet measured productivity growth remained stagnant. The internet followed the same pattern--transformative in daily life, nearly invisible in GDP numbers for over a decade.

The explanation lies in implementation lags and complementary innovations. General-purpose technologies require waves of organizational restructuring, new business processes, and supporting infrastructure before their full economic impact materializes. The [Industrial Revolution](https://en.wikipedia.org/wiki/Industrial_Revolution) provides the most striking example: prior to it, economic growth was at best linear; afterward, growth became exponential. Yet this fundamental shift would not have been obvious within the first few years--or even decades--of industrialization. Observers in 1780 had no basis for predicting that the world economy would enter a sustained exponential growth regime.

This historical perspective clarifies both Acemoglu's modest estimates and Karpathy's claim that AI will not show up in GDP. Both may be correct about near-term measurements while still underestimating long-term transformation. Acemoglu's 1.1-1.6% GDP increase over 10 years reflects constraints visible today--the limited proportion of tasks AI can currently accelerate profitably. Karpathy's observation about GDP invisibility reflects measurement and implementation lags. Neither projection necessarily captures what happens after decades of complementary innovation, organizational learning, and infrastructure development. The Industrial Revolution analogy suggests that the most profound impacts may emerge not from AI's direct substitution for human labor, but from entirely new economic structures and processes we cannot yet envision. AI will likely follow this trajectory: real but diffused, seeping into workflows and industries gradually rather than producing sudden discontinuous jumps in measured output.

The framework also suggests where to focus AI development. Rather than accelerating already-fast tasks, the greater gains come from expanding the proportion of work AI can handle at all. This explains the appeal of [agentic systems]({% post_url 2025-11-17-agentic-utopia-deferred %}): they promise to assume entire workflows, not just individual tasks.

## Strong scaling vs. weak scaling

Beyond constraints on magnitude lies the question of how productivity gains manifest. In parallel computing, [strong and weak scaling](https://hpc-wiki.info/hpc/Scaling) represent distinct objectives. Strong scaling means completing the same work in less time. Weak scaling means completing more work in the same time.

Many envision AI enabling strong scaling--workers finish tasks faster and enjoy more leisure. But Amdahl's law constrains this by the irreducible portion of work that AI cannot accelerate. If 40% of a job resists automation, no amount of AI improvement will reduce work time by more than 60%.

What is more likely is weak scaling: AI enables workers to produce more output in the same hours. A developer writes more features. A lawyer handles more cases. A designer creates more variations. When the non-AI-acceleratable portion of work sets a floor on time spent, the only way to capture AI's benefits is to increase the AI-acceleratable portion--that is, to do more of the work AI can speed up.

This distinction matters for societal expectations. Strong scaling would mean broadly shared gains through reduced working hours. Weak scaling means productivity gains flow primarily to those who leverage AI to increase output--and to employers who capture the surplus.

## Shifting narratives

The theoretical constraints of Amdahl's law find empirical support in how AI productivity narratives have evolved. Early claims, prevalent in the immediate aftermath of ChatGPT's November 2022 launch, suggested that AI would democratize programming--that access to AI tools would level the playing field by compensating for lack of experience. GitHub Copilot launched in June 2022 with reports that developers completed tasks [55% faster](https://www.technologyreview.com/2023/12/06/1084457/ai-assistants-copilot-changing-code-software-development-github-openai/), fueling optimism that the barrier to entry for programming would collapse.

The current narrative has inverted completely. Now the claim is that senior developers using AI will obsolete junior developers. [Entry-level job postings dropped 35%](https://www.cio.com/article/4062024/demand-for-junior-developers-softens-as-ai-takes-over.html) since January 2023, while mid- and senior-level roles rose by 8% and 15% respectively. AI, it turns out, is most effective in the hands of those who already know what they are doing. Senior developers can delegate routine tasks to AI while focusing on architecture, trade-offs, and system design. Junior developers, lacking this foundation, struggle to evaluate AI output or know what to ask for. As one observer noted, AI is "like having a very eager junior developer on your team--they can write code quickly, but they need constant supervision and correction, and the more you know, the better you can guide them."

This shift reveals something important about AI productivity tools: they amplify existing capabilities rather than replace them. Non-engineers using AI for coding hit what has been called the ["70% problem"](https://addyo.substack.com/p/the-70-problem-hard-truths-about)--they can get 70% of the way there surprisingly quickly, but that final 30%, the part that makes software production-ready and robust, requires real engineering knowledge. A mediocre developer with AI assistance remains mediocre--possibly even worse if they accept AI suggestions uncritically. An expert developer with AI assistance becomes more productive by offloading routine work while maintaining judgment over the results. The same pattern likely holds across domains: AI benefits those who already possess deep knowledge of their field.

## The persistence of programming

Why does expertise remain so valuable despite AI assistance? A corollary to [Clarke's third law](https://en.wikipedia.org/wiki/Clarke%27s_three_laws) provides insight: any sufficiently precise instruction is indistinguishable from code. Programming may change--we may no longer write Java, just as today's programmers rarely write the machine code that was standard for earlier generations. But the English that effectively "programs" AI will not be imprecise everyday speech. It will need to be specific, unambiguous, and logically structured--code by another name.

Few who know English become successful authors like J.K. Rowling or Stephen King. Fluency in a language does not confer fluency in using it precisely and effectively. There is no reason to believe the masses will become programmers merely because syntax shifts from Python to natural language. The skill of decomposing problems, specifying requirements, and thinking systematically will remain rare and valuable.

## Productivity and work hours

History indicates that work hours are determined not by productivity but by competitive pressures. When competition is slack, organizations ease off. When it intensifies, demands increase--including on labor. In the early stages of technological revolution, when outcomes are uncertain, the pressure favors maximum resource application, from capital to labor.

The [Industrial Revolution](https://en.wikipedia.org/wiki/Industrial_Revolution) did not initially reduce work hours--it increased them. Factory workers in the early 19th century routinely worked 12-16 hour days, six days a week. Productivity gains from mechanization did not translate into leisure; they translated into more output and profit. The [40-hour work week](https://en.wikipedia.org/wiki/Eight-hour_day) was not a natural consequence of machines accelerating processes. It was won through decades of labor organizing, strikes, and sometimes violence.

When employers do limit work hours, it is often because forward-thinking industrialists recognize that excessive hours undermine productivity. [Henry Ford](https://www.history.com/articles/henry-ford-40-hour-work-week) was exceptional in understanding that supply and demand must balance--Ford workers who lacked the money to buy cars or the time to use them represented an unsustainable operation. Such enlightened self-interest is the exception, not the rule.

People react to productivity-enhancing technology in three ways[^1]. The ambitious see AI as a force multiplier and apply more effort for greater gains--working longer hours with AI assistants to produce what previously required teams. The practical see an opportunity to achieve the same results with less effort, reclaiming time for other pursuits. The complacent expect AI to handle everything while they coast; they will find that AI cannot accelerate all work, and the parts it cannot are precisely those requiring human judgment.

The ambitious will prosper--they always have during technological change. The practical may fare well temporarily, but will eventually be displaced by superior technology or more capable users. The complacent will be rapidly obsoleted. If the ambitious set the pace, competitive pressure will compel everyone to keep up.

AI is arriving during intensifying global competition--between companies racing to dominate new markets and nations vying for technological supremacy. In this environment, expecting productivity gains to result in shorter work hours is naive. The more likely outcome is that gains will be captured as increased output, with workers expected to produce more, not work less. Any reduction in work hours will come, as it always has, from collective action and policy--not from technology itself.

## Benchmarks vs. iteration

Understanding the constraints and societal implications of AI productivity leads naturally to questions about how we will actually work with these systems. Current AI benchmarks focus on whether models can solve well-defined problems in one shot, or perhaps a few attempts. [SWE-bench](https://www.swebench.com/) measures whether a model can fix a GitHub issue. [HumanEval](https://github.com/openai/human-eval) tests whether it can implement a function given a docstring. These are useful for comparing models, but do not reflect how quality work is actually done.

Intellectual work is iterative. An artist begins with a rough sketch based on skeletal structure, then applies successive passes--shading, texture, color. A writer produces drafts, each tightening arguments and clarifying prose. A programmer writes code, tests it, refactors, and repeats. Quality emerges through refinement, not through initial correctness.

More fundamentally, intellectual work is a search process. The space of possible solutions is vast, and the task is to explore and partition that space until a specific solution emerges. Early stages are broad strokes that establish direction. Later stages add constraints, progressively concretizing the solution. This holds whether designing a building, writing a legal brief, or architecting software.

AI tools that excel at one-shot generation may struggle with iteration. They can produce plausible first drafts, but incorporating feedback, maintaining consistency across revisions, and progressively refining toward a goal remain challenging. The human role is not merely to prompt but to guide--to edit, critique, and determine when sufficiency has been reached.

What we want from AI is what we want from a skilled colleague: not one-shot implementation, but the ability to analyze high-level problems and offer insights, alternatives, and even rebuttals. A good colleague questions assumptions, identifies edge cases, proposes different approaches, and pushes back when a proposed solution has flaws. Current AI systems are improving at this, but the benchmark focus on correctness rather than collaboration quality means progress in these dimensions remains undervalued and undermeasured.

There is also a psychological dimension. [Parkinson's law of triviality](https://en.wikipedia.org/wiki/Law_of_triviality), or "bike-shedding," describes how managers feel obligated to offer superficial critiques to demonstrate contribution. Humans exhibit the same behavior when working with AI--they are, in effect, managing the model. Even if an AI system could produce perfect output in one shot, it would not feel satisfactory if it could not subsequently incorporate modifications according to human preferences, regardless of whether those modifications improve the result. The ability to iterate is not just about quality; it is about ownership.

## Multimodal interaction

Text may not remain the primary interface for AI interaction. Andrej Karpathy has [argued](https://x.com/karpathy/status/1980397031542989305) that it may make more sense for LLM inputs to be images rather than tokenized text. Text rendered as an image preserves information that tokenization discards--font, color, layout, emphasis--and allows a single image patch to encode what would require multiple tokens. Tokenizers, in this view, are a non-end-to-end legacy module that introduces unnecessary complexity; visually identical characters may map to different tokens due to Unicode encoding differences.

This perspective may be influenced by Karpathy's background in computer vision, but it points to a broader trend: multimodal interaction. Google's [AI Studio](https://aistudio.google.com/live) already offers a feature where users can share their screen with an AI and discuss what they are both looking at--a PDF, a diagram, a codebase. The experience resembles conversation with a colleague more than interaction with a chatbot. Both parties see the same artifact and can reference it directly.

If this mode of interaction matures, it could change how we think about AI collaboration. Rather than laboriously describing context in text prompts, users would simply show the AI what they are working on. The AI would perceive the same visual information a human colleague would. This could reduce the friction of context transfer and make AI assistance feel less like programming and more like conversation--though the underlying need for precision and clarity would remain.

## Voice interaction

Voice is equally promising as an interface modality. OpenAI's [Realtime API](https://platform.openai.com/docs/guides/realtime) demonstrates superb understanding of speech, enabling fluid verbal interaction that feels natural rather than stilted. Voice models can also use tools effectively, executing actions on the user's behalf while maintaining conversational flow.

One limitation is that voice models are typically trained for low latency rather than deep reasoning. Responsiveness matters in conversation; long pauses feel unnatural. This creates a tension between speed and depth. A potential solution is for voice models to call text models as tools when complex reasoning is required. The voice model handles real-time interaction while delegating analytical tasks to a model optimized for careful thought.

This architecture is reminiscent of Daniel Kahneman's [Thinking, Fast and Slow](https://www.amazon.com/Thinking-Fast-Slow-Daniel-Kahneman/dp/0374533555). The voice model functions as System 1--fast, intuitive, conversational. The text model functions as System 2--slow, deliberate, analytical. Just as humans benefit from both modes of cognition, AI systems may need both to handle the full range of tasks users present.

## Conclusion

AI will deliver real productivity gains, but they will be bounded by fundamental constraints. Amdahl's law limits overall speedup to the proportion of work that can be accelerated. Much knowledge work--problem definition, judgment, human coordination--resists acceleration. Historical patterns suggest productivity gains will be captured as increased output, not reduced hours.

Those who benefit most will be those who understand AI as a tool for accelerating specific tasks while remaining clear-eyed about which tasks those are. Expecting AI to eliminate the need for human effort will lead to disappointment. The irreducible elements of work--creativity, judgment, relationship-building, navigating ambiguity--are not inefficiencies to be optimized away. They are the core competencies that define human contribution.

---

[^1]: There is a fourth category--those who react with [Luddite](https://en.wikipedia.org/wiki/Luddite) hostility to new technology--but they are outside the scope of this discussion.
