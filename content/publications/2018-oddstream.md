---
author: Priyanga&nbsp;Dilini&nbsp;Talagala, Rob&nbsp;J&nbsp;Hyndman, Kate&nbsp;Smith&#8209;Miles, Sevvandi&nbsp;Kandanaarachchi and Mario&nbsp;A&nbsp;Muñoz
date: 2020-04-19
slug: oddstream
title: "Anomaly detection in streaming nonstationary temporal data"
kind: article
citation: <em>J Computational & Graphical Statistics</em>, <b>20</b>(1), 13-27
doi: 10.1080/10618600.2019.1617160
tags:
- data science
- anomaly detection
- time series
file: oddstream.pdf
---

This article proposes a framework that provides early detection of anomalous series within a large collection of non-stationary streaming time series data. We define an anomaly as an observation that is very unlikely given the recent distribution of a given system. The proposed framework first forecasts a boundary for the system's typical behavior using extreme value theory. Then a sliding window is used to test for anomalous series within a newly arrived collection of series. The model uses time series features as inputs, and a density-based comparison to detect any significant changes in the distribution of the features. Using various synthetic and real world datasets, we demonstrate the wide applicability and usefulness of our proposed framework. We show that the proposed algorithm can work well in the presence of noisy non-stationarity data within multiple classes of time series. This framework is implemented in the open source R package [*oddstream*](https://github.com/pridiltal/oddstream). R code and data are available in the supplementary materials.
