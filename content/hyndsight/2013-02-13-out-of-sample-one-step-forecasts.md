---
author: robjhyndman
comments: true
date: 2013-02-13 23:30:40+00:00

link: https://robjhyndman.com/hyndsight/out-of-sample-one-step-forecasts/
slug: out-of-sample-one-step-forecasts
title: Out-of-sample one-step forecasts
wordpress_id: 2074
categories:
- computing
- forecasting
- R
- statistics
---

It is common to fit a model using training data, and then to evaluate its performance on a test data set. When the data are time series, it is useful to compute one-step forecasts on the test data. For some reason, this is much more commonly done by people trained in machine learning rather than statistics.

If you are using the [**forecast** package](http://github.com/robjhyndman/forecast/) in R, it is easily done with ETS and ARIMA models. For example:



    library(forecast)
    fit <- ets(trainingdata)
    fit2 <- ets(testdata, model=fit)
    onestep <- fitted(fit2)



Note that the second call to `ets` does not involve the model being re-estimated. Instead, the model obtained in the first call is applied to the test data in the second call. This works because fitted values are one-step forecasts in a time series model.

The same process works for ARIMA models when `ets` is replaced by `Arima` or `auto.arima`. Note that it does _not_ work with the `arima` function from the **stats** package. One of the reasons I wrote `Arima` (in the **forecast** package) is to allow this sort of thing to be done.
