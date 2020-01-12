---
author: robjhyndman
date: 2010-10-26 08:37:31+00:00
slug: estimation
title: Different results from different software
categories:
- computing
- forecasting
- R
---

I've had a few questions on this topic lately. Here is an email received today:


>I use Eviews to estimate time series, but I have been checking out R recently, and your Forecast package.<br><br>
>I cannot understand why 2 similar equations in Eviews and R are giving different estimated output. Your insights will be invaluable for my work.<br><br>
>The equations are:
>```
>  R: Arima(log(fee), order=c(1,1,0), seasonal=list(order=c(1,0,0),
>                period=4), include.drift=TRUE)
>
>  Eviews: dlog(fee) c ar(1) sar(1)
>```
>
>Even with `include.drift=FALSE` in R or without `c` in Eviews they give different output.<br><br>
>Much appreciated if you could share your view.

There are several issues here.


  1. The Eviews model is not what it seems. To fit an ARIMA(1,1,0)(1,0,0)4 in Eviews, you need to use

     ```
        dlog(fee) c ar(1) sar(4)
     ```

     The seasonal order needs to be specified in the `sar` term. I've always thought this was a bizarre choice of syntax because it is so easy to make mistakes.


  2. Even with that correction, the two models are not  quite equivalent. In the Eviews code, the differencing is done before estimation, whereas in the R code the differencing is implicit in the model. In estimating the model in R, a state space representation is used and the non-stationary components are given a diffuse prior, rather than simply differenced away. (See [`help(arima)`](http://stat.ethz.ch/R-manual/R-devel/library/stats/html/arima.html) in R.) This will lead to different parameter estimates. A model equivalent to the (corrected) Eviews formulation can be specified in R using

     ```
     Arima(diff(log(fee),order=c(1,0,0),seasonal=list(order=c(1,0,0),period=4),
          include.mean=TRUE)
     ```

     Here the differencing is explicit.


  3. R and Eviews use different estimation methods. Eviews uses nonlinear least squares while R uses maximum likelihood estimation. So the objective functions are not the same and the parameter estimates will therefore differ.


  4. Even if the two models were identical, and the two optimization criteria were identical, it is possible for different packages to give different results because they use different optimization algorithms. With nonlinear optimization, such as in estimating ARIMA models, there are several available algorithms for finding the optimal parameters. While they should all give very similar results, they often differ after the first few decimal places.


Provided the model is correctly specified, none of this should make too much difference to the forecasts obtained, but be prepared for some variations from different packages, and even from different versions of the same package.
