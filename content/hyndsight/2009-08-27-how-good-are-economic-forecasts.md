---
author: robjhyndman
comments: true
date: 2009-08-27 11:47:18+00:00

link: https://robjhyndman.com/hyndsight/how-good-are-economic-forecasts/
slug: how-good-are-economic-forecasts
title: How good are economic forecasts?
wordpress_id: 453
categories:
- forecasting
---

[I wrote last week that "macroeconomic forecasts are little better than shooting blindfold"](https://robjhyndman.com/hyndsight/forecasting-the-recession/).  I don't know if it was connected or not, but on the same day a journalist (Richard Pullin) from Reuters phoned me to ask about assessing some economic forecasts. He wanted to compare the accuracy of several economic forecasts for Japan and he wasn't sure how to go about it. I helped him to calculate the MASE for the different forecasts and [the results have now been published](http://blogs.reuters.com/macroscope/2009/08/27/ranking-economic-forecasts/).

Some of these forecasts look pretty good, with MASE values for one-month-ahead forecasts as low as 0.25 for industrial output and 0.29 for CPI. However, industrial output is relatively easy to predict one-month ahead due to industrial input data such as export orders, electricity usage, steel production, etc. And, according to the published article, National CPI in Japan "tends to track Tokyo CPI, which is released a month in advance and forms the basis for forecast numbers." The other series considered are machinery orders (MASE=0.43) and household spending (MASE=0.78), which are slightly better results than I expected.

It would be interesting to see MASE figures for other countries, for other series and for longer forecast horizons.

For those unfamiliar with the MASE, it is the mean absolute scaled error, introduced in [Hyndman and Koehler (IJF, 2006)](/publications/another-look-at-measures-of-forecast-accuracy). It compares the mean absolute error (MAE) from a forecast method with the in-sample one-step MAE obtained from the naive method. So for one-step forecasts, the MASE should be less than 1 or the method is useless. The advantage of the MASE is that it can be used in all situations including with non-stationary data, and when the observed values can be zero or negative. There is no other accuracy measure that I know of which is scale-free and can handle both of those situations.
