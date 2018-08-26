---
author: Yanfei Kang, Rob&nbsp;J&nbsp;Hyndman, Feng Li
date: 2018-08-23
slug: tsgeneration
title: Efficient generation of time series with diverse and controllable characteristics
kind: unpublished
tags:
- data science
- time series
file: TSgeneration.pdf
---

The explosion of time series data in recent years has brought a flourish of new time series analysis methods, for forecasting, clustering, classification and other tasks. The evaluation of these new methods requires a diverse collection of time series data to enable reliable comparisons against alternative approaches. We propose the use of mixture autoregressive (MAR) models to generate collections of time series with diverse features. We simulate sets of time series using MAR models and investigate the diversity and coverage of the simulated time series in a feature space. An efficient method is also proposed for generating new time series with controllable features by tuning the parameters of the MAR models. The simulated data based on our method can be used as evaluation tool for tasks such as time series classification and forecasting.

**Associated R package**: [tsgeneration](https://github.com/ykang/tsgeneration)

**Associated Rshiny app**: [tsgeneration](https://ebsmonash.shinyapps.io/tsgeneration/)