---
author: robjhyndman
comments: true
date: 2014-01-31 03:06:24+00:00

link: https://robjhyndman.com/hyndsight/granada-workshop/
slug: granada-workshop
title: Automatic time series forecasting in Granada
wordpress_id: 2421
categories:
- computing
- conferences
- forecasting
- R
- references
- seminars
- statistics
- time series
---

In two weeks I am presenting a workshop at the University of Granada (Spain) on [_Automatic Time Series Forecasting_](http://docto-si.ugr.es/seminario/p-hyndman.html).

Unlike most of my talks, this is not intended to be primarily about my own research. Rather it is to provide a state-of-the-art overview of the topic (at a level suitable for Masters students in Computer Science). I thought I'd provide some historical perspective on the development of automatic time series forecasting, plus give some comments on the current best practices.<!-- more -->


### Pre-reading


Those attending are asked to do some pre-reading. Here are the papers I've requested to be read beforehand:




  1. [Makridakis & Hibon, (JRSSA 1979)](http://www.jstor.org/stable/2345077) was the first serious attempt at a large empirical evaluation of forecast methods.  It was followed by discussion which is documented in the paper. The discussion is heated and entertaining, and important in understanding the different perspectives on this topic at the time.


  2. [Makridakis & Hibon (IJF, 2000)](http://www.forecastingprinciples.com/paperpdf/Makridakia-The%20M3%20Competition.pdf) can be considered a successor to the 1979 paper and describes the largest published forecasting competition to date. While the algorithms used are not discussed in any detail, the resulting comparisons are provided.


  3. [Gomez and Marvall (2001)](http://dx.doi.org/10.1002/9781118032978.ch7) must be included, not just because it is by two well-known Spanish time series analysts. It provides the best introduction to automatic time series model selection and is a useful starting point on some of the theory.


  4. [Hyndman and Khandakar (JSS 2008)](http://www.jstatsoft.org/v27/i03/paper) describes two extremely widely used automatic forecasting algorithms. These have been improved in the last five years, but the basic algorithms are most clearly described there.


Obviously more has happened in the field in the last 5 or 6 years, and I will also talk a little about those developments.


### Abstract


Many applications require a large number of time series to be forecast completely automatically. For example, manufacturing companies often require weekly forecasts of demand for thousands of products at dozens of locations in order to plan distribution and maintain suitable inventory stocks. In these circumstances, it is not feasible for time series models to be developed for each series by an experienced analyst. Instead, an automatic forecasting algorithm is required.

In addition to providing automatic forecasts when required, these algorithms also provide high quality benchmarks that can be used when developing more specific and specialized forecasting models.

I will describe some algorithms for automatically forecasting univariate time series that have been developed over the last 20 years. The role of forecasting competitions in comparing the forecast accuracy of these algorithms will also be discussed.

Finally, I will describe methods for evaluating forecasting algorithms which use the available data as efficiently as possible.



### Slides

{{< slideshare ceEYMgsEK22G9z >}}
