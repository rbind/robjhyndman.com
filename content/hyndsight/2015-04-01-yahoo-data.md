---
author: robjhyndman
comments: true
date: 2015-04-01 02:33:44+00:00

link: https://robjhyndman.com/hyndsight/yahoo-data/
slug: yahoo-data
title: A new open source data set for detecting time series outliers
wordpress_id: 3207
categories:
- computing
- data science
- R
- reproducible research
- time series
---

Yahoo Labs has just released [an interesting new data set](https://yahooresearch.tumblr.com/post/114590420346/a-benchmark-dataset-for-time-series-anomaly) useful for research on detecting anomalies (or outliers) in time series data. There are many contexts in which anomaly detection is important. For Yahoo, the main use case is in detecting unusual traffic on Yahoo servers.<!-- more -->

The data set comprises real traffic to Yahoo services, along with some synthetic data. There are 367 time series in the data set, each of which contains between 741 and 1680 observations recorded at regular intervals. Each series is accompanied by an indicator series with a 1 if the observation was an anomaly, and 0 otherwise. The anomalies in the real data were determined by human judgement, while those in the synthetic data were generated algorithmically. For the synthetic data, some information about the components used to construct the data is also provided.

Although the [Yahoo announcement](https://yahooresearch.tumblr.com/post/114590420346/a-benchmark-dataset-for-time-series-anomaly) claims that the data are publicly available, in fact they are only available to people with an edu address. Further, you have to apply to use them, and it takes about 24 hours before approval is granted. I have suggested that they remove these restrictions, and make the data available without restriction to anyone who wants to use them.

Research on anomaly detection in time series seems to be growing in popularity. Twitter has also released their own [Anomaly Detection R package](https://blog.twitter.com/2015/introducing-practical-and-robust-anomaly-detection-in-a-time-series). Their approach has some similarities with my own `tsoutliers` function in the `forecast` package. The `tso` function in the `tsoutliers` package is another approach to the same problem.

Hopefully having a large public data set available will lead to improvements in time series outlier detection methods, at least for detecting outliers in internet traffic data.
