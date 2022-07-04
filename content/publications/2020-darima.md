---
title: "Distributed ARIMA Models for Ultra-long Time Series"
author: Xiaoqian Wang, Yanfei Kang, Rob&nbsp;J&nbsp;Hyndman, Feng Li
date: 2022-05-03
slug: darima
kind: article
citation: <i>International J Forecasting</i>, to appear
tags:
  - data science
  - time series
arxiv: 2007.09577
github: xqnwang/darima
doi: 10.1016/j.ijforecast.2022.05.001
---

Providing forecasts for ultra-long time series plays a vital role in various activities, such as investment decisions, industrial production arrangements, and farm management. This paper develops a novel distributed forecasting framework to tackle challenges associated with forecasting ultra-long time series by using the industry-standard MapReduce framework. The proposed model combination approach facilitates distributed time series forecasting by combining the local estimators of time series models delivered from worker nodes and minimizing a global loss function. In this way, instead of unrealistically assuming the data generating process (DGP) of an ultra-long time series stays invariant, we make assumptions only on the DGP of subseries spanning shorter time periods. We investigate the performance of the proposed approach with AutoRegressive Integrated Moving Average (ARIMA) models using the real data application as well as numerical simulations. Compared to directly fitting the whole data with ARIMA models, our approach results in improved forecasting accuracy and computational efficiency both in point forecasts and prediction intervals, especially for longer forecast horizons. Moreover, we explore some potential factors that may affect the forecasting performance of our approach.
