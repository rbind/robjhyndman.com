---
author: robjhyndman
comments: true
date: 2014-03-01 06:08:49+00:00

link: https://robjhyndman.com/hyndsight/long-time-series/
slug: long-time-series
title: Fitting models to long time series
wordpress_id: 2531
categories:
- forecasting
- statistics
- time series
---

I received this email today:

>I recall you made this very insightful remark somewhere that, fitting a standard arima model with too much data, ie. a very long time series, is a bad idea. 

>Can you elaborate why? 

>I can see the issue with noise, which compounds the ML estimation as the series gets too long. But is there anything else?



I'm not sure where I made a comment about this, but it is true that ARIMA models don't work well for very long time series. The same can be said about almost any other model too. The problem is that real data do not come from the models we use. When the number of observations is not large (say up to about 200) the models often work well as an approximation to whatever process generated the data. But eventually you will have enough data that the difference between the true process and the model starts to become more obvious. An additional problem is that the optimization of the parameters becomes more time consuming because of the number of observations involved. 

What to do about these issues depends on the purpose of the model. A more flexible nonparametric model could be used, but this still assumes that the model structure will work over the whole period of the data. A better approach is usually to allow the model itself to change over time. For example, by using time-varying parameters in a parametric model, or by using a time-based kernel in a nonparametric model. If you are only interested in forecasting the next few observations, it is equivalent and simpler to throw away the earliest observations and only fit a model to the most recent observations. 

How many observations to retain, or how fast to allow the time-varying parameters to vary, can be tricky decisions.
