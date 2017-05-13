---
author: robjhyndman
comments: true
date: 2011-08-26 05:23:19+00:00

link: https://robjhyndman.com/hyndsight/tscvexample/
slug: tscvexample
title: 'Time series cross-validation: an R example'
wordpress_id: 1379
categories:
- forecasting
- R
- time series
---

I was recently asked how to implement [time series cross-validation](https://robjhyndman.com/hyndsight/crossvalidation/) in R. Time series people would normally call this "forecast evaluation with a rolling origin" or something similar, but it is the natural and obvious analogue to leave-one-out cross-validation for cross-sectional data, so I prefer to call it "time series cross-validation".<!-- more -->

Here is some example code applying time series CV and comparing 1-step, 2-step, ..., 12-step forecasts using the Mean Absolute Error (MAE). Here I compare (1) a linear model containing trend and seasonal dummies applied to the log data; (2) an ARIMA model applied to the log data; and (3) an ETS model applied to the original data. The code is slow because I am estimating an ARIMA and ETS model for each iteration. (I'm also estimating a linear model, but that doesn't take long.)




    library(fpp) # To load the data set a10
    plot(a10, ylab="$ million", xlab="Year", main="Antidiabetic drug sales")
    plot(log(a10), ylab="", xlab="Year", main="Log Antidiabetic drug sales")

    k <- 60 # minimum data length for fitting a model
    n <- length(a10)
    mae1 <- mae2 <- mae3 <- matrix(NA,n-k,12)
    st <- tsp(a10)[1]+(k-2)/12

    for(i in 1:(n-k))
    {
      xshort <- window(a10, end=st + i/12)
      xnext <- window(a10, start=st + (i+1)/12, end=st + (i+12)/12)
      fit1 <- tslm(xshort ~ trend + season, lambda=0)
      fcast1 <- forecast(fit1, h=12)
      fit2 <- Arima(xshort, order=c(3,0,1), seasonal=list(order=c(0,1,1), period=12),
          include.drift=TRUE, lambda=0, method="ML")
      fcast2 <- forecast(fit2, h=12)
      fit3 <- ets(xshort,model="MMM",damped=TRUE)
      fcast3 <- forecast(fit3, h=12)
      mae1[i,1:length(xnext)] <- abs(fcast1[['mean']]-xnext)
      mae2[i,1:length(xnext)] <- abs(fcast2[['mean']]-xnext)
      mae3[i,1:length(xnext)] <- abs(fcast3[['mean']]-xnext)
    }

    plot(1:12, colMeans(mae1,na.rm=TRUE), type="l", col=2, xlab="horizon", ylab="MAE",
         ylim=c(0.65,1.05))
    lines(1:12, colMeans(mae2,na.rm=TRUE), type="l",col=3)
    lines(1:12, colMeans(mae3,na.rm=TRUE), type="l",col=4)
    legend("topleft",legend=c("LM","ARIMA","ETS"),col=2:4,lty=1)




This yields the following figure.
![](/files/mae1.png)

A useful variation on this procedure is to keep the training window of fixed length. In that case, replace the first line in the for loop with




    xshort <- window(a10, start=st+(i-k+1)/12, end=st+i/12)




Then the training set always consists of k observations.

Another variation is to compute one-step forecasts in the test set. Then the body of the for loop should be replaced with the following.




      xshort <- window(a10, end=st + i/12)
      xnext <- window(a10, start=st + (i+1)/12, end=st + (i+12)/12)
      xlong <- window(a10, end=st + (i+12)/12)
      fit1 <- tslm(xshort ~ trend + season, lambda=0)
      fcast1 <- forecast(fit1, h=12)$mean
      fit2 <- Arima(xshort, order=c(3,0,1), seasonal=list(order=c(0,1,1), period=12),
                    include.drift=TRUE, lambda=0, method="ML")
      fit2a <- Arima(xlong, model=fit2, lambda=0)
      fcast2 <- fitted(fit2a)[-(1:length(xshort))]
      fit3 <- ets(xshort,model="MMM",damped=TRUE)
      fit3a <- ets(xlong, model=fit3)
      fcast3 <- fitted(fit3a)[-(1:length(xshort))]
      mae1[i,1:length(xnext)] <- abs(fcast1-xnext)
      mae2[i,1:length(xnext)] <- abs(fcast2-xnext)
      mae3[i,1:length(xnext)] <- abs(fcast3-xnext)




Here the models are fitted to the training set (`xshort`), and then applied to the longer data set (`xlong`) without re-estimating the parameters. So the fitted values from the latter are one-step forecasts on the whole data set. Therefore, the last part of the fitted values vector are one-step forecasts on the test set.

Yet another variation which is useful for large data sets is to use a form of k-fold cross-validation where the training sets increment by several values at a time. For example, instead of incrementing by one observation in each iteration, we could shift the training set forward by 12 observations.




    k <- 60 # minimum data length for fitting a model
    n <- length(a10)
    mae1 <- mae2 <- mae3 <- matrix(NA,12,12)
    st <- tsp(a10)[1]+(k-1)/12
    for(i in 1:12)
    {
      xshort <- window(a10, end=st + (i-1))
      xnext <- window(a10, start=st + (i-1) + 1/12, end=st + i)
      fit1 <- tslm(xshort ~ trend + season, lambda=0)
      fcast1 <- forecast(fit1, h=12)
      fit2 <- Arima(xshort, order=c(3,0,1), seasonal=list(order=c(0,1,1), period=12),
          include.drift=TRUE, lambda=0, method="ML")
      fcast2 <- forecast(fit2, h=12)
      fit3 <- ets(xshort,model="MMM",damped=TRUE)
      fcast3 <- forecast(fit3, h=12)
      mae1[i,] <- abs(fcast1[['mean']]-xnext)
      mae2[i,] <- abs(fcast2[['mean']]-xnext)
      mae3[i,] <- abs(fcast3[['mean']]-xnext)
    }
    plot(1:12, colMeans(mae1), type="l", col=2, xlab="horizon", ylab="MAE",
         ylim=c(0.35,1.5))
    lines(1:12, colMeans(mae2), type="l",col=3)
    lines(1:12, colMeans(mae3), type="l",col=4)
    legend("topleft",legend=c("LM","ARIMA","ETS"),col=2:4,lty=1)




However, because this is based on fewer estimation steps, the results are much more volatile. It may be best to average over the forecast horizon as well:




    > mean(mae1)
    [1] 0.8053712
    > mean(mae2)
    [1] 0.7118831
    > mean(mae3)
    [1] 0.792813




The above code assumes you are using v3.02 or later of the [forecast package](http://github.com/robjhyndman/forecast/).
