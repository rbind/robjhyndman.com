---
author: Shanika L Wickramasuriya, Berwin A Turlach, Rob&nbsp;J&nbsp;Hyndman
date: 2019-08-14
slug: nnmint
title: Optimal non-negative forecast reconciliation
kind: unpublished
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
---


The sum of forecasts of a disaggregated time series are often required to equal the forecast of the aggregate. The least squares solution for finding coherent forecasts uses a reconciliation approach known as MinT, proposed by [Wickramasuriya et al (2019)](http://robjhyndman.com/publications/mint). The MinT approach and its variants do not guarantee that the coherent forecasts are non-negative, even when all of the original forecasts are non-negative in nature. This has become a serious issue in applications that are inherently non-negative such as with sales data or tourism numbers. While overcoming this difficulty, we consider the analytical solution of MinT as a least squares minimization problem. The non-negativity constraints are then imposed on the minimization problem to ensure that the coherent forecasts are strictly non-negative.

Considering the dimension and sparsity of the matrices involved, and the alternative representation of MinT, this constrained quadratic programming problem is solved using three algorithms. They are the block principal pivoting algorithm, projected conjugate gradient algorithm, and scaled gradient projection algorithm. A Monte Carlo simulation is performed to evaluate the computational performances of these algorithms. The results demonstrate that the block principal pivoting algorithm clearly outperforms the rest, and projected conjugate gradient is the second best. The superior performance of the block principal pivoting algorithm can be partially attributed to the alternative representation of the weight matrix in the MinT approach.

An empirical investigation is carried out to assess the impact of imposing non-negativity constraints on forecast reconciliation. It is observed that slight gains in forecast accuracy have occurred at the most disaggregated level. At the aggregated level slight losses are also observed. Although the gains or losses are negligible, the procedure plays an important role in decision and policy implementation processes.


Associated R package: **[hts](http://pkg.earo.me/hts/)**

[Download tourism data](/data/TourismData_v3.csv)
