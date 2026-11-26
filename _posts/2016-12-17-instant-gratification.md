---
layout: post
title: Instant gratification
excerpt: Good tools shorten the development feedback cycle
---

A feature I really enjoy in [CIDER](https://github.com/clojure-emacs/cider), Emacs' Clojure interactive development environment, is the overlaying[^1] of evaluation results next to the form being evaluated.

Normally, the evaluation results are displayed in the [echo area](https://www.gnu.org/software/emacs/manual/html_node/emacs/Echo-Area.html) at the bottom of Emacs. After every evaluation, I need to shift my gaze from the code I'm working on down to the echo area, then back. Doing this a few times is fine, but doing it hundreds of times during a coding session tires my eyes quickly.

With CIDER, evaluation results are displayed inline. Instead of moving my eyes away from the code, I can flick them a bit to the right and see the results, then fix the code as necessary. It shortens the feedback cycle and makes development much more enjoyable.

Artur Malabarba, author of the CIDER overlay code, also presented [a way to adapt it to Emacs Lisp](http://endlessparentheses.com/eval-result-overlays-in-emacs-lisp.html). Artur's implementation, however, depends on CIDER.

I've put together a package, [eros](https://github.com/xiongtx/eros), that removes the dependency on CIDER and toggles the overlay feature on/off with a minor mode. I plan to put it on [MELPA](https://melpa.org/#/) after getting some [feedback](https://www.reddit.com/r/emacs/comments/5iw5ml/eros_evaluation_result_overlays_for_emacs_lisp/) from the community. If possible, I'd like to generalize it so evaluation overlays can be made available to other packages (such as [SLIME](https://github.com/slime/slime), the inspiration for CIDER).

---

[^1]: An Emacs [overlay](https://www.gnu.org/software/emacs/manual/html_node/elisp/Overlays.html) is like a pop-up
