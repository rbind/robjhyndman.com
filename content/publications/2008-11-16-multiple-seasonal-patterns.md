---
author: Phillip G Gould, Anne B Koehler, J Keith Ord, Ralph D Snyder, Rob&nbsp;J&nbsp;Hyndman, Farshid Vahid-Araghi
Status: Published
comments: false
date: 2008-11-16 05:26:38+00:00
slug: multiple-seasonal-patterns
title: Forecasting time series with multiple seasonal patterns
wordpress_id: 497
kind: article
tags:
- exponential smoothing
- forecasting
- state space models
- time series
citation: "<em>European Journal of Operational Research</em> <b>191</b>(1), 207–220"
doi: 10.1016/j.ejor.2007.08.024
---

A new approach is proposed for forecasting a time series with multiple seasonal patterns. A state space model is developed for the series using the innovation approach which enables us to develop explicit models for both additive and multiplicative seasonality. Parameter estimates may be obtained using methods from exponential smoothing. The proposed model is used to examine hourly and daily patterns in hourly data for both utility loads and traffic flows. Our formulation provides a model for several existing seasonal methods and also provides new options, which result in superior forecasting performance over a range of prediction horizons. In particular, seasonal components can be updated more frequently than once during a seasonal cycle. The approach is likely to be useful in a wide range of applications involving both high and low frequency data, and it handles missing values in a straightforward manner.

**Keywords:** forecasting; time series; exponential smoothing; seasonality; state space models

**Supplements:**

  * [Models spreadsheet](/files/multiseasonal/model.xls)
  * [Ox code](/files/multiseasonal/mseas.ox)
  * [Traffic data](/files/multiseasonal/traffic.xls)

The supplied Ox code and Microsoft Excel spreadsheet are intended to give users working examples of the model described in our paper. Both can easily be adapted for more general use, although they are not intended to form any kind of software "package" for Ox and Excel. The supplied data are a sample of data used in the paper and are not to be used for any other purpose than as an example in running the code

**Notes on Excel Spreadsheet:** The Excel spreadsheet does not contain the data used for seed estimation in the Ox code. The seeds used in the Excel model are imported from Ox. The procedure for seed estimation is cumbersome in Excel and is omitted.

For dated data, the day-of-week dummies can be generated via the "weekday()" and "if()" function in Excel. This can be useful when swapping between data with different dates.

The smoothing parameter estimates should be estimated using Solver in Excel. Solver can often converge to a local maximum, so users should try a range of seed values to ensure a global maximum is found.

**Ox Code:** Comments are included within the Ox file. Correct Ox packages must be installed (gnudraw).

