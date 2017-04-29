---
author: Christoph Bergmeir, Rob&nbsp;J&nbsp;Hyndman, José M Benítez
Status: Published
comments: false
date: 2016-04-28 23:30:12+00:00
slug: bagging-ets
title: Bagging exponential smoothing methods using STL decomposition and Box-Cox transformation
wordpress_id: 2399
kind:
 article
tags:
- exponential smoothing
- forecasting
- seasonality
- time series
citation: <em>International Journal of Forecasting</em> <b>32</b>(2), 303-312
file: BaggedETSForIJF_rev1.pdf
doi: 10.1016/j.ijforecast.2015.07.002
---


Exponential smoothing is one of the most popular forecasting methods. We present a method for bootstrap aggregation (bagging) of exponential smoothing methods. The bagging uses a Box-Cox transformation followed by an STL decomposition to separate the time series into trend, seasonal part, and remainder. The remainder is then bootstrapped using a moving block bootstrap, and a new series is assembled using this bootstrapped remainder. On the bootstrapped series, an ensemble of exponential smoothing models is estimated. The resulting point forecasts are averaged using the mean. We evaluate this new method on the M3 data set, showing that it consistently outperforms the original exponential smoothing models. On the monthly data, we achieve better results than any of the original M3 participants. We also perform statistical testing to explore significance of the results. Using the MASE, our method is significantly better than all the M3 participants on the monthly data.

