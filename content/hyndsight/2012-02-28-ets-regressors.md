---
author: robjhyndman
comments: true
date: 2012-02-28 10:15:03+00:00

link: https://robjhyndman.com/hyndsight/ets-regressors/
slug: ets-regressors
title: Exponential smoothing and regressors
wordpress_id: 1759
categories:
- forecasting
- R
---

I have thought quite a lot about including regressors (i.e. covariates) in exponential smoothing (ETS) models, and I have done it a couple of times in my published work. See my [2008 exponential smoothing book ](http://www.exponentialsmoothing.net)(chapter 9) and my [2008 _Tourism Management_ paper](http://dx.doi.org/10.1016/j.tourman.2007.04.009). However, there are some theoretical issues with these approaches, which have come to light through the research of [Ahmad Farid Osman](https://umexpert.um.edu.my/faridosman), one of our PhD students at Monash University. Basically, they are never forecastable in the sense explained in Section 10.2 my 2008 book (forecastability is the ETS equivalent of invertibility in ARIMA models).

Osman has attempted to repair the problem by proposing a different formulation from those in the above references. The only public description of his proposed model is given by Osman and King in [this presentation](http://www.forecasters.org/submissions/OSMANAHMADFARIDISF2011.pdf) -- sorry, they do have a full paper explaining their approach, but it is not publicly available.  However, the model is much messier than the formulation we put in our book, and although it avoids the forecastability issues, I think it is more difficult to interpret. Still, it's a good attempt at a tough problem, and there's nothing else around that's any better.

So don't expect any code for fitting ETS models with regressors to appear in the forecast package for R anytime soon, and maybe never. Osman may at some stage make his own code available.

Right now, if I have a forecasting problem where I want to use covariates, I tend to use regression with ARMA errors. That's easy to do using the `Arima()` or `auto.arima()` functions in the [forecast package for R](http://github.com/robjhyndman/forecast/). It is even possible to handle multiple seasonality in that way with Fourier terms (although that forces the seasonality to be unchanging over time). More flexible models are possible using the `arimax()` function in the [TSA package](http://cran.r-project.org/package=TSA).

Of course, there is always the dynamic linear model approach, implemented in the [dynlm package](http://cran.r-project.org/package=dynlm).
