---
layout: post
title: Artificial Darwinism
excerpt: What if AI models, tools, and users are forced to co-evolve?
audio: /audio/2025-11-01-artificial-darwinism.mp3
---

I've been doing [some work]({% post_url 2025-08-21-will-ai-replace-programmers %}) with [Model Context Protocol](https://modelcontextprotocol.io/docs/getting-started/intro) (MCP) lately, and have been very impressed by the ability of large language models (LLMs) to use tools. Agentic AIs like [Claude Code](https://www.claude.com/product/claude-code) can chain multiple tools (list directory, grep file, read lines, etc.) together to solve complex problems like programming. This got me thinking--what if, instead of the small number of tools that models are provided with up-front, they could instead search through a vast catalog of tools, write their own when needed, and compete to see which models and tools are the most effective?

## Take what you need

Modern LLMs have relatively small context windows of ~200K tokens[^1]. Some have [longer context](https://ai.google.dev/gemini-api/docs/long-context) of around 1 million, but speed and performance both degrade with length. The MCP protocol has a [`tools/list`](https://modelcontextprotocol.io/specification/2025-06-18/server/tools#listing-tools) action that returns all tools known to the server, which can [fill up](https://github.com/modelcontextprotocol/modelcontextprotocol/issues/1308) the context window quickly. One reason is that JSON contains a lot of symbols like `{` and `}` , which get [parsed](https://tiktokenizer.vercel.app/) into separate tokens. There are proposed [data formats](https://github.com/johannschopplich/toon) that are more economical than JSON[^2], but models are not likely to be well-trained on them, so performance may suffer in exchange for a measly 30% savings.

The solution I've struck on is to start with a single tool, `loadTools`, which is given the names and descriptions of all tools, but not the schemas, which account for the bulk of tokens. When the AI believes it needs tools to solve a problem, it loads them by name, at which point the full tools are attached. I haven't had the need for `unloadTools` yet, but one can imagine that if many tools are needed earlier in the conversation, but will no longer be used going forward, it may be helpful to remove them from the context.

This is similar to the **progressive disclosure** strategy of the newly released [Claude Skills](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills), which initially adds only skill names and descriptions to the context. When the AI needs to use a skill, it starts by reading a `SKILLS.md` file, then any referenced files as necessary. This allows multiple levels of disclosure, with the AI deciding whether to go down a rabbit hole.

## All in the pot

What if there are many more tools? 1,000's, perhaps, or [10,000's](https://github.com/modelcontextprotocol/modelcontextprotocol/issues/1300#issuecomment-3165611569)? The `loadTools` solution, which requires basic knowledge of all tools up-front, breaks down. Instead, we might have `searchTools`, which takes a plain language search query like "I need a tool that does OCR on PDFs" and returns e.g. the top 10 ranked tools according to a similarity search. This seems like a more robust solution than the [proposal](https://github.com/modelcontextprotocol/modelcontextprotocol/issues/1300) to add groups and tags to tools for filtering[^3].

Semantic search would be especially superior in a scenario where tools from many servers are aggregated. Different server designers may choose different groupings and keywords, making merging toolsets unworkable. If we avoid arbitrary metadata and only focus on key characteristics like name, description, and input / output schemas, relying on ML techniques like [retrieval-augmented generation](https://aws.amazon.com/what-is/retrieval-augmented-generation/) (RAG) to surface the right candidates at the right time, we'd have a much more scalable solution.

In fact, we can imagine a whole ecosystem of toolsets provided by various parties--model developers, service vendors, and users--from which custom catalogs can be assembled. Within such an ecosystem, [simple, composable tools](https://cscie2x.dce.harvard.edu/hw/ch01s06.html) are likely to see wider use. Metrics can be gathered to see which tools are more commonly selected by AIs, how effectively they're used, and which patterns should be followed by future tool developers.

## Unnatural selection

Loading and unloading tools is a minor way of turning AIs into [self-modifying programs](https://en.wikipedia.org/wiki/Self-modifying_code)--their capabilities at any given time is decided by their own judgment. Given AI's impressive [coding skills](https://www.anthropic.com/news/claude-sonnet-4-5), the next step would be for models to create their own tools. Perhaps, after looking through the catalog, they find no out-of-the-box tool that does OCR on PDFs. Then, they gather knowledge on the web to learn how to create such a tool, code it up in a sandbox, then load and use the tool to solve the problem. If the user allows it, the tool can be published for others to access.

Through the process of building, picking, and evaluating tools, there will be intense pressure for users, models, and tools to co-evolve. The best[^4] tools will become the most popular, but so will the models that are able to work most effectively with the tools. And users who are the most skilled at using both will become the most productive, and have the loudest voice in deciding on the ecosystem's future direction.

As with any valuable enterprise, there will be bad actors trying to game the system. AI safety is an area of intense research, and new capabilities inevitably introduce [new risks](https://www.nbcnews.com/tech/tech-news/ai-browsers-comet-openai-hacked-atlas-chatgpt-rcna235980). While there will be headline-inducing scandals along the way, the payoffs are so large that there's no option but to charge full-steam ahead into this brave new world.

---

[^1]: Many people hear "token" and think "word", but a word usually comprises multiple tokens, similar to syllables. A good rule of thumb is [4 characters per token](https://help.openai.com/en/articles/4936856-what-are-tokens-and-how-to-count-them#h_4ae02e0c88).

[^2]: Ironic, given that JSON became popular in large part due to the the verbosity of XML.

[^3]: To be fair, one of the design goals of MCP is to keep the server simple and push complexity to the client. Nonetheless, systems that rely on human-generated metadata tend to work poorly and evolve even worse.

[^4]: There are many dimensions on which tools and models can be the "best": getting the most accurate answer, delivering results the fastest, costing the least, etc. The overall best will be one that has the most desirable "[talent stack](https://www.amazon.com/How-Fail-Almost-Everything-Still/dp/1591847745)".
