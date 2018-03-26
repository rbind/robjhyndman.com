---
author: Alexander Dokumentov, Rob&nbsp;J&nbsp;Hyndman, Leonie Tickle
date: 2017-10-05
slug: mortality-smoothing
title: Two-dimensional smoothing of mortality surfaces with cohort and period ridges
kind:
 unpublished
tags:
- demography
- nonparametric smoothing
file: bivariate-mortality-smoothing3.pdf
---


**BACKGROUND**

Mortality rates typically move smoothly over age and time. Exceptions occur, due to events such as wars and epidemics, which create, among other features, ridges in the mortality surface in a particular calendar year or for cohorts born in a particular year. 

**OBJECTIVES**

We aim to develop and evaluate new methods that better model the smooth underlying age-period mortality surface and any cohort or period ridges.

**METHODS**

We propose two new practical methods for modelling the age-period surface of the logarithms of mortality rates. The first uses an approach similar to bivariate thin plate splines although with $L_1$ regularization. The second, which is our recommended method, also uses bivariate $L_1$ regularization but allows for smooth age-varying period and cohort effects. 

**RESULTS**

Cross validation is used to compare these new methods with existing approaches. Evaluations on a multi-country dataset using four different age and period ranges as well as the simulation results indicate that the recommended method consistently gives a better estimate of the ``true'' age-period mortality surface.

**CONCLUSIONS**

Explicit modelling of cohort and period ridges in the mortality surface, using of $L_1$ norm for regularization and measuring errors as well as using two dimensions for smoothing, all improves accuracy and provides greater insight into the underlying mortality dynamics. 

**CONTRIBUTION**

The new methods provide more accurate and nuanced models of the age-period mortality surface, informing mortality modelling, analysis and forecasting. Although designed for the modelling of mortality rates they can be applied to any bivariate data with occasional ridges and extend the statistical literature on quantile smoothing.

&nbsp;

**Keywords:** Bivariate data, nonparametric smoothing, mortality rates, graduation, cohort effects, period effects.


