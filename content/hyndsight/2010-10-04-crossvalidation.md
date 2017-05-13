---
author: robjhyndman
comments: true
date: 2010-10-04 10:21:11+00:00
mathjax: true
link: https://robjhyndman.com/hyndsight/crossvalidation/
slug: crossvalidation
title: Why every statistician should know about cross-validation
wordpress_id: 991
categories:
- forecasting
- StackExchange
- statistics
---

Surprisingly, many statisticians see cross-validation as something data miners do, but not a core statistical technique. I thought it might be helpful to summarize the role of cross-validation in statistics, especially as it is proposed that the Q&A site at [stats.stackexchange.com](http://stats.stackexchange.com) should be renamed CrossValidated.com.

Cross-validation is primarily a way of measuring the predictive performance of a statistical model. Every statistician knows that the model fit statistics are not a good guide to how well a model will predict: high $R^2$ does not necessarily mean a good model. It is easy to over-fit the data by including too many degrees of freedom and so inflate $R^2$ and other fit statistics. For example, in a simple polynomial regression I can just keep adding higher order terms and so get better and better fits to the data. But the predictions from the model on new data will usually get worse as higher order terms are added.

One way to measure the predictive ability of a model is to test it on a set of data not used in estimation. Data miners call this a "test set" and the data used for estimation is the "training set". For example, the predictive accuracy of a model can be measured by the mean squared error on the test set. This will generally be larger than the MSE on the training set because the test data were not used for estimation.

However, there is often not enough data to allow some of it to be kept back for testing. A more sophisticated version of training/​test sets is **leave-one-out cross-​​validation** (LOOCV) in which the accuracy measures are obtained as follows. Suppose there are $n$ independent observations, $y_1,\dots,y_n$.

  1. Let observation $i$ form the test set, and fit the model using the remaining data. Then compute the error $(e\_{i}^*=y\_{i}-\hat{y}\_{i})$ for the omitted observation. This is sometimes called a "predicted residual" to distinguish it from an ordinary residual.
  2. Repeat step 1 for $i=1,\dots,n$.
  3. Compute the MSE from $e\_{1}^\*,\dots,e\_{n}^\*$. We shall call this the CV.

This is a much more efficient use of the available data, as you only omit one observation at each step. However, it can be very time consuming to implement (except for linear models --- see below).

Other statistics (e.g., the MAE) can be computed similarly. A related measure is the PRESS statistic (predicted residual sum of squares) equal to $n\times$MSE.

Variations on cross-validation include **leave-k-out cross-validation** (in which k observations are left out at each step) and **k-fold cross-validation** (where the original sample is randomly partitioned into k subsamples and one is left out in each iteration). Another popular variant is the .632+bootstrap of [Efron & Tibshirani (1997)](http://www.jstor.org/stable/2965703) which has better properties but is more complicated to implement.

Minimizing a CV statistic is a useful way to do model selection such as choosing variables in a regression or choosing the degrees of freedom of a nonparametric smoother. It is certainly far better than procedures based on statistical tests and provides a nearly unbiased measure of the true MSE on new observations.

However, as with any variable selection procedure, it can be misused. Beware of looking at statistical tests after selecting variables using cross-validation --- the tests do not take account of the variable selection that has taken place and so the p-values can mislead.

It is also important to realise that it doesn't always work. For example, if there are exact duplicate observations (i.e., two or more observations with equal values for all covariates and for the $y$ variable) then leaving one observation out will not be effective.

Another problem is that a small change in the data can cause a large change in the model selected. Many authors have found that k-fold cross-validation works better in this respect.

In a famous paper, [Shao (1993)](http://www.jstor.org/stable/2290328) showed that leave-one-out cross validation does not lead to a consistent estimate of the model. That is, if there is a true model, then LOOCV will not always find it, even with very large sample sizes. In contrast, certain kinds of leave-k-out cross-validation, where k increases with n, will be consistent. Frankly, I don't consider this is a very important result as there is never a true model. In reality, every model is wrong, so consistency is not really an interesting property.



### Cross-validation for linear models



While cross-validation can be computationally expensive in general, it is very easy and fast to compute LOOCV for linear models. A linear model can be written as
$$
\mathbf{Y} = \mathbf{X}\boldsymbol{\beta} + \mathbf{e}.
$$
Then
$$
\hat{\boldsymbol{\beta}} = (\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\mathbf{Y}
$$
and the fitted values can be calculated using
$$
\mathbf{\hat{Y}} = \mathbf{X}\hat{\boldsymbol{\beta}} = \mathbf{X}(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'\mathbf{Y} = \mathbf{H}\mathbf{Y},
$$
where $\mathbf{H} = \mathbf{X}(\mathbf{X}'\mathbf{X})^{-1}\mathbf{X}'$ is known as the "hat-matrix" because it is used to compute $\mathbf{\hat{Y}}$ ("Y-hat").

If the diagonal values of $\mathbf{H}$ are denoted by $h\_{1},\dots,h\_{n}$, then the cross-validation statistic can be computed using
$$
\text{CV} = \frac{1}{n}\sum\_{i=1}^n [e\_{i}/(1-h\_{i})]^2,
$$
where $e_{i}$ is the residual obtained from fitting the model to all $n$ observations. See Christensen's book [Plane Answers to Complex Questions](http://www.amazon.com/gp/product/0387953612?ie=UTF8&tag=prorobjhyn-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=0387953612) for a proof. Thus, it is not necessary to actually fit $n$ separate models when computing the CV statistic for linear models. This remarkable result allows cross-validation to be used while only fitting the model once to all available observations.



### Relationships with other quantities



Cross-validation statistics and related quantities are widely used in statistics, although it has not always been clear that these are all connected with cross-validation.



#### Jackknife



A jackknife estimator is obtained by recomputing an estimate leaving out one observation at a time from the estimation sample. The $n$ estimates allow the bias and variance of the statistic to be calculated.



#### Akaike's Information Criterion



Akaike's Information Criterion is defined as
$$
\text{AIC} = -2\log {\cal L}+ 2p,
$$
where ${\cal L}$ is the maximized likelihood using all available data for estimation and $p$ is the number of free parameters in the model. Asymptotically, minimizing the AIC is equivalent to minimizing the CV value. This is true for any model [(Stone 1977)](http://www.jstor.org/stable/2984877), not just linear models. It is this property that makes the AIC so useful in model selection when the purpose is prediction.



#### Schwarz Bayesian Information Criterion



A related measure is Schwarz's Bayesian Information Criterion:
$$
\text{BIC} = -2\log {\cal L}+ p\log(n),
$$
where $n$ is the number of observations used for estimation. Because of the heavier penalty, the model chosen by BIC is either the same as that chosen by AIC, or one with fewer terms. Asymptotically, for linear models minimizing BIC is equivalent to leave-$v$-out cross-validation when $v = n[1-1/(\log(n)-1)]$ [(Shao 1997)](http://www3.stat.sinica.edu.tw/statistica/oldpdf/A7n21.pdf).

Many statisticians like to use BIC because it is consistent --- if there is a true underlying model, then with enough data the BIC will select that model. However, in reality there is rarely if ever a true underlying model, and even if there was a true underlying model, selecting that model will not necessarily give the best forecasts (because the parameter estimates may not be accurate).



### Cross-validation for time series



When the data are not independent cross-validation becomes more difficult as leaving out an observation does not remove all the associated information due to the correlations with other observations. For time series forecasting, a cross-validation statistic is obtained as follows
   
  1. Fit the model to the data $y\_1,\dots,y\_t$ and let $\hat{y}\_{t+1}$ denote the forecast of the next observation. Then compute the error $(e\_{t+1}^*=y\_{t+1}-\hat{y}\_{t+1})$ for the forecast observation.
  2. Repeat step 1 for $t=m,\dots,n-1$ where $m$ is the minimum number of observations needed for fitting the model.
  3. Compute the MSE from $e\_{m+1}^\*,\dots,e\_{n}^\*$.





### References



An excellent and comprehensive recent survey of cross-validation results is [Arlot and Celisse (2010)](http://dx.doi.org/10.1214/09-SS054)
