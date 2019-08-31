---
date: 2019-06-19
title: A feast of time series tools
slug: isf-feasts
link: https://github.com/robjhyndman/feasts-talk/raw/master/feasts.pdf
youtube: Ykiuj16P450
---

## Presentation at the International Symposium on Forecasting, Thessaloniki, Greece, and at useR!2019, Toulouse, France.

Modern time series are often high-dimensional and observed at high frequency, but most existing R packages for time series are designed to handle low-dimensional and low frequency data such as annual, monthly and quarterly data. The [feasts](http://feasts.tidyverts.org) package is part of new collection of [tidyverts packages](http://tidyverts.org) designed for modern time series analysis using the [tidyverse](http://tidyverse.org) framework and structures. It uses the [tsibble](http://tsibble.tidyverts.org) package to provide the basic data class and data manipulation tools.

The [feasts](http://feasts.tidyverts.org) package provides **F**eature **E**xtraction **A**nd **S**tatistics for **T**ime **S**eries, and includes tools for exploratory data analysis, data visualization, and data summary. For example, it includes autocorrelation plots, seasonality plots, time series decomposition, tests for units roots and autocorrelations, etc.

I will demonstrate the design and use of the [feasts](http://feasts.tidyverts.org) package using a variety of real data, highlighting its power for handling large collections of related time series in an efficient and user-friendly manner.


