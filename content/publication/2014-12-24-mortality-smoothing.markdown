---
author: Alexander Dokumentov, Rob&nbsp;J&nbsp;Hyndman
comments: false
date: 2014-12-24 06:12:42+00:00
excerpt: By Alexander&nbsp;Dokumentov and Rob&nbsp;J&nbsp;Hyndman
slug: mortality-smoothing
title: 'Bivariate data with ridges: two-dimensional smoothing of mortality rates'
wordpress_id: 2369
kind:
 unpublished
tags:
- demography
- nonparametric smoothing
file: bivariate-mortality-smoothing3.pdf
---


In this article we explore some bivariate smoothing methods with partial differential regularizations designed to handle smooth bivariate surfaces with occasional ridges. We apply our technique to smoothing mortality rates.

Mortality rates are typically smoothed over two dimensions: age and time. Occasional ridges occur due to period effects (e.g., deaths due to wars and epidemics) and cohort effects (e.g., the effects of wars and epidemics on the survivors).

We propose three new practical methods of smoothing mortality rates over age and time. The first method uses bivariate thin plate splines. The second uses a similar procedure but with lasso-type regularization. The third method also uses bivariate lasso-type regularization, but allows for both period and cohort effects. In these smoothing methods, the {logarithms of} mortality rates are modelled as the sum of four components: a smooth bivariate function of age and time, smooth one-dimensional cohort effects, smooth one-dimensional period effects and random errors. Cross validation is used to compare these new smoothing methods with existing approaches.

Although our methods are designed to smooth logarithms of mortality rates, they are generic enough to be applied to any bivariate data with occasional ridges.

**Keywords:** Bivariate data, nonparametric smoothing, mortality rates, graduation, cohort effects, period effects.


