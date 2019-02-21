---
date: 2019-01-25
title: "Feature-based forecasting algorithms for large collections of time series"
slug: acems-fforma
link: https://github.com/robjhyndman/fforma-talk/raw/master/fforma.pdf
youtube: IRCfeG2_SKs
---


## Talk given at [ACEMS workshop on "Statistical Methods for the Analysis of High-Dimensional and Massive Data Sets"](https://acems.org.au/events/statistical-methods-analysis-high-dimensional-and-massive-data-sets)

I will discuss two algorithms used in forecasting large collections of diverse time series. Each of these algorithms uses a meta-learning approach with vectors of features computed from  time series to guide the way the forecasts are computed.

In FFORMS (Feature-based FORecast Model Selection), we use a random forest classifier to identify the best forecasting method using only time series features. A key advantage of our proposed framework is that the time-consuming process of building a classifier is handled in advance of the forecasting task at hand, and only the selected forecasting model needs to be computed in real time.

In FFORMA (Feature-based FORecast Model Averaging), we use gradient boosting to obtain the weights for forecast combinations using as inputs only a vector of time series features. This is slower than FFORMS (because forecasts from all candidate models must be computed), but it provides substantially more accurate forecasts.

Both approaches perform very well compared to competitive methods in large forecasting competitions, with FFORMA achieving 2nd place in the recent M4 forecasting competition.


### R packages:

  * [tsfeatures](https://pkg.robjhyndman.com/tsfeatures)
  * [seer](https://github.com/thiyangt/seer)
  * [M4metalearning](https://github.com/robjhyndman/M4metalearning)


