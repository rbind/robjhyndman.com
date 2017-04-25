---
author: Souhaib Ben Taieb, Raphael Huser, Rob&nbsp;J&nbsp;Hyndman and Marc G Genton
Status: Published
comments: false
date: 2015-06-04 11:27:01+00:00
slug: kdd2015
title: 'Probabilistic time series forecasting with boosted additive models: an application to smart meter data'
wordpress_id: 2990
kind:
 unpublished
tags:
- data science
- density estimation
- electricity
- forecasting
- gams
- time series
file: sig-alternate.pdf
---

A large body of the forecasting literature so far has been focused on forecasting the conditional mean of future observations. However, there is an increasing need for generating the entire conditional distribution of future observations in order to effectively quantify the uncertainty in time series data. We present two different methods for probabilistic time series forecasting that allow the inclusion of a possibly large set of exogenous variables. One method is based on forecasting both the conditional mean and variance of the future distribution using a traditional regression approach. The other directly computes multiple quantiles of the future distribution using quantile regression. We propose an implementation for the two methods based on boosted additive models, which enjoy many useful properties including accuracy, flexibility, interpretability and automatic variable selection. We conduct extensive experiments using electricity smart meter data, on both aggregated and disaggregated scales, to compare the two forecasting methods for the challenging problem of forecasting the distribution of future electricity consumption. The empirical results demonstrate that the mean and variance forecasting provides better forecasts for aggregated demand, while the flexibility of the quantile regression approach is more suitable for disaggregated demand. These results are particularly useful since more energy data will become available at the disaggregated level in the future.



