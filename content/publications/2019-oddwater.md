---
author: Priyanga Dilini Talagala, Rob&nbsp;J&nbsp;Hyndman, Catherine Leigh, Kerrie Mengersen and Kate Smith-Miles
date: 2019-09-17
slug: oddwater
title: "A feature-based procedure for detecting technical outliers in water-quality data from in situ sensors"
kind: article
citation: <em>Water Resources Research</em>, <b>55</b>(11), 8547-8568
tags:
- data science
- anomaly detection
- time series
link: https://www.monash.edu/business/ebs/research/publications/ebs/wp01-2019.pdf
doi: 10.1029/2019WR024906
---

Outliers due to technical errors in water‐quality data from in situ sensors can reduce data quality and have a direct impact on inference drawn from subsequent data analysis. However, outlier detection through manual monitoring is infeasible given the volume and velocity of data the sensors produce. Here we introduce an automated procedure, named oddwater, that provides early detection of outliers in water‐quality data from in situ sensors caused by technical issues. Our oddwater procedure is used to first identify the data features that differentiate outlying instances from typical behaviors. Then, statistical transformations are applied to make the outlying instances stand out in a transformed data space. Unsupervised outlier scoring techniques are applied to the transformed data space, and an approach based on extreme value theory is used to calculate a threshold for each potential outlier. Using two data sets obtained from in situ sensors in rivers flowing into the Great Barrier Reef lagoon, Australia, we show that oddwater successfully identifies outliers involving abrupt changes in turbidity, conductivity, and river level, including sudden spikes, sudden isolated drops, and level shifts, while maintaining very low false detection rates. We have implemented this oddwater procedure in the open source R package [`oddwater`](https://github.com/pridiltal/oddwater).
