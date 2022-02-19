---
author: robjhyndman
comments: true
date: 2022-02-18
title: "Simulating from TBATS models"
output: 
  html_document:
    keep_md: true
mathjax: true
categories:
  - time series
  - R
  - forecasting
  - data science
---
  


I've had several requests for an R function to simulate future values from a TBATS model. We will eventually include TBATS in the [`fable` package](https://fable.tidyverts.org), and the facilities will be added there. But in the meantime, if you are using the [`forecast` package](https://pkg.robjhyndman.com/forecast) and want to simulate from a fitted TBATS model, here is how do it. 

## Simulating via one-step forecasts

Doing it efficiently would require a more complicated approach, but this is super easy if you are willing to sacrifice some speed. The trick is to realise that a simulation can be handled easily for almost any time series model using residuals and one-step forecasts. Note that a residual is given by
$e_t = y_t - \hat{y}_{t|t-1}$ so we can write

$$y_t = \hat{y}_{t|t-1} + e_t.$$

Therefore, given data to time $T$, we can simulate iteratively using
$$y_{T+i}^* = \hat{y}_{T+i|T+i-1} + \varepsilon_{T+i}, \qquad i=1,\dots,h,$$
where $\varepsilon_{T+i}$ is randomly generated from the error distribution, or bootstrapped by randomly sampling from past residuals. The value of $\hat{y}_{T+i|T+i-1}$ can be obtained by applying the model to the series $\\{y_1,\dots,y_T,y^*_{T+1},\dots,y^*_{T+i-1}\\}$ (without re-estimating the parameters) and forecasting one-step ahead. This is the same trick we use to get [prediction intervals for neural network models](https://otexts.com/fpp3/nnetar.html#prediction-intervals-5).

## Implementation

Because `simulate()` is an S3 method in R, we have to make sure the corresponding `simulate.tbats()` function has all the necessary arguments to match other `simulate` functions. It's also good to make it as close as possible to other `simulate` functions in the `forecast` package, to make it easier for users when switching between them. The real work is done in the last few lines. 


```r
simulate.tbats <- function(object, nsim=length(object$y),
                           seed = NULL, future=TRUE,
                           bootstrap=FALSE, innov = NULL, ...) {
  if (is.null(innov)) {
    if (!exists(".Random.seed", envir = .GlobalEnv)) {
      runif(1)
    }
    if (is.null(seed)) {
      RNGstate <- .Random.seed
    }
    else {
      R.seed <- .Random.seed
      set.seed(seed)
      RNGstate <- structure(seed, kind = as.list(RNGkind()))
      on.exit(assign(".Random.seed", R.seed, envir = .GlobalEnv))
    }
  }
  else {
    nsim <- length(innov)
  }
  if (bootstrap) {
    res <- residuals(object)
    res <- na.omit(res - mean(res, na.rm = TRUE))
    e <- sample(res, nsim, replace = TRUE)
  }
  else if (is.null(innov)) {
    e <- rnorm(nsim, 0, sqrt(object$variance))
  } else {
    e <- innov
  }
  x <- getResponse(object)

  y <- numeric(nsim)
  if(future) {
    dataplusy <- x
  } else {
    # Start somewhere in the original series
    dataplusy <- ts(sample(x, 1), start=-1/frequency(x),
                    frequency = frequency(x))
  }
  fitplus <- object
  for(i in seq_along(y)) {
    y[i] <- forecast(fitplus, h=1)$mean + e[i]
    dataplusy <- ts(c(dataplusy, y[i]),
                    start=start(dataplusy), frequency=frequency(dataplusy))
    fitplus <- tbats(dataplusy, model=fitplus)
  }
  return(tail(dataplusy, nsim))
}
```

I've [added this to the `forecast` package](https://github.com/robjhyndman/forecast/commit/309f4d9a16b9a04e34b23219d097b0388e97c04a) for the next version.

Something similar could be written for any other forecasting function that doesn't already have a `simulate` method. Just swap the `tbats` call to the relevant modelling function.

## Example


```r
library(forecast)
library(ggplot2)

fit <- tbats(USAccDeaths)
p <- USAccDeaths %>% autoplot() + 
  labs(x = "Year", y = "US Accidental Deaths",
       title = "TBATS simulations")
for (i in seq(9)) {
  p <- p + autolayer(simulate(fit, nsim = 36), series = paste("Sim", i))
}
p
```

![](/hyndsight/2022-02-simulatingtbats_files/figure-html/unnamed-chunk-2-1.png)<!-- -->
