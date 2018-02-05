---
author: Christoph Bergmeir, Rob&nbsp;J&nbsp;Hyndman, Bonsoo Koo
comments: false
date: 2018-01-01
slug: cv-time-series
title: A note on the validity of cross-validation for evaluating autoregressive time series prediction
kind:
 article
tags:
- accuracy
- forecasting
- neural networks
- time series
file: cv-wp.pdf
citation: <em>Computational Statistics and Data Analysis</em>, <b>120</b>, 70-83
mathjax: true
doi: 10.1016/j.csda.2017.11.003
---

One of the most widely used standard procedures for model evaluation in classification and regression is $K$-fold cross-validation (CV). However, when it comes to time series forecasting, because of the inherent serial correlation and potential non-stationarity of the data, its application is not straightforward and often omitted by practitioners in favour of an out-of-sample (OOS) evaluation.
In this paper, we show that in the case of a purely autoregressive model, the use of standard $K$-fold CV is possible as long as the models considered have uncorrelated errors. Such a setup occurs, for example, when the models nest a more appropriate model. This is very common when Machine Learning methods are used for prediction, where CV in particular is suitable to control for overfitting the data.
We present theoretical insights supporting our arguments. Furthermore, we present a simulation study and a real-world example where we show empirically that $K$-fold CV performs favourably compared to both OOS evaluation and other time-series-specific techniques such as non-dependent cross-validation.
