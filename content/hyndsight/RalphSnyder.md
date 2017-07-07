---
date: 2017-07-07
slug: ralph-snyder
title: IIF Fellow Ralph Snyder
image: /img/Ralph.jpg
categories:
- statistics
- prizes
- forecasting
---

<img src="/img/Ralph.jpg" width=200>


At the *International Symposium on Forecasting* last week, my friend and colleague [Ralph Snyder](https://scholar.google.com/citations?user=mlwKz6cAAAAJ&hl=en) was made a Fellow of the International Institute of Forecasters.
<!--more-->

In most years, one or two IIF Fellows are elected, so it is a rare honour. Previous fellows have included the late Robert G Brown, Clive Granger and Arnold Zellner, and the very-much-alive Scott Armstrong, Frank Diebold, Robert Engle, Robert Fildes, David Hendry and Spyros Makridakis.

Ralph Snyder is an Associate Professor in the Department of Econometrics & Business Statistics at Monash University. He is the originator of the innovations state space approach to exponential smoothing. This began with his 1985 paper in the *Journal of the Royal Statistical Society Series B*  entitled [“Recursive Estimation of Dynamic Linear Models”](http://www.jstor.org/stable/2345570). Over the years, he developed the approach leading to his 1997 paper in the *Journal of the American Statistical Association* entitled [“Estimation and Prediction for a Class of Dynamic Nonlinear Statistical Models”](http://dx.doi.org/10.1080/01621459.1997.10473684) published with his two close friends and  distinguished IIF fellows Keith Ord and Anne Koehler. (That paper took 7 years from conception to publication!)

I joined the same department as Ralph in 1998 and I remember discussing his JASA paper with him not long after I arrived in the context of a consulting job I was doing. I needed a fast, reliable and automatic method for producing forecasts of thousands of time series. I hit upon the idea of extending his JASA paper to include all the possible combinations of exponential smoothing state space models, and then using the AIC to select the best one. It worked very well for my client, so we wrote up a paper for the IJF (coauthored with Ralph, Anne and Simone Grose, and published in 2002)  entitled [“A State Space Framework for Automatic Forecasting using Exponential Smoothing Methods”](/publications/hksg/).

A few more papers followed with various combinations and permutations of authors. One problem was that the papers Ralph and coauthors had written over the years used different notation, sometimes corrected previous errors, and were difficult for newcomers to read without all the historical context. So I suggested to Ralph, Anne and Keith that we write a book together, bringing all the ideas into one place with a common notation and coherent sequence. Hence, our 2008 Springer book ["Forecasting with Exponential Smoothing: the State Space Approach"](http://exponentialsmoothing.net) came into the world.

![The four authors](/img/HOKS.jpg)
*The four authors (from left): Rob Hyndman, Keith Ord, Anne Koehler, Ralph Snyder. Taken at the 2008 ISF in Nice, France.*

Around the same time, I wrote the [`ets()` function](http://pkg.robjhyndman.com/forecast/reference/ets.html) for the **forecast** package in R, which made many of Ralph's research ideas available for anyone to use.

Ralph’s contributions have been revolutionary in developing the innovations state space approach to exponential smoothing as a competitive alternative to the ARIMA framework, with the advantage that this framework can account for non-linear processes (so there is no need to use Box-Cox transformations, for example).

Ralph is one of the most creative and innovative thinkers I have worked with. He is constantly coming up with new ideas, new ways of thinking about forecasting models, or new approaches to tackle problems we are working on. This has meant that he has many ideas that never make it into print because he is off thinking about something else instead. Anne, Keith and I have often joked that our main coauthorship role has been to turn Ralph's ideas into publications, leaving him to think up something else for the next paper.

Often we would get a response from a journal asking for relatively minor revisions, but Ralph would have moved on and decided the paper needed to be completely re-written to conform to his latest way of thinking about the problem! Frequently, we would handle the revisions without him, and suggest he just start working on the next paper instead.

I suspect that part of the reason for Ralph's ability to generate new ideas is that he sometimes doesn't remember the old ones. More than once, he has come into my office saying he had a great idea for a paper, only for me to tell him we have already written a paper on that exact topic.

In addition to his research, Ralph has also provided invaluable service to the IIF community being program co-chair for the Sydney ISF in 2004, serving on the board of directors from 2007 to 2011, and as IIF treasurer from 2007 to 2009, as well as being a frequent and invaluable reviewer for the IJF.

Ralph Snyder is a lovely, gentle man (and a gentleman), and it has been an honour to have been able to work with him over the years. He is a worthy recipient of an IIF Fellowship, and I hope he continues to generate many new forecasting ideas in the years to come.
