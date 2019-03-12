---
author: Yanfei Kang, Rob&nbsp;J&nbsp;Hyndman, Feng Li
date: 2018-08-23
slug: tsgeneration
title: "GRATIS: GeneRAting TIme Series with diverse and controllable characteristics"
kind: unpublished
date: 2019-03-07
tags:
- data science
- time series
link: https://arxiv.org/pdf/1903.02787.pdf
---

The explosion of time series data in recent years has brought a flourish of new time series analysis methods, for forecasting, clustering, classification and other tasks. The evaluation of these new methods requires a diverse collection of time series benchmarking data to enable reliable comparisons against alternative approaches. We propose GeneRAting TIme Series with diverse and controllable characteristics, named GRATIS, with the use of mixture autoregressive (MAR) models. We generate sets of time series using MAR models and investigate the diversity and coverage of the generated time series in a time series feature space. By tuning the parameters of the MAR models, GRATIS is also able to efficiently generate new time series with controllable features. In general, as a costless surrogate to the traditional data collection approach, GRATIS can be used as an evaluation tool for tasks such as time series forecasting and classification. We illustrate the usefulness of our time series generation process through a time series forecasting application

**Associated R package**: [tsgeneration](https://github.com/ykang/tsgeneration)

**Associated Rshiny app**: [tsgeneration](https://ebsmonash.shinyapps.io/tsgeneration/)