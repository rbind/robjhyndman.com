---
author: robjhyndman
comments: true
date: 2010-05-20 12:10:00+00:00

link: https://robjhyndman.com/hyndsight/online-mathematical-resources/
slug: online-mathematical-resources
title: Online mathematical resources
wordpress_id: 782
categories:
- computing
- mathematics
---

### [DLMF](http://dlmf.nist.gov/)



For nearly 50 years, a standard reference in mathematical work has been Abramowitz and Stegun's (1964) _Handbook of Mathematical Functions with Formulas, Graphs, and Mathematical Tables_. It has provided a marvellous collection of results and tables that have been indispensable for a generation of mathematicians. I've used it to look up computationally efficient methods for calculating Bessel functions or gamma functions, or to find one of those trigonometric identities I learned in high school and no longer remember. Apparently nearly 1 million copies of the handbook have been printed and it has also been [scanned and put online](http://people.math.sfu.ca/~cbm/aands/).

Lately, the handbook has fallen out of favour a little, partly because there is not such a need for it. We no longer need tables for trigonometric functions or logarithms, and a lot of functions are built into R, including Bessel functions and variations on the gamma function. Another reason for its declining popularity has been the rise of online resources: if you want to know something about orthogonal polynomials, there is a good chance it is covered in the [Wikipedia article](http://en.wikipedia.org/wiki/Orthogonal_polynomials).

Now the handbook has been reissued as the _NIST Handbook of Mathematical Functions_ (Cambridge University Press) with a free web edition called the _[NIST Digital Library of Mathematical Functions](http://dlmf.nist.gov/) (DLMF)_. It has been updated to include colour graphics, pointers to recommended software, and lots of new topics to reflect work from the last 50 years.



### [WolframAlpha](http://www.wolframalpha.com/)



[WolframAlpha](http://www.wolframalpha.com) is now a year old and it has become a remarkable resource for some things. It was originally compared to Google which is inappropriate -- they are intended for different purposes. Google indexes the web, while WolframAlpha is a knowledge engine.

Recently I needed to find the integral of $2\tan(2x)\sec^6(2x)$. Typing `integral 2tan(2x)sec^6(2x)` gave me the result straight away. Of course, I could use Mathematica or Maple for this, but it is much easier to use my browser. It also means such algebraic results are available to everyone without needing specialist symbolic algebra software.

A few days later, I was working on a project involving modelling electricity demand as a function of temperature. The temperature data looked odd and I suspected it was all out by one day. To check, I typed `melbourne temperature 21 February 2010` into WolframAlpha and it promptly gave me the temperature data for Melbourne Airport for that day, and with one more click of the mouse I had the data for the whole week, confirming my suspicion.

For the sorts of things that WolframAlpha is good at, see the [examples page](http://www.wolframalpha.com/examples/).



### [Wikipedia](http://en.wikipedia.org)



Wikipedia needs no introduction and it is surprisingly good in some areas of mathematics (e.g., probability distributions) but not very good for some areas of statistics (e.g., see the article on [ARIMA models](http://en.wikipedia.org/wiki/Autoregressive_integrated_moving_average) or the one on Cronbach's alpha). The good news is that the statistics articles are improving and is now starting to be usable as a first port of call when looking up an unfamiliar method.
