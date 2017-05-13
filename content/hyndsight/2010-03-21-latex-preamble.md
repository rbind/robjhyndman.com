---
author: robjhyndman
comments: true
date: 2010-03-21 09:44:12+00:00

link: https://robjhyndman.com/hyndsight/latex-preamble/
slug: latex-preamble
title: My standard LaTeX preamble
wordpress_id: 737
categories:
- LaTeX
---

When I was a PhD student, I found I needed a lot of LaTeX functionality that did not then exist. So I wrote my own package which has served me well for about 20 years. It is called HyTeX.sty (the name being a shameless take-off of LaTeX from Leslie Lamport as well as a homonym of High-Tech). The advantage of having my own package is that almost every file starts with

    
    \documentclass{article}
    \usepackage{hytex}
    \begin{document}


All the other packages that I use are called from within HyTeX.sty.

After 20 years of using HyTeX, I've decided it is time to put it to rest. Most of the functionality in the package is now available in packages on CTAN, and usually with more features and facilities. Further, when I work with coauthors, I need to send them the latest version of HyTeX as well (as I revise it from time to time).

So from now on, I'm only using packages from CTAN. These are automatically available to all my coauthors so we don't have any issue with different versions (provided they keep their TeX implementation up to date!).

An immediate consequence of this is that I need to replace my standard preamble. After experimenting a little, here is what I am now using:

    
    \usepackage{graphicx,hyperref,amsmath,natbib,bm,url}
    \usepackage{microtype,todonotes}
    \usepackage[australian]{babel}
    \usepackage[a4paper,text={16.5cm,25.2cm},centering]{geometry}
    \usepackage[compact,small]{titlesec}
    \setlength{\parskip}{1.2ex}
    \setlength{\parindent}{0em}
    \clubpenalty = 10000
    \widowpenalty = 10000
    \usepackage{kpfonts}
    \usepackage[T1]{fontenc}


A few words of explanation may be in order.



	
  * The first line loads a lot of standard packages that I use all the time.

	
  * The latex default page size is awful, so I load [geometry](http://mirror.ctan.org/macros/latex/contrib/geometry/geometry.pdf) to set up the page to something more sensible.

	
  * The latex default section headings seem too large and too widely spaced to me, hence the use of [titlesec](http://ctan.org/tex-archive/macros/latex/contrib/titlesec/titlesec.pdf). This package also allows me to do a lot of additional fine-tuning if required.

	
  * I prefer paragraphs with spaces between them and no indentation; this is achieved by setting the lengths of `\parskip` and `\parindent` accordingly.

	
  * The settings for `\clubpenalty` and `\widowpenalty` prevent [orphans and widows](http://en.wikipedia.org/wiki/Widows_and_orphans).

	
  * One of my pet peeves is the US date format "March 21, 2010" which seems to me to be in the wrong order. I prefer "21 March 2010" so that the time units increase in size: day month year. I fix this using the `babel` package with the `australian` option.

	
  * Finally, I am sick of the standard LaTeX font "Computer Modern Roman". It's actually a very good font, but it is used so much I find it tiresome. So I'm using [kpfonts](http://www.ctan.org/tex-archive/fonts/kpfonts/doc/kpfonts.pdf) instead which includes a complete set of features including mathematics as well as non-math characters and looks a little more interesting without being distracting.


I'd be interested to know how this preamble compares with the standard preambles used by other LaTeXers.
