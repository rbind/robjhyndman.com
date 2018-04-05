---
author: Rob&nbsp;J&nbsp;Hyndman
comments: false
date: 2015-06-22 23:00:41+00:00
slug: isf2015
title: 'MEFM: An R package for long-term probabilistic forecasting of electricity
  demand'
wordpress_id: 3190

tags:
- data science
- electricity
- forecasting
- nonparametric smoothing
- R
- seasonality
- time series
slideshare: 4L6qtbv0iUmwXE
---

### **International Symposium on Forecasting**


Riverside, California




I will describe and demonstrate a new open-source R package that implements the Monash Electricity Forecasting Model, a semi-parametric probabilistic approach to forecasting long-term electricity demand. The underlying model proposed in Hyndman and Fan (2010) is now widely used in practice, particularly in Australia. The model has undergone many improvements and developments since it was first proposed, and these have been incorporated in this R implementation.

The package allows for ensemble forecasting of demand based on simulations of future sample paths of temperatures and other predictor variables. It requires the following data as inputs: half-hourly/hourly electricity demands; half-hourly/hourly temperatures at one or two locations; seasonal (e.g., quarterly) demographic and economic data; and public holiday data.

Peak electricity demand forecasting is important in medium and long-term planning of electricity supply. Extreme demand often leads to supply failure with consequential business and social disruption. Forecasting extreme demand events is therefore an important problem in energy management, and this package provides a useful tool for energy companies and regulators in future planning.








[R code](https://robjhyndman.com/Rfiles/MEFMdemo.R)
