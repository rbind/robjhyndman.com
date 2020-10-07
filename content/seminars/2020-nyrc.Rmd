---
date: 2020-08-14
title: Ensemble forecasts using fable
slug: nyrc2020
aliases:
  - /nyrc2020/
  - /nycr2020/
link: https://github.com/robjhyndman/quantile_ensemble_talk/raw/master/ensembles_NYCR_2020.pdf
youtube: nMy98aqQj8c
---

## Talk given at the [2020 R conference](https://rstats.ai/nyr/), New York.

For over 50 years we have known that ensemble forecasts perform better than individual methods, yet they are not as widely used as they should be. Perhaps this is because users think it is more work, or that it is hard to get prediction intervals, or that it is difficult to determine the relative weights of the component methods. The fable package solves these problems and makes it easy to produce probabilistic forecasts using ensembles across many time series. I will demonstrate how this can be done in a few lines of code and describe how the approach has been used to advise Australian governments on future covid19 cases.

 * [Github repo](https://github.com/robjhyndman/quantile_ensemble_talk)
 * [Demo code](https://github.com/robjhyndman/quantile_ensemble_talk/blob/master/demo.R)
