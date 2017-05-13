---
author: robjhyndman
comments: true
date: 2012-08-19 23:58:23+00:00

link: https://robjhyndman.com/hyndsight/flat-forecasts/
slug: flat-forecasts
title: Flat forecasts
wordpress_id: 1936
categories:
- forecasting
- R
- statistics
---

About once a week someone will tell me there is a bug in my [forecast package](http://github.com/robjhyndman/forecast/) for R because it gives forecasts that are the same for all future horizons. To save answering the same question repeatedly, here is my response.

A point forecast is (usually) the mean of the distribution of a future observation in the time series, conditional on the past observations of the time series. It is possible, even likely in some circumstances, that the future observations will have the same mean and then the forecast function is flat.




  * A random walk model will return a flat forecast function (equal to the last observed value of the series).


  * An ETS(A,N,N) model will return a flat forecast function.


  * An iid model will return a flat forecast function (equal to the mean of the observed data).


This is not a bug. It is telling you something about the time series -- namely that there is no trend, no seasonality, and insufficient temporal dynamics to allow the future observations to have different conditional means.

I discussed this once with another consultant and he told me that he sometimes adds some random noise to his forecasts, just to stop his clients questioning the flat forecast functions. Unfortunately, that increases the forecast error, but he thought it was better to give them what they wanted rather than what was best!
