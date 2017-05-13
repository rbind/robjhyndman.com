---
author: robjhyndman
comments: true
date: 2014-03-12 11:22:45+00:00

link: https://robjhyndman.com/hyndsight/unit-root-tests/
slug: unit-root-tests
title: Unit root tests and ARIMA models
wordpress_id: 2586
categories:
- forecasting
- R
- statistics
---

An email I received today:


>I have a small problem. I have a time series called x :

>  - If I use the default values of auto.arima(x), the best model is an ARIMA(1,0,0)

>  - However, I tried the function ndiffs(x, test="adf") and ndiffs(x, test="kpss") as the KPSS test seems to be the default value, and the number of difference is 0 for the kpss test (consistent with the results of auto.arima() ) but 2 for the ADF test.
I then tried auto.arima(x, test="adf") and now I have another model ARIMA(1,2,1). I am unsure which order of integration I should use as tests give fairly different results.

>Is there a test that prevails ?


The KPSS test will often select fewer differences than the ADF test or a PP test. A KPSS test has a null hypothesis of stationarity, whereas the ADF and PP tests assume that the data have I(1) non-stationarity. Consequently, the KPSS test will only select one or more differences if there is enough evidence to overturn the stationarity assumption, while the other tests will select at least one difference unless there is enough evidence to overturn the non-stationarity assumption. A nice discussion to the tests and the models behind them is given on [Eric Zivot's website](http://faculty.washington.edu/ezivot/econ584/notes/unitroot.pdf).

I have compared the forecast accuracy of the ARIMA models obtained using all three tests applied to the [M3 data](http://cran.r-project.org/web/packages/Mcomp/), and found that the KPSS tests led to models with better forecasts. That is why the default value in `auto.arima()` is `test="kpss"`. In general, all the defaults are set to the values that give the best forecasts on average. It is better to leave them alone unless you know what you are doing and have a good reason to change them.

