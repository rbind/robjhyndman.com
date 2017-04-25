---
author: Rob&nbsp;J&nbsp;Hyndman, Heather Booth
Status: Published
comments: false
date: 2008-07-16 05:33:02+00:00
slug: stochastic-population-forecasts
title: Stochastic population forecasts using functional data models for mortality,
  fertility and migration
wordpress_id: 503
kind: article
tags:
- demography
- functional data
- time series
citation: <em>International Journal of Forecasting</em> <b>24</b>(3), 323-342
doi: 10.1016/j.ijforecast.2008.02.009
---


Age-sex-specific population forecasts are derived through stochastic population renewal using forecasts of mortality, fertility and net migration. Functional data models with time series coefficients are used to model age-specific mortality and fertility rates. As detailed migration data are lacking, net migration by age and sex is estimated as the difference between historic annual population data and successive populations one year ahead derived from a projection using fertility and mortality data. This estimate, which includes error, is also modeled using a functional data model. The three models involve different strengths of the general Box-Cox transformation chosen to minimise out-of-sample forecast error. Uncertainty is estimated from the model, with an adjustment to ensure the one-step-forecast variances are equal to those obtained with historical data. The three models are then used in the Monte Carlo simulation of future fertility, mortality and net migration, which are combined using the cohort-component method to obtain age-specific forecasts of the population by sex. The distribution of forecasts provides probabilistic prediction intervals. The method is demonstrated by making 20-year forecasts using Australian data for the period 1921-2003.

**Keywords:** Fertility forecasting, functional data, mortality forecasting, net migration, nonparametric smoothing, population forecasting, principal components, simulation.

**[R code](http://github.com/robjhyndman/demography)**

