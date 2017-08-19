---
author: Rob&nbsp;J&nbsp;Hyndman
comments: false
date: 2016-09-15
slug: augsburg2016
title: Forecasting large collections of related time series
tags:
- forecasting
- hierarchical time series
- R
- seasonality
- time series
speakerdeck: 8c13df9c61c74b9185288b97c538f1c6
---

Keynote talk given at the German Statistical Week, Augsburg.

**Abstract**

Time series can often be naturally disaggregated in a hierarchical or grouped structure. For example, a manufacturing company can disaggregate total demand for their products by country of sale, retail outlet, product type, package size, and so on. As a result, there can be millions of individual time series to forecast at the most disaggregated level, plus additional series to forecast at higher levels of aggregation.

A common constraint is that the disaggregated forecasts need to add up to the forecasts of the aggregated data. This is known as forecast reconciliation. I will show that the optimal reconciliation method involves fitting an ill-conditioned linear regression model where the design matrix has one column for each of the series at the most disaggregated level. For problems involving huge numbers of series, the model is impossible to estimate using standard regression algorithms. I will also discuss some fast algorithms for implementing this model that make it practicable for implementing in business contexts.

