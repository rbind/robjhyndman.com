---
author: robjhyndman
comments: true
date: 2008-05-07 07:59:29+00:00

link: https://robjhyndman.com/hyndsight/giving-a-research-seminar/
slug: giving-a-research-seminar
title: Giving a research seminar
wordpress_id: 63
categories:
- beamer
- LaTeX
- seminars
---

**An expanded version of this post is available in my article on [“Giving an academic talk”](/publications/usertalk/).**



With conference season almost upon us, it is timely to discuss what makes a good conference presentation. Here is a suggested structure.

  1. A motivating example demonstrating the problem you are trying to solve.
  2. Explain existing approaches to the problem and their weaknesses.
  3. Describe your main contributions.
  4. Show how your ideas solve the problem/example you started with.

That won't necessarily work for every talk, but it is a good place to start. In particular, beginning with a motivating example is **much** better than setting up the problem algebraically.

#### Further suggestions:
    
  * Use Rmarkdown with this [template](https://github.com/robjhyndman/monashebstemplates).
  * Use a maximum of 20 slides for a 20 minute conference presentation.
  * Assume the audience knows about what you did at the start of your research in this area. That is, probably not much. You can assume standard material taught to undergraduates (regression, ARIMA models, etc.), but don't assume they already know what you have spent long hours learning on your own.
  * Give only the most necessary mathematical details. People do not quickly absorb mathematical equations so don't give any more than you have to. Never give proofs.
  * When you do include some algebra, define all terms used. Why make the audience guess?
  * Use graphs instead of tables where possible.
  * Where possible, let the graph fill the slide.
  * Use `\begin{block}...\end{block}` to highlight equations or important information.
  * Do not use equation numbering, figure numbering, etc. The listeners can't go back and see which one you are referring to.
  * At the bottom of the last slide, give your website or email address for people to contact you if they want to read the paper or download your R code.
  * Go through all your slides and see what you can remove. Less text is better.
  * Go through all your slides again and check that the titles are emphasizing the right thing. Fix them where necessary.
  * Go through all your slides again just to make sure you can't see anything that could be improved.
  * Read Jonathan Shewchuk's advice on [giving an academic talk](http://www.cs.berkeley.edu/~jrs/speaking.html).
  * Practise. Out loud. Standing up. Using a data projector.

