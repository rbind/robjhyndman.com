---
author: Catherine&nbsp;Leigh, Omar&nbsp;Alsibai, Rob&nbsp;J&nbsp;Hyndman, Sevvandi&nbsp;Kandanaarachchi, Olivia&nbsp;C&nbsp;King, James&nbsp;M&nbsp;McGree, Catherine&nbsp;Neelamraju, Jennifer&nbsp;Strauss, Priyanga&nbsp;Dilini&nbsp;Talagala, Ryan&nbsp;S&nbsp;Turner, Kerrie&nbsp;Mengersen, Erin&nbsp;E&nbsp;Peterson
date: 2019-02-06
slug: water-quality-2
title: A framework for automated anomaly detection in high frequency water-quality data from in situ sensors
kind: article
citation: <em>Science of the Total Environment</em>, <b>664</b>, 885-898
doi: 10.1016/j.scitotenv.2019.02.085
tags:
- data science
- time series
- anomaly detection
- environment
link: https://arxiv.org/abs/1810.13076
---

River water-quality monitoring is increasingly conducted using automated in situ sensors, enabling timelier identification of unexpected values. However, anomalies caused by technical issues confound these data, while the volume and velocity of data prevent manual detection. We present a framework for automated anomaly detection in high-frequency water-quality data from in situ sensors, using turbidity, conductivity and river level data. After identifying end-user needs and defining anomalies, we ranked their importance and selected suitable detection methods. High priority anomalies included sudden isolated spikes and level shifts, most of which were classified correctly by regression-based methods such as autoregressive integrated moving average models. However, using other water-quality variables as covariates reduced performance due to complex relationships among variables. Classification of drift and periods of anomalously low or high variability improved when we applied replaced anomalous measurements with forecasts, but this inflated false positive rates. Feature-based methods also performed well on high priority anomalies, but were also less proficient at detecting lower priority anomalies, resulting in high false negative rates. Unlike regression-based methods, all feature-based methods produced low false positive rates, but did not and require training or optimization. Rule-based methods successfully detected impossible values and missing observations. Thus, we recommend using a combination of methods to improve anomaly detection performance, whilst minimizing false detection rates. Furthermore, our framework emphasizes the importance of communication between end-users and analysts for optimal outcomes with respect to both detection performance and end-user needs. Our framework is applicable to other types of high frequency time-series data and anomaly detection applications.
