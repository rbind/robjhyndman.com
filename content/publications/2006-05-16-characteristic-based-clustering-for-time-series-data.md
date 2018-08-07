---
author: Xiaozhe Wang, Kate A Smith, Rob&nbsp;J&nbsp;Hyndman
Status: Published
comments: false
date: 2006-05-16 05:52:34+00:00
slug: ts-clustering
aliases:
  - /publications/characteristic-based-clustering-for-time-series-data
title: Characteristic-based clustering for time series data
kind: article
tags:
- neural networks
- time series
citation:  <em>Data Mining and Knowledge Discovery</em> <b>13</b>(3), 335-364
doi: 10.1007/s10618-005-0039-x
---


With the growing importance of time series clustering research, particularly for similarity searches amongst long time series such as those arising in medicine or finance, it is critical for us to find a way to resolve the outstanding problems that make most clustering methods impractical under certain circumstances. When the time series is very long, some clustering algorithms may fail because the very notation of similarity is dubious in high dimension space; many methods cannot handle missing data when the clustering is based on a distance metric. This paper proposes a method for clustering of time series based on their structural characteristics. Unlike other alternatives, this method does not cluster point values using a distance metric, rather it clusters based on global features extracted from the time series. The feature measures are obtained from each individual series and can be fed into arbitrary clustering algorithms, including an unsupervised neural network algorithm, self-organizing map, or hierarchal clustering algorithm. Global measures describing the time series are obtained by applying statistical operations that best capture the underlying characteristics: trend, seasonality, periodicity, serial correlation, skewness, kurtosis, chaos, nonlinearity, and self-similarity. Since the method clusters using extracted global measures, it reduces the dimensionality of the time series and is much less sensitive to missing or noisy data. We further provide a search mechanism to find the best selection from the feature set that should be used as the clustering inputs. The proposed technique has been tested using benchmark time series datasets previously reported for time series clustering and a set of time series datasets with known characteristics. The empirical results show that our approach is able to yield meaningful clusters. The resulting clusters are similar to those produced by other methods, but with some promising and interesting variations that can be intuitively explained with knowledge of the global characteristics of the time series.

**Keywords:** time series clustering, clustering, global characteristics, feature measures, dimensionality reduction.

