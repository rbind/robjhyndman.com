---
author: Rob&nbsp;J&nbsp;Hyndman, Anne B Koehler, J Keith Ord, Ralph D Snyder
Status: Published
comments: false
date: 2005-01-16 03:53:26+00:00
slug: prediction-intervals-for-exponential-smoothing-using-two-new-classes-of-state-space-models
title: Prediction intervals for exponential smoothing using two new classes of state space models
kind:  article
tags:
- exponential smoothing
- forecasting
- state space models
- time series
citation: <em>Journal of Forecasting</em> <b>24</b>(1), 17-37
doi: 10.1002/for.938
mathjax: true
---

  
Three general classes of state space models are presented, based upon the single source of error formulation. The first class is the standard linear state space model with homoscedastic errors, the second retains the linear structure but incorporates a dynamic form of heteroscedasticity, and the third allows for non-linear structure in the observation equation as well as heteroscedasticity. These three classes provide stochastic models for a wide variety of exponential smoothing methods. We then use these three classes to provide exact analytic (matrix) expressions for forecast error variances that can be used to construct prediction intervals one or multiple steps ahead. These formulas are then specialized to non-matrix formulas for fifteen state space models that underlie nine exponential smoothing methods, including all the widely used methods. In cases where an ARIMA model also underlies an exponential smoothing method, there is an equivalent state space model with the same variance expression. We also discuss relationships between these new ideas and previous suggestions for finding forecast error variances and prediction intervals for the exponential smoothing methods. Simpler approximations are developed for the more complex schemes and their validity examined. The paper concludes with a numerical example using a non-linear model.

**Keywords:** forecast distribution, forecast interval, forecast error variance, Holt-Winters method, structural models.

**Errata:**


p26
:    Replace first equation with the following: 

$$v\_h \approx s^2\_{n-m+1+(h-1)*}\left[\tilde{\mu}\_h^2(1+\alpha^2\sigma^2)^{h-1}(1+\sigma^2)(1+\gamma^2\sigma^2)^k - \ell\_n^2\right]$$

p26
:   Replace $s\_{n-1} = 0.90,~s\_{n-1} = 1.10$ with $s\_{n-2} = 0.90,~s\_{n-3} = 1.10.$


**[R code](http://pkg.robjhyndman.com/forecast)**

