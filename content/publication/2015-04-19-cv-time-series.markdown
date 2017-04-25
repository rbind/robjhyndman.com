---
author: Christoph Bergmeir, Rob&nbsp;J&nbsp;Hyndman, Bonsoo Koo
comments: false
date: 2015-04-19 23:25:23+00:00
slug: cv-time-series
title: A note on the validity of cross-validation for evaluating time series prediction
wordpress_id: 2886
kind:
 unpublished
tags:
- accuracy
- forecasting
- neural networks
- time series
file: cv-wp.pdf
mathjax: true
---

One of the most widely used standard procedures for model evaluation in classification and regression is $K$-fold cross-validation (CV). However, when it comes to time series forecasting, because of the inherent serial correlation and potential non-stationarity of the data, its application is not straightforward and often omitted by practitioners in favor of an out-of-sample (OOS) evaluation. In this paper, we show that the particular setup in which time series forecasting is usually performed using Machine Learning methods renders the use of standard $K$-fold CV possible. We present theoretical insights supporting our arguments. Furthermore, we present a simulation study where we show empirically that $K$-fold CV performs favorably compared to both OOS evaluation and other time-series-specific techniques such as non-dependent cross-validation.

