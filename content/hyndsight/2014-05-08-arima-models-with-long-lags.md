---
author: robjhyndman
comments: true
date: 2014-05-08 03:43:23+00:00
mathjax: true
link: https://robjhyndman.com/hyndsight/arima-models-with-long-lags/
slug: arima-models-with-long-lags
title: ARIMA models with long lags
wordpress_id: 2725
categories:
- forecasting
- R
- statistics
---

**Today's email question:**


>I work within a government budget office and sometimes have to forecast fairly simple time series several quarters into the future. Auto.arima() works great and I often get something along the lines of: ARIMA(0,0,1)(1,1,0)[12] with drift as the lowest AICc. 

>However, my boss (who does not use R) takes issue with low-order AR and MA because "you're essentially using forecasted data to make your forecast." His models include AR(10) MA(12)s etc. rather frequently. I argue that's overfitting. I don't see a great deal of discussion in textbooks about this, and I've never seen such higher-order models in a textbook setting. But are they fairly common in practice? What concerns could I raise with him about higher-order models? Any advice you could give would be appreciated. 

<!-- more -->

**My response:**

If you mean ARIMA models of that size with all coefficients estimated, than yes, that is definitely overfitting for quarterly data. I do not believe such models are common in practice, as most people in business are now using automated algorithms for ARIMA modelling, and the automated algorithms (in any reputable software) are not going to give a model like that.

I don't understand why a low order ARIMA model is "using forecasted data to make your forecast" in contrast to higher order models. Almost all time series models use recursive forecast calculations, and so $h$-step forecasts use the preceding $1:(h-1)$-step forecasts.

But perhaps you mean high order ARIMA models with a lot of coefficients set to zero. These are usually called subset ARIMA models. In that case, there is not necessarily over-fitting although there will be a loss of data used in estimation due to the long lags required.

Your boss might be thinking of using lags longer than $h$ so that the forecasts are only based on observations, and not on intermediate forecasts. That is a strategy that is sometimes used, and then you have to use a different model for every forecast horizon, with no terms for lags $1,...,(h-1)$. It is called "direct forecasting" rather than "recursive forecasting". But unless the model is highly nonlinear, it will not generally give better forecasts. The loss of efficiency due to using fewer observations generally does more harm than the potential bias improvements due to forecasting directly. This is discussed a little in [my recent boosting paper](/publications/boostingar/) and in the references we cite.

One strategy you could take is to fit both models and look at their comparative forecast accuracy on a rolling forecasting origin (aka [time series cross validation](/hyndsight/tscvexample/)). The more parsimonious models will almost always forecast better, and the empirical evidence of forecast accuracy numbers may be enough to convince your boss.
