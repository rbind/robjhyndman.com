---
date: 2018-06-19
title: Tidy forecasting in R
slug: isf-fable
link: https://github.com/robjhyndman/fable-talk-2018/raw/master/fable.pdf
---

## Presentation at the International Symposium on Forecasting, Boulder USA.

The [forecast package](http://pkg.robjhyndman.com/forecast/) in R is widely used and provides good tools for monthly, quarterly and annual time series. But it is not so well-developed for daily and sub-daily data, and it does not interact easily with modern [tidy packages](https://www.tidyverse.org/) such as dplyr, purrr and tidyr.

I will describe our plans and progress in developing a collection of packages to provide tidy tools for time series and forecasting, which will interact seamlessly with tidyverse packages, and provide functions to handle time series at any frequency.

