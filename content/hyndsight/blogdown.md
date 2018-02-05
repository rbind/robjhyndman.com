---
comments: true
date: 2017-04-30
slug: blogdown
title: Converting to blogdown
categories:
- computing
- R
---


This website has gone through several major updates over the years. It began in 1993 as some handcrafted html files, transitioned to Joomla and later to Wordpress. Then it slowly grew into a collection of ten connected Wordpress installations that became increasingly difficult to maintain, and rather slow.

So I've now converted the entire site to Blogdown/Hugo. Nearly 700 pages of wordpress content have been translated to markdown. I decided to drop a few parts of the site, notably the pages for my [1998 forecasting textbook](/forecasting). I also removed all software pages -- preferring to host them on [github](http://github.com/robjhyndman/) instead. It is now much faster to load, and much easier to maintain.

Blogdown is relatively new and the [documentation](https://bookdown.org/yihui/blogdown/) is rather incomplete, so there was a lot of trial and error as I figured out how it worked. Some useful resources were:

  * Amber Thomas's [blog post](https://amber.rbind.io/blog/2016/12/19/creatingsite/) on making a website using blogdown, hugo and github pages.
  * Justin Dunham's [blog post](http://justindunham.net/migrating-from-wordpress-to-hugo/) on migrating wordpress content to hugo.

Because it is all so new, the theming options are rather limited. I modified the [hugo-finite theme](https://themes.gohugo.io/hugo-finite/), and borrowed some design ideas from [Kieran Healy](https://kieranhealy.org/).

The source code for the site is now [hosted on github](https://github.com/robjhyndman/robjhyndman.com).

Given the size of this site, there are bound to be some problems. So please feel free to [let me know](mailto:Rob.Hyndman@monash.edu) if anything doesn't work.
