---
author: Sevvandi&nbsp;Kandanaarachchi, Rob&nbsp;J&nbsp;Hyndman
date: 2021-10-22
slug: lookout
title: "Leave-one-out kernel density estimates for outlier detection"
kind: article
citation: <em>J Computational & Graphical Statistics</em>, to appear
tags:
- data science
- anomaly detection
link: https://github.com/sevvandi/Paper-lookout/raw/master/lookout/lookout_wp.pdf
github: sevvandi/Paper-lookout
doi: 10.1080/10618600.2021.2000425
---

This paper introduces *lookout*, a new approach to detect outliers using leave-one-out kernel density estimates and extreme value theory. Outlier detection methods that use kernel density estimates generally employ a user defined parameter to determine the bandwidth. Lookout uses persistent homology to construct a bandwidth suitable for outlier detection without any user input. We demonstrate the effectiveness of lookout on an extensive data repository by comparing its performance with other outlier detection methods based on extreme value theory. Furthermore, we introduce *outlier persistence*, a useful concept that explores the birth and the cessation of outliers with changing bandwidth and significance levels. The R package [**lookout**](https://github.com/Sevvandi/lookout) implements this algorithm.
