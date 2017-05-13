---
author: robjhyndman
comments: true
date: 2010-10-22 09:23:52+00:00

link: https://robjhyndman.com/hyndsight/how-to-avoid-annoying-a-referee/
slug: how-to-avoid-annoying-a-referee
title: How to avoid annoying a referee
wordpress_id: 1097
categories:
- journals
- R
- refereeing
- references
- reproducible research
- StackExchange
- statistics
- writing
---

It's not a good idea to annoy the referees of your paper. They make recommendations to the editor about your work and it is best to keep them happy. There is an [interesting discussion on stats.stackexchange.com on this subject](http://stats.stackexchange.com/q/3814/159). This inspired my own list below.

  * Explain what you've done clearly, avoiding unnecessary jargon.
  * Don't claim your paper contributes more than it actually does. (I refereed a paper this week where the author claimed to have invented principal component analysis!)
  * Ensure all figures have clear captions and labels.
  * Include citations to the referee's own work. Obviously you don't know who is going to referee your paper, but you should aim to cite the main work in the area. It places your work in context, and keeps the referees happy if they are the authors.
  * Make sure the cited papers say what you think they say. [Sight what you cite!](https://robjhyndman.com/hyndsight/sight-what-you-cite/)
  * Include proper citations for all software packages. If you are unsure how to cite an R package, try the command `citation("packagename")`.
  * Never plagiarise from other papers --- not even sentence fragments. Use your own words. I've refereed a thesis which had slabs taken from my own lecture notes including the typos.
  * Don't plagiarise from your own papers. Either reference your earlier work, or provide a summary in new words.
  * Provide enough detail so your work can be replicated. Where possible, provide the data and code. Make sure the code works.
  * When responding to referee reports, make sure you answer everything asked of you. (See my earlier post "[Always listen to reviewers](https://robjhyndman.com/hyndsight/always-listen-to-reviewers/)")
  * If you've revised the paper based on referees' comments, then thank them in the acknowledgements section.


For some applied papers, there are specific statistical issues that need attention:

  * Give effect sizes with confidence intervals, not just p-values.
  * Don't describe data using the mean and standard deviation without indicating whether the data were more-or-less symmetric and unimodal.
  * Don't split continuous data into groups.
  * Make sure your data satisfy the assumptions of the statistical methods used.


More tongue-in-cheek advice is provided by [Stratton and Neil (2005), "How to ensure your paper is rejected by the statistical reviewer". Diabetic Medicine, 22(4), 371-373.](http://dx.doi.org/10.1111/j.1464-5491.2004.01443.x)

Feel free to add your own suggestions over at [stats.stackexchange.com](http://stats.stackexchange.com/q/3814/159).
