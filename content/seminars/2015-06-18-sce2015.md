---
author: Rob&nbsp;J&nbsp;Hyndman
comments: false
date: 2015-06-18 23:00:41+00:00
slug: sce2015
title: Probabilistic forecasting of peak electricity demand
wordpress_id: 3184
slideshare: NoKQ3Elv5o5Wg0
tags:
- data science
- electricity
- forecasting
- nonparametric smoothing
- R
- seasonality
- time series
---

### **Southern California Edison**


Rosemead, California



Electricity demand forecasting plays an important role in short-term load allocation and long-term planning for future generation facilities and transmission augmentation. It is a challenging problem because of the different uncertainties including underlying population growth, changing technology, economic conditions, prevailing weather conditions (and the timing of those conditions), as well as the general randomness inherent in individual usage. It is also subject to some known calendar effects due to the time of day, day of week, time of year, and public holidays. But the most challenging part is that we often want to forecast the peak demand rather than the average demand. Consequently, it is necessary to adopt a probabilistic view of potential peak demand levels in order to evaluate and hedge the financial risk accrued by demand variability and forecasting uncertainty.

I will describe some Australian experiences in addressing these problems via the Monash Electricity Forecasting Model, a semiparametric additive model designed to take all the available information into account, and to provide forecast distributions from a few hours ahead to a few decades ahead. The approach is being used by energy market operators and supply companies to forecast the probability distribution of electricity demand in various regions of Australia.

I will briefly demonstrate an open-source R package to implement the model. The package allows for ensemble forecasting of demand based on simulations of future sample paths of temperatures and other predictor variables.

Finally, I will discuss some recent developments in evaluating peak demand forecasts, and some research competitions that have generated some innovative new methods to tackle energy forecasting problems.





