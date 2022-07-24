---
author: Anastasios&nbsp;Panagiotelis, Puwasala&nbsp;Gamakumara, George&nbsp;Athanasopoulos and&nbsp;Rob&nbsp;J&nbsp;Hyndman
date: 2022-07-24
slug: coherentprob
title: "Probabilistic forecast reconciliation: properties, evaluation and score optimisation"
kind: article
citation: "<em>European J Operational Research</em>, to appear"
tags:
- scoring rules
- probabilistic forecasting
- hierarchical time series
- stochastic gradient descent
link: https://github.com/PuwasalaG/Probabilistic-Forecast-Reconciliation/raw/master/Paper_EJOR_R1_submitted_latex/ProbabilisticReconciliationR1.pdf
github: PuwasalaG/Probabilistic-Forecast-Reconciliation
---

![](/img/featured.jpg)


We develop a framework for forecasting multivariate data that follow known linear constraints. This is particularly common in forecasting where some variables are aggregates of others, commonly referred to as hierarchical time series, but also arises in other prediction settings. For point forecasting, an increasingly popular technique is reconciliation, whereby forecasts are made for all series (so-called base forecasts) and subsequently adjusted to cohere with the constraints. We extend reconciliation from point forecasting to probabilistic forecasting. A novel definition of reconciliation is developed and used to construct densities and draw samples from a reconciled probabilistic forecast. In the elliptical case, we prove that true predictive distributions can be recovered using reconciliation even when the location and scale of base predictions are chosen arbitrarily. Reconciliation weights are estimated to optimise energy or variogram score. The log score is not considered since it is improper when comparing unreconciled to reconciled forecasts, a result also proved in this paper. Due to randomness in the objective function, optimisation uses stochastic gradient descent. This method improves upon base forecasts in simulated and empirical data, particularly when the base forecasting models are severely misspecified. For milder misspecification, extending popular reconciliation methods for point forecasting results in similar performance to score optimisation.

The methods described here are implemented in the [`ProbReco`](https://github.com/anastasiospanagiotelis/ProbReco) package for R.

[**Online supplements**](https://github.com/PuwasalaG/Probabilistic-Forecast-Reconciliation/)
