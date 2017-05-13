---
author: robjhyndman
comments: true
date: 2015-01-05 09:33:04+00:00

link: https://robjhyndman.com/hyndsight/seminars-in-taiwan/
slug: seminars-in-taiwan
title: Seminars in Taiwan
wordpress_id: 3126
categories:
- data science
- forecasting
- graphics
- hts
- kaggle
- R
- seminars
- statistics
---

I'm currently visiting Taiwan and I'm giving two seminars while I'm here --- one at the National Tsing Hua University in Hsinchu, and the other at Academia Sinica in Taipei. Details are below for those who might be nearby.<!-- more -->



## Automatic Time Series Forecasting



College of Technology Management, [Institute of Service Science](http://www.iss.nthu.edu.tw/),
National Tsing Hua University, Hsinchu
時間及地點：2015.1.7 (Wed.) 5pm @ TSMC building, 6F, room 622. 台積館6F孫運璿紀念中心
Many applications require a large number of time series to be forecast completely automatically. For example, manufacturing companies often require weekly forecasts of demand for thousands of products at dozens of locations in order to plan distribution and maintain suitable inventory stocks. In these circumstances, it is not feasible for time series models to be developed for each series by an experienced analyst. Instead, an automatic forecasting algorithm is required. In addition to providing automatic forecasts when required, these algorithms also provide high quality benchmarks that can be used when developing more specific and specialized forecasting models.

I will describe some algorithms for automatically forecasting univariate time series that have been developed over the last 20 years. The role of forecasting competitions in comparing the forecast accuracy of these algorithms will also be discussed.





## Visualizing and Forecasting Hierarchical and Grouped Time Series



[Institute of Statistical Science, Academia Sinica](http://www.stat.sinica.edu.tw/statnewsite/seminar/show/1986/)
時　間 2015/01/12 11:00 星期一
地　點 中研院-統計所 2F 交誼廳
備　註 茶 會：上午10：40統計所二樓交誼廳

Time series can often be naturally disaggregated in a hierarchical or grouped structure. For example, a manufacturing company can disaggregate total demand for their products by country of sale, retail outlet, product type, package size, and so on. As a result, there can be millions of individual time series to forecast at the most disaggregated level, plus additional series to forecast at higher levels of aggregation.

The first problem with handling such large numbers of time series is how to produce useful graphics to uncover structures and relationships between series. I will demonstrate some data visualization tools that help in exploring big time series data.

The second problem is that the disaggregated forecasts need to add up to the forecasts of the aggregated data. This is known as reconciliation. I will show that the optimal reconciliation method involves fitting an ill-conditioned linear regression model where the design matrix has one column for each of the series at the most disaggregated level. For problems involving huge numbers of series, the model is impossible to estimate using standard regression algorithms. I will also discuss some fast algorithms for implementing this model that make it practicable for implementing in business contexts.

[[Download poster](http://www.stat.sinica.edu.tw/statnewsite/seminar/download/1986/)]


