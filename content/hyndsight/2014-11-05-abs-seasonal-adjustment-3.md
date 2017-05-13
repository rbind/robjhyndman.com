---
author: robjhyndman
comments: true
date: 2014-11-05 04:56:58+00:00
mathjax: true
link: https://robjhyndman.com/hyndsight/abs-seasonal-adjustment-3/
slug: abs-seasonal-adjustment-3
title: ABS seasonal adjustment update
wordpress_id: 3031
categories:
- jobs
- seasonality
- statistics
---

Since my [last post](https://robjhyndman.com/hyndsight/abs-seasonal-adjustment-2) on the seasonal adjustment problems at the Australian Bureau of Statistics, I've been working closely with people within the ABS to help them resolve the problems in time for tomorrow's release of the October unemployment figures.

Now that the ABS has put out [a statement about the problem](http://www.abs.gov.au/websitedbs/D3310114.nsf/Home/Statement+on+the+Labour+Force+estimates), I thought it would be useful to explain the underlying methodology for those who are interested.<!-- more -->



### The Labour Force Survey



The unemployment rate is derived from the monthly Labour Force Survey. As with all surveys, it is subject to some sampling and non-sampling error. Sampling error arises because a sample is surveyed, rather than the entire population. Non-sampling error arises through inaccuracies in the way the data are collected, recorded or processed.

There are several potential non-sampling effects that could affect the results including (but not limited to):




  
  * the dates on which the survey is conducted within each month (especially in December and January);

  
  * the asking of supplementary survey questions for some respondents;

  
  * the introduction or modification of supplementary surveys;

  
  * the revision of the wording of some questions;

  
  * the number of questions that are asked.



The seasonal adjustment problems observed in published ABS Labour Force statistics over the last few months are a result of not adequately taking account of the non-sampling errors in the LFS, especially the effect of changes in supplementary surveys.

Of particular interest were changes that occurred in February and August 2014 as [explained here](http://www.abs.gov.au/AUSSTATS/abs@.nsf/Previousproducts/6202.0Main%20Features3Jan%202013?opendocument&tabname=Summary&prodno=6202.0&issue=Jan%202013&num=&view=). In both cases, several supplementary surveys were combined into one survey, and some other supplementary surveys were ceased. Whenever such changes occur, there are biases introduced. Unfortunately, the ABS has not been removing the effect of these biases when seasonally adjusting the employment data.



### The ABS seasonal adjustment method



The seasonal adjustment method used by the ABS is based on RegARIMA models with X-12-ARIMA (Findley et al., 1998).

Let $y_1,\dots,y_T$ be a monthly series of employment data (e.g., the total number of females aged 15-19 who are employed full time). This is first modelled using a RegARIMA model given by
\begin{equation}\label{eq:regarima}
\log(y_t) = \boldsymbol{X}_t\boldsymbol{\beta} + z_t
\end{equation}
where $\boldsymbol{\beta}$ is a vector of coefficients, $\boldsymbol{X}_t$ is a matrix of regressors and $z_t$ is a seasonal ARIMA process. In general, the regressors may include trading day and holiday or calendar effects, additive outliers, level shifts, and so on.

Once the coefficients $\boldsymbol{\beta}$ have been estimated, an adjusted series is computed:
\begin{equation}\label{eq:adjust}
y_t^* = y_t \exp(-\boldsymbol{X}_t\hat{\boldsymbol{\beta}}).
\end{equation}

The underlying seasonal adjustment model is given by $y_t^* = f_t s_t e_t$, where




  
  * $f_t$ represents a smooth trend that changes slowly over time. It includes movements and cycles that last longer than one year.

  
  * $s_t$ represents the seasonal indexes that are centred around 1 and describe any regular seasonal patterns in the data. They are assumed to be relatively stable, so that the values do not change much (in size or sign) from year to year.

  
  * $e_t$ denotes the irregular component which contains anything not included in the trend and seasonal components. This can include outliers and noise, and is inherently unpredictable.



The three components are calculated using the X-12-ARIMA procedure (Findley et al., 1998). The seasonally adjusted data is then given by $y_t^a = y_t^* / s_t$.

In the new seasonal adjustment method, the same modelling framework will be used, but some additional regressors are to be included in (1). These are all indicator variables relating to the introduction or modification of supplementary surveys. In this way, any biases associated with changes to supplementary surveys will be explicitly removed from the data prior to the seasonal adjustment process.

According to yesterday's [ABS press release](http://www.abs.gov.au/websitedbs/D3310114.nsf/Home/Statement+on+the+Labour+Force+estimates), this has resulted in an increase in the estimate of the unemployment rate.



### Foresight and hindsight



If you poke around the ABS website, you might discover that [this change was proposed 12 years ago](http://www.abs.gov.au//Ausstats/abs@.nsf/7d12b0f6763c78caca257061001cc588/753755a1062bbe0cca257130000af79b!OpenDocument) but had never been implemented until this week.



### References



[Findley, D. F., B. C. Monsell, W. R. Bell, M. C. Otto and B.-C. Chen (1998) New capabilities and methods of the X-12-ARIMA Seasonal-Adjustment program, _J. Business and Economic Statistics_, **16**(2), 127–152](http://www.jstor.org/stable/1392565)
