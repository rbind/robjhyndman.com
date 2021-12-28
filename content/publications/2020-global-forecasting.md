---
title: "Principles and Algorithms for Forecasting Groups of Time Series: Locality and Globality"
author: Pablo Montero-Manso, Rob&nbsp;J&nbsp;Hyndman
date: 2021-05-10
slug: global-forecasting
kind: article
citation: "<em>International J Forecasting</em>, <b>37</b>(4), 1632-1653"
tags:
  - data science
  - time series
  - forecasting
link: https://www.monash.edu/business/ebs/research/publications/ebs/wp45-2020.pdf
doi: 10.1016/j.ijforecast.2021.03.004
github: pmontman/paper-global-forec-princip
---

Forecasting of groups of time series (e.g. demand for multiple products offered by a retailer, server loads within a data center or the number of completed ride shares in zones within a city) can be approached locally, by considering each time series as a separate regression task and fitting a function to each, or globally,
by fitting a single function to all time series in the set. While global methods can outperform local for groups composed of similar time series, recent empirical evidence shows surprisingly good performance on heterogeneous groups. This suggests a more general applicability of global methods, potentially leading to more accurate tools and new scenarios to study. However, the evidence has been of empirical nature and a more fundamental study is required. Formalizing the setting of forecasting a set of time series with local and global methods, we provide the following contributions:

  1. We show that global methods are not more restrictive than local methods for time series forecasting, a result which does not apply to sets of regression problems in general. Global and local methods can produce the same forecasts without any assumptions about similarity of the series in the set, therefore global models can succeed in a wider range of problems than previously thought.
  2. We derive basic generalization bounds for local and global algorithms, linking global models to pre-existing results in multi-task learning: We find that the complexity of local methods grows with the size of the set while it remains constant for global methods. Global algorithms can afford to be quite complex and still benefit from better generalization error than local methods for large datasets. These bounds serve to clarify and support recent experimental results in the area of time series forecasting, and guide the design of new algorithms. For the specific class of limited-memory autoregressive models, this bound leads to the design of global models with much larger memory than what is effective for local methods.
  3. The findings are supported by an extensive empirical study. We show that purposely naïve algorithms derived from these principles, such as global linear models fit by least squares, deep networks or even high order polynomials, result in superior accuracy in benchmark datasets. In particular, global linear models show an unreasonable effectiveness, providing competitive forecasting accuracy with far fewer parameters than the simplest of local methods. Empirical evidence points towards global models being able to automatically learn long memory patterns and related effects that are only available to local models if introduced manually.
