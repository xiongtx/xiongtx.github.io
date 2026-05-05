---
layout: post
title: What limits productivity gains?
excerpt: Technological breakthrough doesn't equal economic revolution
audio: /audio/2026-06-03-what-limits-productivity-gains.mp3
---

In a previous [post]({% post_url 2025-08-21-will-ai-replace-programmers %}) on whether AI will replace programmers, we touched on the issue of productivity gains from AI and how most businesses have yet to see a significant [return on investment](https://news.bloomberglaw.com/legal-ops-and-tech/ai-spending-surge-prompts-companies-to-wrestle-with-its-worth). While companies are splurging [hundreds of billions](https://www.bloomberg.com/news/articles/2025-11-24/why-ai-bubble-concerns-loom-as-openai-microsoft-meta-ramp-up-spending?embedded-checkout=true) per year on AI models and infrastructure, there are fears about a balance sheet mismatch between short-term liabilities and long-term profits. There is, however, still a general faith among the C-suite that AI will [transform](https://www.mckinsey.com/capabilities/quantumblack/our-insights/the-state-of-ai) their businesses and unlock massive gains, if only they can stick it out a little longer. So much money is riding on this belief that we must examine it rigorously--and it doesn't take much to start poking holes in the argument.

## Reaching the limit

[Amdahl's law](https://en.wikipedia.org/wiki/Amdahl%27s_law), formulated by computer scientist Gene Amdahl in 1967, states that the speedup of a system is limited by the portion that cannot be improved. Mathematically:

$$
S = \frac{1}{(1 - p) + \frac{p}{s}}
$$

where \\( S \\) is the overall speedup, \\( p \\) is the proportion of work that can be accelerated, and \\( s \\) is the speedup factor for that portion. As \\( s \rightarrow \infty \\), the overall speedup is bounded by \\( \frac{1}{1 - p} \\).

Consider a task where AI can accelerate 50% of the work. Even if AI completes that portion infinitely fast, the overall speedup is only \\( 2\times \\). For AI to turn an average programmer into a "\\( 10\times \\) developer", it would have to trivialize 90% of their work--a completely unrealistic proportion even if we believe that tools can handle most of the coding and design ([they can't]({% post_url 2026-03-17-far-from-perfect %})).

## Expanding the horizon

Amdahl's Law seems to impose harsh constraints on productivity gains, but there is a way out. [Gustafson's Law](https://en.wikipedia.org/wiki/Gustafson%27s_law) says that, though some portion of a task can't be sped up, we can do more of the part that _can_, in effect decreasing the proportion that is resistant to acceleration.

This is the distinction between [strong and weak scaling](https://hpc-wiki.info/hpc/Scaling#Strong_or_Weak_Scaling). In the former, the problem size stays the same, while in the latter it is increased. Suppose a programmer spends 2 hours a day on administrative work and 6 hours coding a project[^1]. If an AI agent can write the code in 2 hours, they'll have done the day's work in half the time. But if the programmer could spend the other 4 hours coding up two more projects, they'll have tripled their output in the same amount of time as before[^2].

So does this unlock miraculous productivity gains? That depends on whether there is enough work that can be sped up with AI. When it comes to software development, Fred Brooks in [The Mythical Man-Month](https://www.cs.drexel.edu/~yc349/CS451/RequiredReadings/MythicalManMonth.pdf) estimates that only a small fraction of time should be reserved for coding:

> For some years I have been successfully using the following rule of thumb for scheduling a software task:
>
> - \\( 1/3 \\) planning
> - \\( 1/6 \\) coding
> - \\( 1/4 \\) component test and early system test
> - \\( 1/4 \\) system test, all components in hand

Even as the other parts are or can be automated to some extent, coding is still the minority of most programmers' days. We have a tendency to caricaturize other people's jobs as comprising mostly some straightforward technical work. But a carpenter is not primarily a woodcutter, nor is a programmer a glorified typist. Every non-menial job is dominated by communication, planning, evaluation, design, and so on. The final implementation is typically viewed as trivial, and handed to the most junior employees[^3].

## Balancing the scales

In 1987, economist Robert Solow famously observed that:

> You can see the computer age everywhere but in the productivity statistics

Computers were in widespread business use by that time, yet [productivity growth](https://fred.stlouisfed.org/series/OPHNFB) was modest, even below trend. This became known as the [Solow Paradox](https://en.wikipedia.org/wiki/Productivity_paradox): local efficiency gains were obvious, yet macroscopic impact was nowhere to be found.

A [number of causes](https://www.brookings.edu/articles/the-solow-productivity-paradox-what-do-computers-do-to-productivity/) were invented to explain this discrepancy. One argument was that computers were still too small a share of GDP to have much influence. Another, that old productivity measurements weren't capturing the benefits brought about by the new machines. Still others doubted that computers were all that productive at all--lots of ambitious projects using computers failed, and the trumpeted successes were just survivorship bias.

None of these is particularly satisfactory, especially since productivity picked up in the early 1990's, even before the dot-com boom. There's no strong argument to be made that businesses which had trouble getting value out of computers in 1987 suddenly, and simultaneously, found the trick to doing so in 1993. What unlocked value was not a technological leap, but a political earthquake.

Throughout the Cold War, defense spending consumed a [large share of GDP](https://www.war.gov/Multimedia/Photos/igphoto/2002099941/). When the Soviet Union collapsed in 1991, military budgets quickly fell. Money that had been reserved for warships and fighter jets was suddenly available for [household consumption](https://fred.stlouisfed.org/series/DPCERE1Q156NBEA). In addition, the fall of the Iron Curtain meant hundreds of millions of Eastern Bloc consumers were suddenly accessible.

The unexpected surge in demand was what allowed the increased output from computer usage to manifest as GDP. Without corresponding demand, more output not only fails to grow the economy, but undermines it. As an example, consider a refrigerator manufacturer that makes 100 fridges a year. If a more efficient production line allowed them to pump out 200 fridges, but there weren't an extra hundred buyers, the result is oversupply, price collapse, disappearing profits, and eventually layoffs. The unemployed workers further [subtract demand]({% post_url 2020-04-25-dynamics-of-insufficient-demand %}) from the market, so that only 95 fridges can be sold, creating a vicious cycle[^4].

## Forcing the issue

Three forces, then, limit the productivity gains AI can deliver. Amdahl's Law caps any speedup by the share of work that resists acceleration. Gustafson's Law offers a way past that ceiling, but only where there is more accelerable work to expand into--and most jobs, including software development, are dominated by the parts AI handles least well. Even when output does rise, it cannot register as economic growth without matching demand, as the Solow Paradox revealed: computers were everywhere by 1987, but the gains stayed invisible in the statistics until the post-Cold War demand surge of the early 1990s caught up to them.

History tells us that supply-demand imbalances are rarely resolved by patient adjustment. The Industrial Revolution's overcapacity gave way to [Luddite](https://www.history.com/articles/who-were-the-luddites) uprisings, and the industrial expansion of WWI was followed by a [sharp contraction in 1920](https://econreview.studentorg.berkeley.edu/in-the-shadow-of-the-slump-the-depression-of-1920-1921/), strikes, and riots. The challenge is sharper today, as economic imbalances have [become global](https://press.princeton.edu/books/paperback/9780691163628/the-great-rebalancing).

In an echo of the early 20th century, nations are now engineering demand through [defense spending](https://www.csmonitor.com/USA/Military/2026/0429/trump-pentagon-defense-budget), not least [for AI](https://www.fastcompany.com/91536036/pentagon-announces-deals-google-nvidia-more-use-ai-in-fighting-wars). As a general rule, weapons that are built will be used[^5]. Today that means engineered demand; tomorrow, perhaps, engineered war. Let us pray that the productive facilities of AI are not frustrated in every direction but that of conflict.

---

[^1]: Most corporate developers _wish_ their day was partitioned like this.

[^2]: This, of course, is the outcome companies want to see, as opposed to the programmer going home at 1:00 PM. Claims that AI, or any technology, will help bring about the [4-hour workday](https://www.axios.com/2025/06/29/ai-productivity-four-day-work-week) are as deluded as they are historically illiterate.

[^3]: This is especially true in fields like law or banking, where document review and number crunching are done by recent college grads, while partners earn their keep by hosting cocktail parties for potential clients.

[^4]: It may seem obvious that the refrigerator company should simply _not_ produce so many extra units, but that's only a winning strategy if it has a monopoly. If there are several competing brands, they must each apply the more efficient production technology to protect market share, lest the others squeeze them out. This tragedy of the commons can be seen today in industries like [solar panels](https://www.cnbc.com/2026/04/20/china-solar-production-energy-iran-war.html).

[^5]: Even if it's decades later, in a [very different war]({% post_url 2022-10-18-putins-political-constraints %}).
