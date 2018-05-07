---
author: robjhyndman
comments: true
date: 2013-03-12 22:56:55+00:00
mathjax: true
link: https://robjhyndman.com/hyndsight/intervals/
slug: intervals
title: The difference between prediction intervals and confidence intervals
wordpress_id: 2126
categories:
- forecasting
- statistics
---

Prediction intervals and confidence intervals are not the same thing. Unfortunately the terms are often confused, and I am often frequently correcting the error in students' papers and articles I am reviewing or editing.

A prediction interval is an interval associated with a random variable yet to be observed, with a specified probability of the random variable lying within the interval. For example, I might give an 80% interval for the forecast of GDP in 2014. The actual GDP in 2014 should lie within the interval with probability 0.8. Prediction intervals can arise in Bayesian or frequentist statistics.

A confidence interval is an interval associated with a parameter and is a frequentist concept. The parameter is assumed to be non-random but unknown, and the confidence interval is computed from data. Because the data are random, the interval is random. A 95% confidence interval will contain the true parameter with probability 0.95. That is, with a large number of repeated samples, 95% of the intervals would contain the true parameter.<!-- more -->

A Bayesian confidence interval, also known as a "credible interval", is an interval associated with the posterior distribution of the parameter. In the Bayesian perspective, parameters are treated as random variables, and so have probability distributions. Thus a Bayesian confidence interval is like a prediction interval, but associated with a parameter rather than an observation.

I think the distinction between prediction and confidence intervals is worth preserving because sometimes you want to use both. For example, consider the regression
$$
y_i = \alpha + \beta x_i + e_i
$$
where $y_i$ is the change in GDP from quarter $i-1$ to quarter $i$, $x_i$ is the change in the unemployment rate from quarter $i-1$ to quarter $i$, and $e\_i\sim\text{N}(0,\sigma^2)$. (This regression model is known as [Okun's law](http://en.wikipedia.org/wiki/Okun's_law) in macroeconomics.) In this case, both confidence intervals and prediction intervals are interesting. You might be interested in the confidence interval associated with the mean value of $y$ when $x=0$; that is, the mean growth in GDP when the unemployment rate does not change. You might also be interested in the prediction interval for $y$ when $x=0$; that is, the likely range of future values of GDP growth when the unemployment rate does not change.

The distinction is mostly retained in the statistics literature. However, in econometrics it is common to use "confidence intervals" for both types of interval (e.g., [Granger & Newbold, 1986](http://www.amazon.com/gp/product/0122951840/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=0122951840&linkCode=as2&tag=prorobjhyn-20)). I once asked Clive Granger why he confused the two concepts, and he dismissed my objection as fussing about trivialities. I disagreed with him then, and I still do.

I have seen someone compute a confidence interval for the mean, and use it as if it was a prediction interval for a future observation. The trouble is, confidence intervals for the mean are _much_ narrower than prediction intervals, and so this gave him an exaggerated and false sense of the accuracy of his forecasts. Instead of the interval containing 95% of the probability space for the future observation, it contained only about 20%.

So I ask statisticians to please preserve this distinction. And I ask econometricians to stop being so sloppy about terminology. Unfortunately, I can't continue my debate with Clive Granger. I rather hoped he would come to accept my point of view.




