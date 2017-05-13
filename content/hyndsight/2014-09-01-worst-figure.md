---
author: robjhyndman
comments: true
date: 2014-09-01 05:03:22+00:00

link: https://robjhyndman.com/hyndsight/worst-figure/
slug: worst-figure
title: A new candidate for worst figure
wordpress_id: 2879
categories:
- graphics
- IJF
- R
- statistics
---

Today I read a paper that had been submitted to the IJF which included the following figure

[![worstgraphic](/files/worstgraphic.png)](/files/worstgraphic.png)

along with several similar plots. (Click for a larger version.) I haven't seen anything this bad for a long time. In fact, I think I would find it very difficult to reproduce using R, or even Excel (which is particularly adept at bad graphics).

A few years ago I produced ["Twenty rules for good graphics"](https://robjhyndman.com/hyndsight/graphics/). I think I need to add a couple of additional rules:




    
  * Represent time changes using lines.

    
  * Never use fill patterns such as cross-hatching.



(My original rule #20 said Avoid pie charts.)

It would have been relatively simple to show these data as six lines on a plot of GDP against time. That would have made it obvious that the European GDP was shrinking, the GDP of Asia/Oceania was increasing, while other regions of the world were fairly stable. At least I think that is what is happening, but it is very hard to tell from such graphical obfuscation.
