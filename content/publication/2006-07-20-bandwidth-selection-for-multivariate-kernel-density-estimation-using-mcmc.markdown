---
author: Xibin Zhang, Maxwell L King, Rob&nbsp;J&nbsp;Hyndman
Status: Published
comments: false
date: 2006-07-20 06:19:21+00:00
slug: bandwidth-selection-for-multivariate-kernel-density-estimation-using-mcmc
title: A Bayesian approach to bandwidth selection for multivariate kernel density estimation
kind: article
tags:
- density estimation
- nonparametric smoothing
citation: <em>Computational Statistics & Data Analysis</em> <b>50</b>(11), 3009-3031
doi: 10.1016/j.csda.2005.06.019
---



Kernel density estimation for multivariate data is an important technique that has a wide range of applications. However, it has received significantly less attention than its univariate counterpart. The lower level of interest in multivariate kernel density estimation is mainly due to the increased difficulty in deriving an optimal data-driven bandwidth as the dimension of the data increases. We provide Markov chain Monte Carlo (MCMC) algorithms for estimating optimal bandwidth matrices for multivariate kernel density estimation. Our approach is based on treating the elements of the bandwidth matrix as parameters whose posterior density can be obtained through the likelihood cross-validation criterion. Numerical studies for bivariate data show that the MCMC algorithm generally performs better than the plug-in algorithm under the Kullback–Leibler information criterion, and is as good as the plug-in algorithm under the mean integrated squared error (MISE) criterion. Numerical studies for five-dimensional data show that our algorithm is superior to the normal reference rule. Our MCMC algorithm is the first data-driven bandwidth selector for multivariate kernel density estimation that is applicable to data of any dimension.

**Keywords:** Cross-validation; Kullback–Leibler information; Mean integrated squared errors; Sampling algorithms; Monte Carlo kernel likelihood.

