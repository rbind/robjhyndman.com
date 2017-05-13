---
author: robjhyndman
comments: true
date: 2014-07-15 23:49:00+00:00

link: https://robjhyndman.com/hyndsight/rolling-forecasts/
slug: rolling-forecasts
title: Variations on rolling forecasts
wordpress_id: 2791
categories:
- computing
- forecasting
- R
- statistics
---

Rolling forecasts are commonly used to compare time series models. Here are a few of the ways they can be computed using R. I will use ARIMA models as a vehicle of illustration, but the code can easily be adapted to other univariate time series models.<!-- more -->



### One-step forecasts without re-estimation



The simplest approach is to estimate the model on a single set of training data, and then compute one-step forecasts on the remaining test data. This can be handled by applying the fitted model to the whole data set, and then extracting the ``fitted values'' which are simply one-step forecasts.


    
    
    library(fpp)
    train <- window(hsales,end=1989.99)
    fit <- auto.arima(train)
    refit <- Arima(hsales, model=fit)
    fc <- window(fitted(refit), start=1990)
    







### Multi-step forecasts without re-estimation



For multi-step forecasts, a loop is required. The following example computes 5-step forecasts:


    
    
    h <- 5
    train <- window(hsales,end=1989.99)
    test <- window(hsales,start=1990)
    n <- length(test) - h + 1
    fit <- auto.arima(train)
    fc <- ts(numeric(n), start=1990+(h-1)/12, freq=12)
    for(i in 1:n)
    {  
      x <- window(hsales, end=1989.99 + (i-1)/12)
      refit <- Arima(x, model=fit)
      fc[i] <- forecast(refit, h=h)$mean[h]
    }
    







### Multi-step forecasts with re-estimation



An alternative approach is to extend the training data and re-estimate the model at each iteration, before each forecast is computed. This is what I call ["time series cross-validation"](https://robjhyndman.com/hyndsight/crossvalidation/) because it is analogous to leave-one-out cross-validation for cross-sectional data. This time, I will store the forecasts from 1- to 5-steps ahead at each iteration.


    
    
    # Multi-step, re-estimation
    h <- 5
    train <- window(hsales,end=1989.99)
    test <- window(hsales,start=1990)
    n <- length(test) - h + 1
    fit <- auto.arima(train)
    order <- arimaorder(fit)
    fcmat <- matrix(0, nrow=n, ncol=h)
    for(i in 1:n)
    {  
      x <- window(hsales, end=1989.99 + (i-1)/12)
      refit <- Arima(x, order=order[1:3], seasonal=order[4:6])
      fcmat[i,] <- forecast(refit, h=h)$mean
    }
    



A variation on this also re-selects the model at each iteration. Then the second line in the loop is replaced with


    
    
    refit <- auto.arima(x)
    
