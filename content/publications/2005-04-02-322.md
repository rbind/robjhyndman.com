---
author: J&nbsp;Keith&nbsp;Ord, Ralph D Snyder, Anne B Koehler, Rob&nbsp;J&nbsp;Hyndman, Mark Leeds
comments: false
date: 2005-04-02 01:48:57+00:00
slug: '322'
title: 'Time series forecasting: the case for the single source of error state space approach'
kind: unpublished
tags:
- exponential smoothing
- forecasting
- state space models
- time series
file: SSOE.pdf
---


The state space approach to modelling univariate time series is now widely used both in theory and in applications. However, the very richness of the framework means that quite different model formulations are possible, even when they purport to describe the same phenomena. In this paper, we examine the single source of error [SSOE] scheme, which has perfectly correlated error components. We then proceed to compare SSOE to the more common version of the state space models, for which all the error terms are independent; we refer to this as the multiple source of error [MSOE] scheme. As expected, there are many similarities between the MSOE and SSOE schemes, but also some important differences. Both have ARIMA models as their reduced forms, although the mapping is more transparent for SSOE. Further, SSOE does not require a canonical form to complete its specification. An appealing feature of SSOE is that the estimates of the state variables converge in probability to their true values, thereby leading to a formal inferential structure for the ad-hoc exponential smoothing methods for forecasting. The parameter space for SSOE models may be specified to match that of the corresponding ARIMA scheme, or it may be restricted to meaningful sub-spaces, as for MSOE but with somewhat different outcomes. The SSOE formulation enables straightforward extensions to certain classes of non-linear models, including a linear trend with multiplicative seasonals version that underlies the Holt-Winters forecasting method. Conditionally heteroscedastic models may be developed in a similar manner. Finally we note that smoothing and decomposition, two crucial practical issues, may be performed within the SSOE framework.

**Keywords:** ARIMA, dynamic linear models, equivalence, exponential smoothing, forecasting, GARCH, Holt's method, Holt-Winters method, Kalman filter, prediction intervals.

