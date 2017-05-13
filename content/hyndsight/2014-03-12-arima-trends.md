---
author: robjhyndman
comments: true
date: 2014-03-12 22:24:29+00:00
mathjax: true
link: https://robjhyndman.com/hyndsight/arima-trends/
slug: arima-trends
title: Testing for trend in ARIMA models
wordpress_id: 2590
categories:
- forecasting
- R
- statistics
---

Today's email brought this one:



>I was wondering if I could get your opinion on a particular problem that I have run into during the reviewing process of an article.

>Basically, I have an analysis where I am looking at a couple of time-series and I wanted to know if, over time there was an upward trend in the series. Inspection of the raw data suggests there is, but we want some statistical evidence for this.

>To achieve this I ran some ARIMA (0,1,1) models including a drift/trend term to see if the mean of the series did indeed shift upwards with time and found that it did. However, we have run into an issue with a reviewer who argues that differencing removes trends and may not be a suitable way to detect trends. Therefore, the fact that we found a trend despite differencing suggest that differencing was not successful. I know there are a few papers and textbooks that use ARIMA (0,1,1) models as 'random walks with drift'-type models so I cited them as examples of this procedure in action, but they remained unconvinced.

>Instead it was suggested that I look for trends in the raw undifferenced time-series as these would be more reliable as no trends had been removed. AT the moment I am hesitant to do this as I was sort of taught that even pure random walks could give you significant trends. Moreover, given that the raw time-series is not stationary I was worried that an ARIMA (0,0,1) model as it would be might not actually be appropriate.

There's nothing like running into ignorant reviewers who want you to do things that make no sense. <!-- more -->

Yes, differencing removes trends, but an ARIMA(0,1,1) model can have a trend if it contains a constant. The ignorance probably stems from the way ARIMA models are often taught, where the trends get differenced out and often forgotten. Some textbooks do not even include the trends in the equations.

The underlying model for a non-seasonal ARIMA($p,d,q$) process is
$$
\phi(B)(1-B)^d(y_t - \mu t^d/d!) = \theta(B) e_t.
$$
So if $d=1$, there is a trend with slope $\mu$ (often called "drift" in this context). In this case, the value of $\mu$ is also an estimate of the mean of the differenced data. (It is not the same as the sample mean of the differenced data unless $p=q=0$, as the estimate is modified by the remaining autocorrelation in the differenced data.)

If the presence of trend is of interest, you should check the standard error of $\mu$ to ensure the slope is significantly different from zero. This amounts to a t-test adjusting for the autocorrelation. The model can be estimated with the `Arima()` function from the **forecast** package in R, using the argument `include.drift=TRUE`. The output will include the drift coefficient and standard error.

To keep the reviewer happy, you could say that you have applied a linear regression model with serially correlated errors to the raw data, and done a test for the slope of the fitted line after taking account of the serial correlation. This is the same thing, of course, but expressed in a way that might get through the ignorant censors more easily.
