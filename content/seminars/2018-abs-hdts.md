---
date: 2018-04-09
title: High dimensional time series analysis
slug: abs-hdts
link: https://github.com/robjhyndman/highdimts/raw/master/ABS-HighDimTimeSeries.pdf
---

## Presentation for the Australian Bureau of Statistics

I will provide an overview of some of my recent research on methods to deal with high-dimensional time series.

**1. Visualizing many time series**

   It is becoming increasingly common for organizations to collect very large amounts of data over time. Data visualization is essential for exploring and understanding structures and patterns, and to identify unusual observations. However, the sheer quantity of data available challenges current time series visualisation methods.

   I will demonstrate an approach to this problem using a vector of features on each time series, measuring characteristics of the series.  These feature vectors can then be mapped to a 2-dimensional space for visualization.

**2. Finding weird time series**

  A similar feature-based approach can be used to identify anomalous time series within a collection of time series. I will also discuss how this can be extended to finding anomalies in streaming data.

**3. Reconciling many forecasts**

  Time series can often be naturally disaggregated in a hierarchical or grouped structure. For example, a manufacturing company can disaggregate total demand for their products by country of sale, retail outlet, product type, package size, and so on. As a result, there can be millions of individual time series to forecast at the most disaggregated level, plus additional series to forecast at higher levels of aggregation.

  A common constraint is that the forecasts should be "coherent"; i.e., that the disaggregated forecasts need to add up to the forecasts of the aggregated data. I will discuss an optimal reconciliation method for computing coherent forecasts.

**4. Forecasting temporal hierarchies**

  Forecasts can also be temporally aggregated; for example, we might want daily forecasts, weekly forecasts, monthly forecasts and annual forecasts. These should also be coherent. I will show how the optimal reconciliation method can be adapted to obtain temporal aggregation forecasts.



