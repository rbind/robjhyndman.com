---
author: Fotios Petropoulos, Rob&nbsp;J&nbsp;Hyndman, Christoph Bergmeir
date: 2018-02-04
slug: bagging-uncertainty
title: "Exploring the sources of uncertainty: why does bagging for time series forecasting work?"
kind: article
tags:
- data science
- time series
- forecasting
citation: <em>European Journal of Operational Research</em>, <b>268</b>(2), 545-554
doi: 10.1016/j.ejor.2018.01.045
file: exploring-sources-uncertainty.pdf
---

In a recent study, [Bergmeir, Hyndman and Benítez (2016)](/publications/bagging-ets) successfully employed a bootstrap aggregation (bagging) technique for improving the performance of exponential smoothing. Each series is Box-Cox transformed, and decomposed by Seasonal and Trend decomposition using Loess (STL); then bootstrapping is applied on the remainder series before the trend and seasonality are added back, and the transformation reversed to create bootstrapped versions of the series. Subsequently, they apply automatic exponential smoothing on the original series and the bootstrapped versions of the series, with the final forecast being the equal-weight combination across all forecasts. In this study we attempt to address the question: why does bagging for time series forecasting work? We assume three sources of uncertainty (model uncertainty, data uncertainty, and parameter uncertainty) and we separately explore the benefits of bagging for time series forecasting for each one of them. Our analysis considers 4,004 time series (from the M- and M3-competitions) and two families of models. The results show that the benefits of bagging predominantly originate from the model uncertainty: the fact that different models might be selected as optimal for the bootstrapped series. As such, a suitable weighted combination of the most suitable models should be preferred to selecting a single model.
