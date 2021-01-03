---
title: "Nonlinear mixed effects models for time series forecasting of smart meter demand"
author: Cameron&nbsp;Roach, Rob&nbsp;J&nbsp;Hyndman, Souhaib&nbsp;Ben&nbsp;Taieb
date: 2021-01-01
slug: nlme-smart-meters
kind: article
citation: <em>Journal of Forecasting</em>, to appear
tags:
  - data science
  - time series
  - forecasting
  - energy
  - statistics
link: https://www.monash.edu/business/ebs/research/publications/ebs/wp41-2020.pdf
github: camroach87/1901-nlmets
doi: 10.1002/for.2750
---

Buildings are typically equipped with smart meters to measure electricity demand at regular intervals. Smart meter data for a single building have many uses, such as forecasting and assessing overall building performance. However, when data are available from multiple buildings, there are additional applications that are rarely explored. For instance, we can explore how different building characteristics influence energy demand. If each building is treated as a random effect and building characteristics are handled as fixed effects, a mixed effects model can be used to estimate how characteristics affect energy usage. In this paper we demonstrate that producing one day ahead demand predictions for 123 commercial office buildings using mixed models can improve forecasting accuracy. We experiment with random intercept, random intercept and slope, and nonlinear mixed models. The predictive performance of the mixed effects models are tested against naive, linear and nonlinear benchmark models fitted to each building separately. This research justifies using mixed models to improve forecasting accuracy and to quantify changes in energy consumption under different building configuration scenarios.