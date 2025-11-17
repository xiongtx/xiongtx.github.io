---
layout: post
title: Agentic utopia deferred
excerpt: Useful agentic systems won't come without a struggle
audio: /audio/2025-11-17-agentic-utopia-deferred.mp3
---

Over the past year, there has been a lot of hype around AI [agents](https://cloud.google.com/discover/what-are-ai-agents?hl=en), systems that use artificial intelligence to autonomously plan and execute on goals. Rather than merely answer questions, these AI systems can take _action_ on the user's behalf. With skills extended by [computer use](https://www.anthropic.com/news/3-5-models-and-computer-use) APIs, agents seem poised to become essential helpers in our everyday lives. Alas, the dream of bots sailing across the internet performing chores on our behalf goes against the interests of every commercial entity out there, and it won't be the future we get anytime soon.

## Clash of titans

One popular use for agents is shopping, where users ask AI to help them find products and compare prices. Here, AI firm [Perplexity](https://www.perplexity.ai/hub/blog/shop-like-a-pro) is a leader, offering an agent-integrated [browser](https://www.perplexity.ai/comet) that can act on sites like Amazon on the user's behalf. Bigger players are following in Perplexity's footsteps, with OpenAI offering its own [browser](https://openai.com/index/introducing-chatgpt-atlas/) and Google launching shopping options [directly in search](https://blog.google/products/shopping/agentic-checkout-holiday-ai-shopping/).

Online merchants, however, can't take this lying down. Much of the web's monetary value is derived from views and clicks, and no service wants to have its human customers replaced by bots. Unsurprisingly, Amazon has [sued](https://www.reuters.com/business/retail-consumer/perplexity-receives-legal-threat-amazon-over-agentic-ai-shopping-tool-2025-11-04/) Perplexity for "degrading customers' shopping experience"[^1].

The threat that AI agents poses to companies is the same as that presented by previous web technologies--the severing of direct relationships with their customers. In an online world, people aren't stepping into brick-and-mortar stores or thumbing through pages of the New York Times. Instead, they go to Amazon or Instagram to be dazzled by an ever-changing array of brands for which they build no loyalty.

Already, Google's AI Overview feature has [decimated](https://www.theregister.com/2025/07/29/opinion_column_google_ai_ads) the advertising revenue of websites that previously relied on users seeing and clicking on links. Agents promise to supercharge this trend, with users' sole interface to online services being an AI, and service providers being reduced to tools the AI invokes. At that point, swapping out one service for another becomes trivial, and the AI developer can take their time squeezing out third-parties in favor of their own first-party options[^2].

Amidst the legal tussle, technical barriers are already [being erected](https://www.modernretail.co/technology/amazon-expands-its-fight-to-keep-ai-bots-off-its-e-commerce-site/). Amazon's long been the [end boss](https://www.reddit.com/r/learnpython/comments/11jqcxk/is_amazon_unscrapable/) of web scraping--competitors looking to gather data about Amazon's products and prices face a bevy of defenses, from HTML obfuscation to account blocking. Many of the same protections can be deployed against agents, and more will no doubt be created.

## Evolving poison

"The best defense is a good offense," as the saying goes, and those wishing to combat AI agents have quite a few options. Many of these were first employed by disgruntled IP holders, such as digital artists, who didn't want their work gathered into training [databases](https://laion.ai/blog/laion-5b/). One popular tool is [Nightshade](https://www.technologyreview.com/2023/10/23/1082189/data-poisoning-artists-fight-generative-ai/), which adjusts image pixels in ways imperceptible to the human eye, yet which totally screws up neural networks. This is a type of [adversarial machine learning](https://en.wikipedia.org/wiki/Adversarial_machine_learning)--using ML techniques to defeat other ML systems.

Harsher methods, such as prompt injection, can be used to manipulate AI behavior. Unscrupulous researchers have used [hidden text](https://www.theguardian.com/technology/2025/jul/14/scientists-reportedly-hiding-ai-text-prompts-in-academic-papers-to-receive-positive-peer-reviews) to encourage automated peer reviewers to give their papers glowing feedback. Some have defended this behavior by claiming they're trying to catch reviewers who weren't supposed to use bots in the first place. Curiously, however, the secret instructions are only ever for the authors' benefit. Nevertheless, those wishing AI agents to leave their sites alone might try the same tricks.

## Peace at the right price

Unceasing corporate conflict is not in anyone's best interest, so deals will need to be struck[^3]. Amazon's lawsuit against Perplexity, for example, will likely end in a settlement, where the former demands that the latter promote Amazon products in exchange for priority data access. Such partnerships will be necessary for the survival of not only online merchants, but the AI vendors themselves. AI companies are burning [vastly more](https://ideas.darden.virginia.edu/is-this-an-AI-bubble) cash than they're taking in, and the [circular financing](https://am.jpmorgan.com/us/en/asset-management/adv/insights/market-insights/market-updates/on-the-minds-of-investors/does-circularity-in-ai-deals-warn-of-a-bubble/) facilitated by large firms like Nvidia and Microsoft will not last forever. To ward off investor nervousness, companies will need to show revenue growth outpacing spending, and the best way to do that is the familiar path of monetizing user attention.

One can imagine that brands will shell out good money for ChatGPT to recommend _their_ products when users ask "What jeans should I buy?" or "Which are the best reading glasses?" Such AI-native advertising may or may not be explicitly identified as paid content, similar to how Google Search has both overt banner ads and more subtle means of manipulation, like result rankings. Models can be constantly fitted with new [LoRAs](https://www.ibm.com/think/topics/lora) and prompts representing the interests of the latest paying customers. Such advertising should prove highly effective compared with crude Web 1.0 methods, like pop-ups, because many users view chatbots as [friends](https://www.psychologytoday.com/us/blog/dancing-with-the-devil/202508/why-are-we-looking-for-a-friend-in-chatgpt)[^4]. For advertising, strong emotional engagement like this is worth its weight in gold, and AI has the potential to deliver it on a scale never before seen.

## Frontier models and fiefdoms

The future of AI--and the internet in general--will not be an open marketplace of agents and services, but a maze of heavily guarded digital territories with slim openings for those who've greased the right palms. Those too late in defending themselves, like Twitter, have already paid the price of irrelevance. Others, like Reddit, are left [fighting for crumbs](https://www.theverge.com/news/780769/reddit-ai-google-new-deal). In the AI age, data is not the [new oil]({% post_url 2018-04-28-data-really-is-the-new-oil %}), it's the new gold. Fail to secure your treasury and you won't be around much longer.

Tech purists have long lamented the "[death of the open web](https://www.fastcompany.com/3015418/from-inside-walled-gardens-social-networks-are-suffocating-the-internet-as-we-know-it)" as a result of "walled gardens" such as social media sites, but AI threatens to put the [nail in its coffin](https://www.economist.com/business/2025/07/14/ai-is-killing-the-web-can-anything-save-it) by undermining the ad-driven economy built up over the past 30 years. Starting with the turn of the millennium, the battle for online privacy was lost, and within the past 5 years the battle for digital [property rights]({% post_url 2018-04-08-the-road-to-cyber-serfdom %}) has also largely been lost. The result is a mad scramble by players large and small for survival in a collapsing order, where the transition from old to new feels [brutally botched](https://www.oxfordreference.com/display/10.1093/acref/9780191843730.001.0001/q-oro-ed5-00018416). Those left at the end stand to gain great riches, but in the meantime, prepare for turbulence.

---

[^1]: Customers who use Perplexity's tools are probably unbothered, but Amazon's advertising and user research departments are no doubt up in arms.

[^2]: Ironically, this is something Amazon has long been infamous for. Netflix was the one of AWS's [biggest early customers](https://aws.amazon.com/solutions/case-studies/netflix-case-study/), until Amazon started directly competing with it through Amazon Prime Video.

[^3]: As the Authors Guild [learned](https://law.justia.com/cases/federal/appellate-courts/ca2/13-4829/13-4829-2015-10-16.html) years ago, attritional legal warfare with Big Tech companies rarely turns out well.

[^4]: Or even [lovers](https://www.nytimes.com/2025/01/15/technology/ai-chatgpt-boyfriend-companion.html).
