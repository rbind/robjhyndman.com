---
title: "Distributed ARIMA Models for Ultra-long Time Series"
author: Xiaoqian Wang, Yanfei Kang, Rob&nbsp;J&nbsp;Hyndman, Feng Li
date: 2020-07-21
slug: darima
kind: unpublished
tags:
  - data science
  - time series
link: https://arxiv.org/abs/2007.09577
github: xqnwang/darima
---

Providing forecasts for ultra-long time series plays a vital role in various activities, such as investment decisions, industrial production arrangements, and farm management. This paper develops a novel distributed forecasting framework to tackle challenges associated with forecasting ultra-long time series by utilizing the industry-standard MapReduce framework. The proposed model combination approach facilitates distributed time series forecasting by combining the local estimators of ARIMA (AutoRegressive Integrated Moving Average) models delivered from worker nodes and minimizing a global loss function. In this way, instead of unrealistically assuming the data generating process (DGP) of an ultra-long time series stays invariant, we make assumptions only on the DGP of subseries spanning shorter time periods. We investigate the performance of the proposed distributed ARIMA models on an electricity demand dataset. Compared to ARIMA models, our approach results in significantly improved forecasting accuracy and computational efficiency both in point forecasts and prediction intervals, especially for longer forecast horizons. Moreover, we explore some potential factors that may affect the forecasting performance of our approach.

