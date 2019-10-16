---
date: 2018-07-13
title: Tidy forecasting in R
slug: user-fable
link: https://github.com/robjhyndman/fable-talk-2018/raw/master/fable_useR2018.pdf
youtube: MemnYSGeJ34
---

## Presentation at the useR 2018 conference in Brisbane, Australia

The [forecast package](http://pkg.robjhyndman.com/forecast/) in R is widely used and provides good tools for monthly, quarterly and annual time series. But it is not so well-developed for daily and sub-daily data, and it does not interact easily with modern [tidy packages](https://www.tidyverse.org/) such as dplyr, purrr and tidyr.

I will describe our plans and progress in developing a collection of packages to provide tidy tools for time series and forecasting, which will interact seamlessly with tidyverse packages, and provide functions to handle time series at any frequency.

This talk is part of a series of three:

1. **[Earo Wang](https://earo.me/)**. *tsibble: The 15th time series standard* &nbsp;&nbsp; [[Slides](http://slides.earo.me/useR18/)] [[Video](https://youtu.be/v6yRmbulxUM)]
2. **[Rob J Hyndman](https://robjhyndman.com)**. *Tidy forecasting in R* &nbsp;&nbsp;  [[Slides](https://github.com/robjhyndman/fable-talk-2018/raw/master/fable_useR2018.pdf)] [[Video](https://youtu.be/MemnYSGeJ34)]
3. **[Mitchell O'Hara-Wild](https://www.mitchelloharawild.com/)**. *fasster: Forecasting multiple seasonality with state switching*  &nbsp;&nbsp; [[Slides](https://slides.mitchelloharawild.com/user2018)] [[Video](https://youtu.be/6YlboftSalY)]

To download the packages: [tidyverts.org](http://tidyverts.org)
