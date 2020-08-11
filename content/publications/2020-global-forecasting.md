---
title: "Principles and Algorithms for Forecasting Groups of Time Series: Locality and Globality"
author: Pablo Montero-Manso, Rob&nbsp;J&nbsp;Hyndman
date: 2020-08-10
slug: global-forecasting
kind: unpublished
tags:
  - data science
  - time series
  - forecasting
link: https://arxiv.org/abs/2008.00444
---

Forecasting groups of time series is of increasing practical importance, e.g. forecasting the demand for multiple products offered by a retailer or server loads within a data center. The local approach to this problem considers each time series separately and fits a function or model to each series. The global approach fits a single function to all series. For groups of similar time series, global methods outperform the more established local methods. However, recent results show good performance of global models even in heterogeneous datasets. This suggests a more general applicability of global methods, potentially leading to more accurate tools and new scenarios to study.
Formalizing the setting of forecasting a set of time series with local and global methods, we provide the following contributions:

  1. Global methods are not more restrictive than local methods, both can produce the same forecasts without any assumptions about similarity of the series. Global models can succeed in a wider range of problems than previously thought.
  2. Basic generalization bounds for local and global algorithms. The complexity of local methods grows with the size of the set while it remains constant for global methods. In large datasets, a global algorithm can afford to be quite complex and still benefit from better generalization. These bounds serve to clarify and support recent experimental results in the field, and guide the design of new algorithms. For the class of autoregressive models, this implies that global models can have much larger memory than local methods.
  3. In an extensive empirical study, purposely naive algorithms derived from these principles, such as global linear models or deep networks result in superior accuracy.

In particular, global linear models can provide competitive accuracy with two orders of magnitude fewer parameters than local methods.

