---
author: robjhyndman
comments: true
date: 2014-10-06 00:57:49+00:00

link: https://robjhyndman.com/hyndsight/tbats-with-regressors/
slug: tbats-with-regressors
title: TBATS with regressors
wordpress_id: 2965
categories:
- forecasting
- R
- statistics
---

I've received a few emails about including regression variables (i.e., covariates) in TBATS models. As TBATS models are related to ETS models, `tbats()` is unlikely to ever include covariates [as explained here](https://robjhyndman.com/hyndsight/ets-regressors/). It won't actually complain if you include an `xreg` argument, but it will ignore it.

When I want to include covariates in a time series model, I tend to use `auto.arima()` with covariates included via the `xreg` argument. If the time series has multiple seasonal periods, I use Fourier terms as additional covariates. See [my post on forecasting daily data](https://robjhyndman.com/hyndsight/dailydata/) for some discussion of this model. Note that `fourier()` and `fourierf()` now handle `msts` objects, so it is very simple to do this.

For example, if `holiday` contains some dummy variables associated with public holidays and `holidayf` contains the corresponding variables for the first 100 forecast periods, then the following code can be used:


    
    
    y <- msts(x, seasonal.periods=c(7,365.25))
    z <- fourier(y, K=c(2,5))
    zf <- fourierf(y, K=c(2,5), h=100)
    fit <- auto.arima(y, xreg=cbind(z,holiday), seasonal=FALSE)
    fc <- forecast(fit, xreg=cbind(zf,holidayf), h=100)
    



The main disadvantage of the ARIMA approach is that the seasonality is forced to be periodic, whereas a TBATS model allows for dynamic seasonality.
