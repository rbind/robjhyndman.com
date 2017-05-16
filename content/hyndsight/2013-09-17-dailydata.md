---
author: robjhyndman
comments: true
date: 2013-09-17 00:26:53+00:00
mathjax: true
link: https://robjhyndman.com/hyndsight/dailydata/
slug: dailydata
title: Forecasting with daily data
wordpress_id: 2275
categories:
- forecasting
- R
- statistics
---

I've had several emails recently asking how to forecast daily data in R. Unless the time series is very long, the easiest approach is to simply set the frequency attribute to 7.

```
y <- ts(x, frequency=7)
```

Then any of the usual time series forecasting methods should produce reasonable forecasts. For example

```
library(forecast)
fit <- ets(y)
fc <- forecast(fit)
plot(fc)
```

When the time series is long enough to take in more than a year, then it may be necessary to allow for annual seasonality as well as weekly seasonality. In that case, a multiple seasonal model such as TBATS is required.

```
y <- msts(x, seasonal.periods=c(7,365.25))
fit <- tbats(y)
fc <- forecast(fit)
plot(fc)
```

This should capture the weekly pattern as well as the longer annual pattern. The period 365.25 is the average length of a year allowing for leap years. In some countries, alternative or additional year lengths may be necessary. For example, with the Turkish electricity data analysed in [De Livera et al (JASA 2011)](/publications/complex-seasonality/), we used three seasonal periods: 7, 354.35 and 365.25. The period 354.37 is the average length of the Islamic calendar.

Capturing seasonality associated with moving events such as Easter or the Chinese New Year is more difficult. Even with monthly data, this can be tricky as the festivals can fall in either March or April (for Easter) or in January or February (for the Chinese New Year). The usual seasonal models don't allow for this, and even the complex seasonality discussed in my JASA paper assumes that the seasonal patterns occur at the same time in each year. The best way to deal with moving holiday effects is to use dummy variables. However, neither ETS nor TBATS models allow for covariates.  A state space model of the same form as TBATS but with multiple sources of error and covariates could be used, but I don't have any R code to do that.

Instead, I would use a regression model with ARIMA errors, where the regression terms include any dummy holiday effects as well as the longer annual seasonality. Unless there are many decades of data, it is usually reasonable to assume that the annual seasonal shape is unchanged from year to year, and so Fourier terms can be used to model the annual seasonality. Suppose we use $K=5$ Fourier terms to model annual seasonality, and that the holiday dummy variables are in the vector `holiday` with 100 future values in `holidayf`. Then the following code will fit an appropriate model.

```
y <- ts(x, frequency=7)
z <- fourier(ts(x, frequency=365.25), K=5)
zf <- fourier(ts(x, frequency=365.25), K=5, h=100)
fit <- auto.arima(y, xreg=cbind(z,holiday), seasonal=FALSE)
fc <- forecast(fit, xreg=cbind(zf,holidayf), h=100)
```

The order $K$ can be chosen by minimizing the AIC of the fitted model.
