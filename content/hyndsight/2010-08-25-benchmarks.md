---
author: robjhyndman
comments: true
date: 2010-08-25 11:03:02+00:00
slug: benchmarks
title: Benchmarks for forecasting
wordpress_id: 911
categories:
- forecasting
- IJF
---

Every week I reject papers submitted to the _International Journal of Forecasting_ because they present new methods without ever attempting to demonstrate that the new methods are better than existing methods. It is a policy of the journal that every new method must be compared to standard benchmarks and existing methods before the paper will even be considered for publication.

For univariate time series methods, it is not difficult. As a minimum, comparisons should be made against a naive method and a standard method such as an ARIMA model.




  1. The naive method for non-seasonal data is based on a random walk --- all forecasts are equal to the last observation. For seasonal data, the best naive method is to use the last observation from the same season. That is, for monthly data, forecasts for February are all equal to the last February observation.


  2. Comparisons with ARIMA models used to be problematic because some authors did not have sufficient expertise to fit a good ARIMA model, and so comparisons were sometimes made, for example, against a non-seasonal AR model when the data were obviously seasonal. This should no longer be a problem as there are now good automatic ARIMA algorithms such as `auto.arima()` in the [forecast package for R](http://github.com/robjhyndman/forecast/).


For multivariate time series, the same univariate benchmarks can be used.

For methods involving covariates, a standard linear regression can often provide a basic benchmark. Authors sometimes argue that linear regression is not appropriate for their data (e.g., because of non-linear relationships or correlations), but that is not the point. I don't care if the linear regression is appropriate --- I just want them to be able to show that their method provides better predictions than a standard and simple benchmark. If it can't beat a simple standard regression, especially if it is inappropriate, there is not much point proceeding.

The best benchmarks are those that are already published. For example, new univariate time series methods can be compared with the M-competition or M3 competition data where there are already published evaluations on large numbers of observations.  In this case, authors do not even have to implement the benchmarks themselves. All they have to do is use the same test sets and compare their MAPE or sMAPE values with those published for other methods.

Just beating the benchmarks is not, of itself, justification for publication, but it helps. It is also necessary to be able to describe your new method in enough detail and clarity that others could implement it. It is usually also necessary to show that the method works on more than one data set. It is relatively easy to find a method that outperforms the benchmarks on a single data set; but that is no reason to think it will be useful on other data sets. The M-competitions are useful as they provide a large set of data for comparisons. If a method does well on 1001 or 3003 time series, then I know it is not a fluke.

Similarly, not being able to beat the benchmarks does not, of itself, mean the paper is dead. It may be that the new method is not far behind the benchmarks but has other advantages. Or the new method may be particularly good in some circumstances or for a small subset of problems.

The job of the author is to carefully and persuasively present the case for their proposed method. As an editor, I am looking for authors to convince me of the value of their ideas. Papers proposing new forecasting methods must include comparisons with standard benchmarks, and should involve large scale empirical evaluations.
