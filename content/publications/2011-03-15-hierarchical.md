---
author: Rob J. Hyndman, Roman A. Ahmed, George Athanasopoulos, Han L Shang
Status: Published
comments: false
date: 2011-03-15 23:52:31+00:00
slug: hierarchical
title: Optimal combination forecasts for hierarchical time series
kind: article
aliases:
  - /papers/hierarchical/
tags:
- forecasting
- hierarchical time series
citation: <em>Computational Statistics and Data Analysis</em> <b>55</b>(9), 2579-2589
file: Hierarchical6.pdf
doi: 10.1016/j.csda.2011.03.006
---

In many applications, there are multiple time series that are hierarchically organized and can be aggregated at several different levels in groups based on products, geography or some other features. We call these "hierarchical time series''. They are commonly forecast using either a "bottom-up'' or a "top-down'' method.

In this paper we propose a new approach to hierarchical forecasting which provides optimal forecasts that are better than forecasts produced by either a top-down or a bottom-up approach. Our method is based on independently forecasting all series at all levels of the hierarchy and then using a regression model to optimally combine and reconcile these forecasts. The resulting revised forecasts add up appropriately across the hierarchy, are unbiased and have minimum variance amongst all combination forecasts under some simple assumptions.

We show in a simulation study that our method performs well compared to the top-down approach and the bottom-up method. We demonstrate our proposed method by forecasting Australian tourism demand where the data are disaggregated by purpose of travel and geographical region.

**Keywords:** bottom-up forecasting, combining forecasts, GLS regression, hierarchical forecasting, Moore-Penrose inverse, reconciling forecasts, top-down forecasting.
