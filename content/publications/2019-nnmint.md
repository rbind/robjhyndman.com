---
author: Shanika L Wickramasuriya, Berwin A Turlach, Rob&nbsp;J&nbsp;Hyndman
date: 2020-04-08
slug: nnmint
title: Optimal non-negative forecast reconciliation
kind: article
citation: "<em>Statistics & Computing</em>, <b>30</b>(5), 1167-1182"
doi: 10.1007/s11222-020-09930-0
tags:
- accuracy
- arima models
- exponential smoothing
- forecasting
- hierarchical time series
- optimization
- R
- time series
- tourism
link: https://github.com/robjhyndman/non-negative-mint/raw/master/nonnegativemint.pdf
github: robjhyndman/non-negative-mint
---

The sum of forecasts of disaggregated time series are often required to equal the forecast of the aggregate, giving a set of coherent forecasts. The least squares solution for finding coherent forecasts uses a reconciliation approach known as MinT, proposed by [Wickramasuriya et al (2019)](http://robjhyndman.com/publications/mint). The MinT approach and its variants do not guarantee that the coherent forecasts are non-negative, even when all of the original forecasts are non-negative in nature. This has become a serious issue in applications that are inherently non-negative such as with sales data or tourism numbers. While overcoming this difficulty, we reconsider the least squares minimization problem with non-negativity constraints to ensure that the coherent forecasts are strictly non-negative.

The constrained quadratic programming problem is solved using three algorithms. They are the block principal pivoting (BPV) algorithm, projected conjugate gradient (PCG) algorithm, and scaled gradient projection (SGP) algorithm. A Monte Carlo simulation is performed to evaluate the computational performances of these algorithms as the number of time series increases. The results demonstrate that the BPV algorithm clearly outperforms the rest, and PCG is the second best. The superior performance of the BPV algorithm can be partially attributed to the alternative representation of the weight matrix in the MinT approach.

An empirical investigation is carried out to assess the impact of imposing non-negativity constraints on forecast reconciliation over the unconstrained method. It is observed that slight gains in forecast accuracy have occurred at the most disaggregated level. At the aggregated level slight losses are also observed. Although the gains or losses are negligible, the procedure plays an important role in decision and policy implementation processes.

Associated R package: **[hts](http://pkg.earo.me/hts/)**

[Download tourism data](/data/TourismData_v3.csv)
