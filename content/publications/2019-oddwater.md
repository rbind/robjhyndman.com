---
author: Priyanga Dilini Talagala, Rob J Hyndman, Catherine Leigh, Kerrie Mengersen and Kate Smith-Miles
date: 2019-02-12
slug: oddwater
title: "A feature-based framework for detecting technical outliers in water-quality data from in situ sensors"
kind: unpublished
tags:
- data science
- anomaly detection
- time series
link: https://www.monash.edu/business/ebs/research/publications/ebs/wp01-2019.pdf
---

Outliers due to technical errors in water-quality data from *in situ* sensors can reduce data quality and have a direct impact on inference drawn from subsequent data analysis. However, outlier detection through manual monitoring is unfeasible given the volume and velocity of data the sensors produce. Here, we proposed an automated framework that provides early detection of outliers in water-quality data from *in situ* sensors caused by technical issues.The framework was used first to identify the data features that differentiate outlying instances from typical behaviours. Then statistical transformations were applied to make the outlying instances stand out in transformed data space. Unsupervised outlier scoring techniques were then applied to the transformed data space and an approach based on extreme value theory was used to calculate a threshold for each potential outlier. Using two data sets obtained from *in situ* sensors in rivers flowing into the Great Barrier Reef lagoon, Australia, we showed that the proposed framework successfully identified outliers involving abrupt changes in turbidity, conductivity and river level, including sudden spikes, sudden isolated drops and level shifts, while maintaining very low false detection rates. We implemented this framework in the open source R package [`oddwater`](https://github.com/pridiltal/oddwater).