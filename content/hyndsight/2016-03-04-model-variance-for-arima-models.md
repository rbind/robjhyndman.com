---
author: robjhyndman
comments: true
date: 2016-03-04 11:15:19+00:00

link: https://robjhyndman.com/hyndsight/model-variance-for-arima-models/
slug: model-variance-for-arima-models
title: Model variance for ARIMA models
wordpress_id: 3679
categories:
- forecasting
- R
- statistics
- time series
---

From today's email:



>I wanted to ask you about your R forecast package, in particular the Arima() function. We are using this function to fit an ARIMAX model and produce model estimates and standard errors, which in turn can be used to get p-values and later model forecasts. To double check our work, we are also fitting the same model in SAS using PROC ARIMA and comparing model coefficients and output.<!-- more -->

>However, we have discovered that, while the model coefficient estimates are very similar with negligible differences, the standard errors of those coefficients are noticeably different, off by as much as 8%. After some careful analysis, we discovered that the model variance is apparently computed differently in SAS versus R.
 
>SAS computes the model variance as (sum of squared residuals) / (# residuals - # model parameters).
 
>R computes the model variance as (sum of squared residuals) / (# residuals).
 
>Consequently, R’s model variance is always a bit smaller than SAS’s, which in turn leads to different coefficient standard errors and p-values, as well as confidence intervals for the model forecasts. Are we correct about this observation in R, and if so, why does it compute the variance differently? My understanding from time series textbooks is that model variance’s denominator is degrees of freedom, which would be how SAS handles it. Or is R’s method also an acceptable way of computing it? If so, do you know of a publication that backs this up?


#### My response:



The `Arima()` and `auto.arima()` functions from the forecast package call the `arima()` function from the stats package. The `arima()` function in R uses the MLE estimate of the residual variance which has denominator $T$, where $T$ is the number of residuals. The SAS variance is the least squares estimate of the residual variance. Both are consistent estimators, but the MLE estimator is biased. Both estimators are discussed in [Brockwell and Davis's textbook](http://amzn.com/0387953515/?tag=otexts-20).

It would probably be better to use the unbiased estimator, and it would certainly improve the coverage of the prediction intervals. I might make this change in future versions of the `Arima` and `auto.arima` functions from the forecast package. I have no control over the `arima` function from the stats package.

Just one other point. You mean "prediction intervals", not "confidence intervals". [There is a difference.](https://robjhyndman.com/hyndsight/intervals/)
