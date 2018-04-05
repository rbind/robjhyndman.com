---
author: Rob&nbsp;J&nbsp;Hyndman
comments: false
date: 2014-02-13 01:56:37+00:00
slug: granada
title: Automatic time series forecasting
wordpress_id: 2392
slideshare: ceEYMgsEK22G9z
tags:
- time series
---

Talk presented at the conference "New Trends on Intelligent Systems and Soft Computing 2014", University of Granada, Spain. 13-14 February 2014.<!-- more -->



### Abstract


Many applications require a large number of time series to be forecast completely automatically. For example, manufacturing companies often require weekly forecasts of demand for thousands of products at dozens of locations in order to plan distribution and maintain suitable inventory stocks. In these circumstances, it is not feasible for time series models to be developed for each series by an experienced analyst. Instead, an automatic forecasting algorithm is required.

In addition to providing automatic forecasts when required, these algorithms also provide high quality benchmarks that can be used when developing more specific and specialized forecasting models.

I will describe some algorithms for automatically forecasting univariate time series that have been developed over the last 20 years. The role of forecasting competitions in comparing the forecast accuracy of these algorithms will also be discussed.

Finally, I will describe methods for evaluating forecasting algorithms which use the available data as efficiently as possible.



### Pre-reading


Those attending are asked to do some pre-reading. Here are the papers I've requested to be read beforehand:




  1. [Makridakis & Hibon, (JRSSA 1979)](http://www.jstor.org/stable/2345077) was the first serious attempt at a large empirical evaluation of forecast methods.  It was followed by discussion which is documented in the paper. The discussion is heated and entertaining, and important in understanding the different perspectives on this topic at the time.


  2. [Makridakis & Hibon (IJF, 2000)](http://www.forecastingprinciples.com/paperpdf/Makridakia-The%20M3%20Competition.pdf) can be considered a successor to the 1979 paper and describes the largest published forecasting competition to date. While the algorithms used are not discussed in any detail, the resulting comparisons are provided.


  3. [Gomez and Marvall (2001)](http://dx.doi.org/10.1002/9781118032978.ch7) must be included, not just because it is by two well-known Spanish time series analysts. It provides the best introduction to automatic time series model selection and is a useful starting point on some of the theory.


  4. [Hyndman and Khandakar (JSS 2008)](http://www.jstatsoft.org/v27/i03/paper) describes two extremely widely used automatic forecasting algorithms. These have been improved in the last five years, but the basic algorithms are most clearly described there.


