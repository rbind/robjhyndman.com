---
author: Priyanga Dilini Talagala, Rob J Hyndman, Kate Smith-Miles, Sevvandi Kandanaarachchi and Mario A Muñoz
date: 2018-03-12
slug: oddstream
title: "Anomaly detection in streaming nonstationary temporal data"
kind: unpublished
tags:
- data science
- anomaly detection
- time series
file: oddstream.pdf
---

This article proposes a framework that provides early detection of anomalous series within a large collection of non-stationary streaming time series data. We define an anomaly as an observation that is very unlikely given the recent distribution of a given system. The proposed framework first forecasts a boundary for the system's typical behavior using extreme value theory. Then a sliding window is used to test for anomalous series within a newly arrived collection of series. The model uses time series features as inputs, and a density-based comparison to detect any significant changes in the distribution of the features. Using various synthetic and real world datasets, we demonstrate the wide applicability and usefulness of our proposed framework. We show that the proposed algorithm can work well in the presence of noisy non-stationarity data within multiple classes of time series. This framework is implemented in the open source R package [*oddstream*](https://github.com/pridiltal/oddstream). R code and data are available in the supplementary materials.
