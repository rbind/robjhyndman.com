---
author: robjhyndman
comments: true
date: 2011-05-29 07:02:01+00:00

link: https://robjhyndman.com/hyndsight/estimation2/
slug: estimation2
title: Comparing HoltWinters() and ets()
wordpress_id: 1316
categories:
- computing
- R
---

I received this email today:


>I have a question about the ets() function in R, which I am trying to use for Holt-Winters exponential smoothing.
My problem is that I am getting very different estimates of the alpha, beta and gamma parameters using ets() compared to HoltWinters(), and I can't figure out why.


This is a common question, so I thought the answer might be of sufficient interest to post here.<!-- more -->

There are several issues involved.



	
  1. `HoltWinters()` and `ets()` are optimizing different criterion. `HoltWinters()` is using heuristic values for the initial states and then estimating the smoothing parameters by optimizing the MSE. `ets()` is estimating both the initial states and smoothing parameters by optimizing the likelihood function (which is only equivalent to optimizing the MSE for the linear additive models).

	
  2. The two functions use different optimization routines and different starting values. That wouldn't matter if the surfaces being optimized were smooth, but they are not. Because the MSE and likelihood surfaces are both fairly bumpy, it is easy to find a local optimum. The only way to avoid this problem is to use a much slower computational method such as PSO.

	
  3. `ets()` searches over a restricted parameter space to ensure the resulting model is forecastable. `HoltWinters()` ignores this issue (it was written before the problem was even discovered). See [this paper](http://dx.doi.org/10.1007/s10463-006-0109-x) for details (equivalently chapter 10 of my [exponential smoothing book](http://www.exponentialsmoothing.net)).


I have experimented with many different choices of the starting values for the initial values and smoothing parameters, and what is implemented in `ets()` seems about as good as is possible without using a much slower optimization routine. Where there is a difference between `ets()` and `HoltWinters()`, the results from `ets()` are usually more reliable.

A related question on estimation of ARIMA models was discussed at [https://robjhyndman.com/hyndsight/estimation/](https://robjhyndman.com/hyndsight/estimation/).
