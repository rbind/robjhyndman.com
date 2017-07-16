---
author: Rob&nbsp;J&nbsp;Hyndman, Maxwell L King, Ivet Pitrun, Baki Billah
Status: Published
comments: false
date: 2005-01-16 03:52:09+00:00
slug: splinefcast
title: Local linear forecasts using cubic smoothing splines
kind: article
tags:
- exponential smoothing
- forecasting
- nonparametric smoothing
- time series
citation: <em>Australian and New Zealand Journal of Statistics</em> <b>47</b>(1), 87-99
doi: 10.1002/for.938
---

We show how cubic smoothing splines fitted to univariate time series data can be used to obtain local linear forecasts. Our approach is based on a stochastic state space model which allows the use of a likelihood approach for estimating the smoothing parameter, and which enables easy construction of prediction intervals. We show that our model is a special case of an ARIMA(0,2,2) model and we provide a simple upper bound for the smoothing parameter to ensure an invertible model. We also show that the spline model is not a special case of Holt's local linear trend method. Finally we compare the spline forecasts with Holt's forecasts and those obtained from the full ARIMA(0,2,2) model, showing that the restricted parameter space does not impare forecast performance.

**Keywords:** ARIMA models, exponential smoothing, Holt's local linear forecasts, maximum likelihood estimation, nonparametric regression, smoothing splines, state space model, stochastic trends.

**[R code](http://pkg.robjhyndman.com/forecast/)**

