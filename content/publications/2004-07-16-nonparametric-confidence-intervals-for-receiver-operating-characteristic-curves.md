---
author: Peter G Hall, Rob&nbsp;J&nbsp;Hyndman, Yanan Fan
Status: Published
comments: false
date: 2004-07-16 03:34:10+00:00
slug: nonparametric-confidence-intervals-for-receiver-operating-characteristic-curves
title: Nonparametric confidence intervals for receiver operating characteristic curves
kind: article
tags:
- nonparametric smoothing
citation: <em>Biometrika</em> <b>91</b>(3), 743-750
doi: 10.1093/biomet/91.3.743
---



We study methods for constructing confidence intervals, and confidence bands, for estimators of receiver operating characteristics. Particular emphasis is placed on the way in which smoothing should be implemented, when estimating either the characteristic itself or its variance. We show that substantial undersmoothing is necessary if coverage properties are not to be impaired. A theoretical analysis of the problem suggests an empirical, plug-in rule for bandwidth choice, optimising the coverage accuracy of interval estimators. The performance of this approach is explored. Our preferred technique is based on asymptotic approximation, rather than a more sophisticated approach using the bootstrap, since the latter requires a multiplicity of smoothing parameters all of which must be chosen in nonstandard ways. It is shown that the asymptotic method can give very good performance.

**Keywords:** bandwidth selection; binary classification; kernel estimator; receiver operating characteristic curve.

[**Download R code**](http://robjhyndman.com/Rfiles/ROC.R)
