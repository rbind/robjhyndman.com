---
author: Rob&nbsp;J&nbsp;Hyndman
comments: false
date: 2017-08-25
slug: unsw2017
title: Optimal forecast reconcilation
tags:
- forecasting
- hierarchical time series
- R
- time series
speakerdeck: 2ab38a6bb85b4c12878b6c81587e05f6
---

Talk given at UNSW

**Abstract**

Time series can often be naturally disaggregated in a hierarchical or grouped structure. For example, a manufacturing company can disaggregate total demand for their products by country of sale, retail outlet, product type, package size, and so on. As a result, there can be millions of individual time series to forecast at the most disaggregated level, plus additional series to forecast at higher levels of aggregation.

A common constraint is that the disaggregated forecasts need to add up to the forecasts of the aggregated data. This is known as forecast reconciliation. I will show that the optimal reconciliation method involves fitting an ill-conditioned linear regression model where the design matrix has one column for each of the series at the most disaggregated level. For problems involving huge numbers of series, the model is impossible to estimate using standard regression algorithms.

I will also discuss some preliminary results on reconciling density forecasts in this context.
