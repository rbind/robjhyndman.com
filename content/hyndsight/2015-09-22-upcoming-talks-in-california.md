---
author: robjhyndman
comments: true
date: 2015-09-22 06:41:42+00:00

link: https://robjhyndman.com/hyndsight/upcoming-talks-in-california/
slug: upcoming-talks-in-california
title: Upcoming talks in California
wordpress_id: 3386
categories:
- computing
- data science
- forecasting
- hts
- R
- seminars
- statistics
- time series
---

I'm back in California for the next couple of weeks, and will give the following talk at Stanford and UC-Davis.



### **Optimal forecast reconciliation for big time series data**



Time series can often be naturally disaggregated in a hierarchical or grouped structure. For example, a manufacturing company can disaggregate total demand for their products by country of sale, retail outlet, product type, package size, and so on. As a result, there can be millions of individual time series to forecast at the most disaggregated level, plus additional series to forecast at higher levels of aggregation.

A common constraint is that the disaggregated forecasts need to add up to the forecasts of the aggregated data. This is known as forecast reconciliation. I will show that the optimal reconciliation method involves fitting an ill-conditioned linear regression model where the design matrix has one column for each of the series at the most disaggregated level. For problems involving huge numbers of series, the model is impossible to estimate using standard regression algorithms. I will also discuss some fast algorithms for implementing this model that make it practicable for implementing in business contexts.

[Stanford: 4.30pm, Tuesday 6th October.](https://statistics.stanford.edu/sites/default/files/Oct06-2015.pdf)
[UCDavis: 4:10pm, Thursday 8th October.](http://www.stat.ucdavis.edu/seminars/library/2015-16/fall15/100815-hyndman.html)
