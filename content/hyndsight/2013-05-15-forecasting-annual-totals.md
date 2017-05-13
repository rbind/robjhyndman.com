---
author: robjhyndman
comments: true
date: 2013-05-15 06:39:10+00:00
mathjax: true
link: https://robjhyndman.com/hyndsight/forecasting-annual-totals/
slug: forecasting-annual-totals
title: Forecasting annual totals from monthly data
wordpress_id: 2186
categories:
- computing
- consulting
- forecasting
- R
- StackExchange
- statistics
---

This question was posed on [crossvalidated.com](http://stats.stackexchange.com/q/59065/159):


>I have a monthly time series (for 2009-2012 non-stationary, with seasonality). I can use ARIMA (or ETS) to obtain point and interval forecasts for each month of 2013, but I am interested in forecasting the total for the whole year, including prediction intervals. Is there an easy way in R to obtain interval forecasts for the total for 2013?


I've come across this problem before in my consulting work, although I don't think I've ever published my solution. So here it is.<!-- more -->

If `x` is your monthly time series, then you can construct annual totals as follows.

    
        
    library(forecast)
    y <- filter(x,rep(1,12), sides=1) # Total of last 12 months
    


To get the forecasts of the annual totals:

    
        
    fit <- auto.arima(y)
    forecast(fit,h=12)
    


The last forecast is for the total of the next year.

Note that `diff(y,lag=1)` is the same as `diff(x,lag=12)`. So, provided $D>1$, if an ARIMA(p,d,q)(P,D,Q)12 is appropriate for the `x` series, then an ARIMA(p,d+1,q)(P,D-1,Q)12 is appropriate for the `y` series. However, `auto.arima` may not choose the equivalent models because the filtering and differencing will lead to different numbers of observations. To take advantage of this result, and use all the available data as efficiently as possible, the following code is better, assuming $d=D=1$ is appropriate for `x`:

    
        
    fit <- auto.arima(x,d=1,D=1)
    fit$arma[c(6,7)] <- c(2,0)
    fit <- Arima(y,model=fit)
    forecast(fit,h=12)
    




