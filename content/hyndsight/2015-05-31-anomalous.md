---
author: robjhyndman
comments: true
date: 2015-05-31 05:59:52+00:00
mathjax: true
link: https://robjhyndman.com/hyndsight/anomalous/
slug: anomalous
title: A new R package for detecting unusual time series
wordpress_id: 3283
categories:
- computing
- data science
- R
- time series
---

The [anomalous package](https://github.com/robjhyndman/anomalous-acm) provides some tools to detect unusual time series in a large collection of time series. This is joint work with [Earo Wang](http://earo.me) (an honours student at Monash) and [Nikolay Laptev](http://labs.yahoo.com/author/nlaptev/) (from Yahoo Labs). Yahoo is interested in detecting [unusual patterns in server metrics](https://yahooresearch.tumblr.com/post/118966433256/egads-a-scalable-configurable-and-novel-anomaly). <!-- more -->

The package is based on [this paper with Earo and Nikolay](/publications/icdm2015/).

The basic idea is to measure a range of features of the time series (such as strength of seasonality, an index of spikiness, first order autocorrelation, etc.) Then a principal component decomposition of the feature matrix is calculated, and outliers are identified in 2-dimensional space of the first two principal component scores.

We use two methods to identify outliers.





  1. A bivariate kernel density estimate of the first two PC scores is computed, and the points are ordered based on the value of the density at each observation. This gives us a ranking of most outlying (least density) to least outlying (highest density).

  2. A series of $\alpha$-convex hulls are computed on the first two PC scores with decreasing $\alpha$, and points are classified as outliers when they become singletons separated from the main hull. This gives us an alternative ranking with the most outlying having separated at the highest value of $\alpha$, and the remaining outliers with decreasing values of $\alpha$.


I explained the ideas in a talk last Tuesday given at a [joint meeting of the Statistical Society of Australia and the Melbourne Data Science Meetup Group](http://www.meetup.com/Data-Science-Melbourne/events/220621482/). Slides are available [here](/seminars/big-time-series/). A link to a video of the talk will also be added there when it is ready.

The density-ranking of PC scores was also used in my work on detecting outliers in functional data. See my [2010 JCGS paper](/publications/rainbow-fda/) and the associated [rainbow package for R](http://cran.r-project.org/package=rainbow).

There are two versions of the package: one [under an ACM licence](https://github.com/robjhyndman/anomalous-acm), and a limited version [under a GPL licence](https://github.com/robjhyndman/anomalous). Eventually we hope to make the GPL version contain everything, but we are currently dependent on the [alphahull package](http://cran.r-project.org/package=alphahull) which has an ACM licence.
