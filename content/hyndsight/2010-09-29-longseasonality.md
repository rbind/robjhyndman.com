---
author: robjhyndman
comments: true
date: 2010-09-29 05:38:51+00:00
mathjax: true
link: https://robjhyndman.com/hyndsight/longseasonality/
slug: longseasonality
title: Forecasting with long seasonal periods
wordpress_id: 978
categories:
- forecasting
- R
---

I am often asked how to fit an ARIMA or ETS model with data having a long seasonal period such as 365 for daily data or 48 for half-hourly data. Generally, seasonal versions of ARIMA and ETS models are designed for shorter periods such as 12 for monthly data or 4 for quarterly data.

The `ets()` function in the forecast package restricts seasonality to be a maximum period of 24 to allow hourly data but not data with a larger seasonal frequency. The problem is that there are $m-1$ parameters to be estimated for the initial seasonal states where $m$ is the seasonal period. So for large $m$, the estimation becomes almost impossible.

The `arima()` function will allow a seasonal period up to $m=350$ but in practice will usually run out of memory whenever the seasonal period is more than about 200. I haven't dug into the code to find out why this is the case --- theoretically it would be possible to have any length of seasonality as the number of parameters to be estimated does not depend on the seasonal order. However, seasonal differencing of very high order does not make a lot of sense --- for daily data it involves comparing what happened today with what happened exactly a year ago and there is no constraint that the seasonal pattern is smooth.

For such data I prefer a Fourier series approach where the seasonal pattern is modelled using Fourier terms with short-term time series dynamics allowed in the error. For example, consider the following model:

<div>
$$
  y_t = a + \sum_{k=1}^K \left[ \alpha_k\sin(2\pi kt/m) + \beta_k\cos(2\pi kt/m)\right] + N_t,
$$
</div>

where $N_t$ is an ARIMA process. The value of $K$ can be chosen by minimizing the AIC.

This is easily fitted using R. Here is an example with $m=200$, $K=4$ and $N_t$ an ARIMA(2,0,1) process:

    n <- 2000
    m <- 200
    y <- ts(rnorm(n) + (1:n)%%100/30, f=m)
    
    library(forecast)
    fit <- Arima(y, order=c(2,0,1), xreg=fourier(y, K=4))
    plot(forecast(fit, h=2*m, xreg=fourier(y, K=4, h=2*m)))
    
The advantages of this approach are:

 * it allows any length seasonality;
 * for data with more than one seasonal period, you can include Fourier terms of different frequencies;
 * the seasonal pattern is smooth for small values of $K$ (but more wiggly seasonality can be handled by increasing $K$);
 * the short-term dynamics are easily handled with a simple ARMA error.

The only real disadvantage (compared to a seasonal ARIMA model) that I can think of is that the seasonality is assumed to be fixed --- the pattern is not allowed to change over time. But in practice, seasonality is usually remarkably constant so this is not a big disadvantage except for very long time series.

The order of $N_t$ can also be chosen automatically:

    fit <- auto.arima(y, seasonal=FALSE, xreg=fourier(y, K=4))

Note that the ARIMA model for $N_t$ should be non-seasonal.

A state space approach to the problem is possible using TBATS models, as described in this [paper on complex seasonality](/publications/complex-seasonality/).  The `tbats()` function which implements TBATS models will automatically select the Fourier order as well as the other aspects of the model. One advantage of the TBATS model is the seasonality is allowed to change slowly over time.
