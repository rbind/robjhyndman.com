---
date: 2018-12-05
title: High-dimensional time series analysis
slug: highdimts
link: https://github.com/robjhyndman/highdimts/raw/master/highdimts.pdf
---

## Presentation to the Australasian Actuarial Education and Research Symposium

It is becoming increasingly common for organizations to collect huge amounts of data over time. Traditional time series methods are not well suited to this new paradigm. I will review some new tools that have been developed to analyse large collections of time series including visualization, anomaly detection and forecasting.

Data visualization is essential for exploring and understanding structures and patterns, and to identify unusual observations. However, the sheer quantity of data available challenges current time series visualisation methods. I will demonstrate an approach to this problem using a vector of features on each time series, measuring characteristics of the series. These feature vectors can then be mapped to a 2-dimensional space for visualization.

A similar feature-based approach can be used to identify anomalous time series within a collection of time series, or to spot anomalous observations within a time series. I will also discuss how this can be extended to finding anomalies in streaming data.

Time series can often be naturally disaggregated in a hierarchical or grouped structure. For example, a death counts can be disaggregated by country, region, age and sex. As a result, there can be many individual time series to forecast at the most disaggregated level, plus additional series to forecast at higher levels of aggregation. A common constraint is that the forecasts should be “coherent”; i.e., that the disaggregated forecasts need to add up to the forecasts of the aggregated data. I will discuss an optimal reconciliation method for computing coherent forecasts.
