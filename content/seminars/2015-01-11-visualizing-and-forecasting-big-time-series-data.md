---
author: Rob&nbsp;J&nbsp;Hyndman
comments: false
date: 2015-01-12 15:33:19+00:00
excerpt: Talk given at the Institute of Statistical Science, Academia Sinica, Taipei, Taiwan.
slug: visualizing-and-forecasting-big-time-series-data
title: Visualizing and forecasting big time series data
wordpress_id: 2851
slideshare: JEWivreQ2tNSqD
tags:
- forecasting
- graphics
- hierarchical time series
- R
- time series
- tourism
---

[Institute of Statistical Science, Academia Sinica](http://www.stat.sinica.edu.tw/statnewsite/seminar/show/1986/)
時　間 2015/01/12 11:00 星期一
地　點 中研院-統計所 2F 交誼廳
備　註 茶 會：上午10：40統計所二樓交誼廳

Time series can often be naturally disaggregated in a hierarchical or grouped structure. For example, a manufacturing company can disaggregate total demand for their products by country of sale, retail outlet, product type, package size, and so on. As a result, there can be millions of individual time series to forecast at the most disaggregated level, plus additional series to forecast at higher levels of aggregation.

The first problem with handling such large numbers of time series is how to produce useful graphics to uncover structures and relationships between series. I will demonstrate some data visualization tools that help in exploring big time series data.

The second problem is that the disaggregated forecasts need to add up to the forecasts of the aggregated data. This is known as reconciliation. I will show that the optimal reconciliation method involves fitting an ill-conditioned linear regression model where the design matrix has one column for each of the series at the most disaggregated level. For problems involving huge numbers of series, the model is impossible to estimate using standard regression algorithms. I will also discuss some fast algorithms for implementing this model that make it practicable for implementing in business contexts.

[[Download poster](http://www.stat.sinica.edu.tw/statnewsite/seminar/download/1986/)]


