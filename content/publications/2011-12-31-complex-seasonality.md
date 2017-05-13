---
author: Alysha M De Livera, Rob&nbsp;J&nbsp;Hyndman, Ralph D Snyder
Status: Published
comments: false
date: 2011-12-31 02:38:49+00:00
slug: complex-seasonality
title: Forecasting time series with complex seasonal patterns using exponential smoothing
aliases:
  - /papers/complex-seasonality/
kind:
 article
tags:
- exponential smoothing
- forecasting
- seasonality
- state space models
- time series
file: ComplexSeasonality.pdf
doi: 10.1198/jasa.2011.tm09771
citation: "<em>Journal of the American Statistical Association</em> <b>106</b>(496), 1513-1527"
mathjax: true
---

A new innovations state space modeling framework, incorporating Box-Cox transformations, Fourier series with time varying coefficients and ARMA error correction, is introduced for forecasting complex seasonal time series that cannot be handled using existing forecasting models. Such complex time series include time series with multiple seasonal periods, high frequency seasonality, non-integer seasonality and dual-calendar effects. Our new modelling framework provides an alternative to existing exponential smoothing models, and is shown to have many advantages. The methods for initialization and estimation, including likelihood evaluation, are presented, and analytical expressions for point forecasts and interval predictions under the assumption of Gaussian errors are derived, leading to a simple, comprehensible approach to forecasting complex seasonal time series. Our trigonometric formulation is also presented as a means of decomposing complex seasonal time series, which cannot be decomposed using any of the existing decomposition methods. The approach is useful in a broad range of applications, and we illustrate its versatility in three empirical studies where it demonstrates excellent forecasting performance over a range of prediction horizons. In addition, we show that our trigonometric decomposition leads to the identification and extraction of seasonal components, which are otherwise not apparent in the time series plot itself.

**Keywords:** exponential smoothing, Fourier series, prediction intervals, seasonality, state space models, time series decomposition.


#### Data

  * [Call center data](/data/callcenter.txt)
  * [Gasoline data](/data/gasoline.csv)
  * [Turkish electricity data](/data/turkey_elec.csv)


To read the data into R:
    
```r    
    library(forecast)
    
    # (a) U.S. finished motor gasoline products supplied
    # (thousands of barrels per day),
    # weekly data from February 1991 to July 2005.
    gas <- read.csv("https://robjhyndman.com/data/gasoline.csv")[,1]
    gas <- ts(gas, start=1991+31/365.25, frequency = 365.25/7)
    
    # (b) Number of calls handled on weekdays between 7:00 am and 9:05 pm
    # Five-minute call volume from March 3, 2003, to May 23, 2003
    # in a large North American commercial bank.
    calls <- unlist(read.csv("https://robjhyndman.com/data/callcenter.txt",
                      header=TRUE,sep="\t")[,-1])
    calls <- msts(calls, start=1, seasonal.periods = c(169, 169*5))
    
    # (c) Turkish electricity demand data.
    # Daily data from 1 January 2000 to 31 December 2008.
    telec <- read.csv("https://robjhyndman.com/data/turkey_elec.csv")
    telec <- msts(telec, start=2000, seasonal.periods = c(7,354.37,365.25))
```


#### Errata

  * p.1517. $\boldsymbol{\theta}=(\theta_1,\theta_2,\dots,\theta_q)$.


