---
date: 2018-06-21
title: Feature-based time series analysis
slug: nyc-fbtsa
link: https://github.com/robjhyndman/fbtsa/raw/master/fbtsa.pdf
---

## Presentation to the New York R Meetup

It is becoming increasingly common for organizations to collect very large amounts of data over time. Data visualization is essential for exploring and understanding structures and patterns, and to identify unusual observations. However, the sheer quantity of data available means that new time series visualisation methods are needed.

I will demonstrate an approach to this problem using a vector of features on each time series, measuring characteristics of the series. These feature vectors can then be mapped to a 2-dimensional space for visualization.

The feature-based approach to time series can also be used to identify the best forecasting model using a pre-trained classifier, and to identify anomalous time series within a collection of time series.

I will demonstrate how to do feature-based time series analysis using the [tsfeatures](https://github.com/robjhyndman/tsfeatures), [seer](https://github.com/thiyangt/seer), [stray](https://github.com/pridiltal/stray) and [oddstream](https://github.com/pridiltal/oddstream) packages for R.
