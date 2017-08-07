---
author: robjhyndman
comments: true
date: 2014-03-04 02:20:22+00:00
slug: short-time-series
title: Fitting models to short time series
mathjax: true
categories:
- forecasting
- R
- statistics
- time series
---

Following my post on [fitting models to long time series](/hyndsight/long-time-series/), I thought I'd tackle the opposite problem, which is more common in business environments.

I often get asked how <em>few</em> data points can be used to fit a time series model. As with almost all sample size questions, there is no easy answer. It depends on the **number of model parameters to be estimated and the amount of randomness in the data**. The sample size required increases with the number of parameters to be estimated, and the amount of noise in the data.

<!-- more -->

Using least squares estimation, or some other non-regularized estimation method, it is possible to estimate a model only if you have more observations than parameters.  (If you use the LASSO, or some other regularization technique, it is possible to estimate a model with fewer observations than parameters.) However, there is no guarantee that a fitted model will be any good for forecasting, especially when the data are noisy.

Some textbooks provide rules-of-thumb giving minimum sample sizes for various time series models. These are misleading and unsubstantiated in theory or practice. Further, they ignore the underlying variability of the data and often overlook the number of parameters to be estimated as well. There is, for example, no justification whatever for the magic number of 30 often given as a minimum for ARIMA modelling.

The only reasonable approach is to first check that there are enough observations to estimate the model, and then to test if the model performs well out-of-sample. With short series, there is not enough data to allow some observations to be witheld for testing purposes. However, the AIC can be used as a proxy for the one-step forecast out-of-sample MSE (see [here](/hyndsight/aic/)). The AIC allows both the number of parameters and the amount of noise to be taken into account.

What tends to happen with short series is that the AIC suggests very simple models because anything with more than one or two parameters will produce poor forecasts due to the estimation error.  I applied the `auto.arima()` function from the **forecast** package in R to all the series from the M-competition with fewer than 20 observations. There were a total of 144 series, of which 32 had models with zero parameters (random walks), 95 had models with one parameter, 15 had models with two parameters and 2 series had models with three parameters. For what it's worth, here is the code.


```
library(Mcomp)

n <- unlist(lapply(M1,function(x){length(x$x)}))
n <- n[n<20]
series <- names(n)
nparam <- numeric(length(n))
for(i in 1:length(n))
{
  fit <- auto.arima(M1[[series[i]]]$x)
  nparam[i] <- length(fit$coef)
}
table(nparam)
```

Seasonal models bring their own difficulties because the seasonality usually takes up $m-1$ degrees of freedom where $m$ is the seasonal period (e.g., $m=12$ for monthly data). [Fourier terms](/hyndsight/longseasonality/) are one way to reduce the problem --- useful whenever the ratio of $m$ to sample size is large. Further comments on seasonality and sample size are in my short _Foresight_ paper with Andrey Kostenko: ["Minimum sample size requirements for seasonal forecasting models"](/papers/shortseasonal.pdf), although I wrote that for a statistically unsophisticated audience, so there is no mention of the LASSO or AIC as possible solutions.


