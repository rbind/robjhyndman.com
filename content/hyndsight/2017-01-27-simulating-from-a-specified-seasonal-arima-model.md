---
author: robjhyndman
comments: true
date: 2017-01-27 05:13:22+00:00

link: https://robjhyndman.com/hyndsight/simulating-from-a-specified-seasonal-arima-model/
slug: simulating-from-a-specified-seasonal-arima-model
title: Simulating from a specified seasonal ARIMA model
wordpress_id: 3989
categories:
- fpp
- R
- time series
---

From my email today


>You use an illustration of a seasonal arima model:
 
>ARIMA(1,1,1)(1,1,1)4
 
>I would like to simulate data from this process then fit a model… but I am unable to find any information as to how this can be conducted… if I set phi1, Phi1, theta1, and Theta1 it would be reassuring that for large n the parameters returned by `Arima(foo,order=c(1,1,1),seasonal=c(1,1,1))` are in agreement…





#### My answer:



Unfortunately `arima.sim()` won't handle seasonal ARIMA models. I wrote `simulate.Arima()` to handle them, but it is designed to simulate from a fitted model rather than a specified model. However, you can use the following code to do it. It first "estimates" an ARIMA model with specified coefficients. Then simulates from it.

```r    
    library(forecast)
    model <- Arima(ts(rnorm(100),freq=4), order=c(1,1,1), seasonal=c(1,1,1),
                 fixed=c(phi=0.5, theta=-0.4, Phi=0.3, Theta=-0.2))
    foo <- simulate(model, nsim=1000)
    fit <- Arima(foo, order=c(1,1,1), seasonal=c(1,1,1))
```

