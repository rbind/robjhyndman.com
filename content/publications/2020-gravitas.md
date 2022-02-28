---
title: "Visualizing probability distributions across bivariate cyclic temporal granularities"
author: Sayani Gupta, Rob&nbsp;J&nbsp;Hyndman, Dianne&nbsp;Cook and Antony&nbsp;Unwin
date: 2022-03-01
slug: gravitas
kind: article
citation: <em>J Computational & Graphical Statistics</em>, <b>31</b>(1), 14-25
tags:
  - data science
  - time series
  - graphics
file: gravitas.pdf
github: Sayani07/paper-gravitas
doi: 10.1080/10618600.2021.1938588
---

Deconstructing a time index into time granularities can assist in exploration and automated analysis of large temporal data sets. This paper describes classes of time deconstructions using linear and cyclic time granularities. Linear granularities respect the linear progression of time such as hours, days, weeks and months. Cyclic granularities can be circular such as hour-of-the-day, quasi-circular such as day-of-the-month, and aperiodic such as public holidays. The hierarchical structure of granularities creates a nested ordering: hour-of-the-day and second-of-the-minute are single-order-up. Hour-of-the-week is multiple-order-up, because it passes over day-of-the-week. Methods are provided for creating all possible granularities for a time index. A recommendation algorithm provides an indication whether a pair of granularities can be meaningfully examined together (a “harmony”), or when they cannot (a “clash”). Time granularities can be used to create data visualizations to explore for periodicities, associations and anomalies. The granularities form categorical variables (ordered or unordered) which induce groupings of the observations. Assuming a numeric response variable, the resulting graphics are then displays of distributions compared across combinations of categorical variables.

The methods implemented in the open source R package [`gravitas`](https://sayani07.github.io/gravitas/) are consistent with a tidy workflow, with probability distributions examined using the range of graphics available in [`ggplot2`](https://ggplot2.tidyverse.org).

[**R package: `gravitas`**](https://sayani07.github.io/gravitas/)

