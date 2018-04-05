---
author: Rob&nbsp;J&nbsp;Hyndman
comments: false
date: 2011-10-03 03:11:47+00:00
slug: electricity-forecasting
title: 'Forecasting electricity demand distributions using a semiparametric additive
  model '
slideshare: skfnnEAtqqL4jt
tags:
- electricity
- forecasting
- gams
- nonparametric smoothing
---

Talk given at


  * University of Melbourne, 11 October 2011.
  * University of Adelaide, 16 March 2012
  * Monash University, 16 May 2012
  * La Trobe University, 24 May 2012
  * EDF, Paris. 4 September 2012
  * University of New South Wales, 1 November 2012


## Abstract:


Electricity demand forecasting plays an important role in short-term load allocation and long-term planning for future generation facilities and transmission augmentation. Planners must adopt a probabilistic view of potential peak demand levels, therefore density forecasts (providing estimates of the full probability distributions of the possible future values of the demand) are more helpful than point forecasts, and are necessary for utilities to evaluate and hedge the financial risk accrued by demand variability and forecasting uncertainty.

Electricity demand in a given season is subject to a range of uncertainties, including underlying population growth, changing technology, economic conditions, prevailing weather conditions (and the timing of those conditions), as well as the general randomness inherent in individual usage. It is also subject to some known calendar effects due to the time of day, day of week, time of year, and public holidays.

I will describe a comprehensive forecasting solution designed to take all the available information into account, and to provide forecast distributions from a few hours ahead to a few decades ahead. We use semi-parametric additive models to estimate the relationships between demand and the covariates, including temperatures, calendar effects and some demographic and economic variables. Then we forecast the demand distributions using a mixture of temperature simulation, assumed future economic scenarios, and residual bootstrapping. The temperature simulation is implemented through a new seasonal bootstrapping method with variable blocks.

The model is being used by the state energy market operators and some electricity supply companies to forecast the probability distribution of electricity demand in various regions of Australia. It also underpinned the Victorian Vision 2030 energy strategy.

We evaluate the performance of the model by comparing the forecast distributions with the actual demand in some previous years. An important aspect of these evaluations is to find a way to measure the accuracy of density forecasts and extreme quantile forecasts.


## Key papers

  * [Hyndman, R.J. and Fan, S. (2010) ``Density forecasting for long-term peak electricity demand'', _IEEE Transactions on Power Systems_, **25**(2), 1142-1153.](/publications/peak-electricity-demand/)

  * [Fan, S. and Hyndman, R.J. (2012) ``Short-term load forecasting based on a semi-parametric additive model''. _IEEE Transactions on Power Systems_, **27**(1), 134-141.](/publications/stlf/)


