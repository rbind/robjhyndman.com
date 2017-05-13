---
author: robjhyndman
comments: true
date: 2015-03-12 04:45:30+00:00

link: https://robjhyndman.com/hyndsight/ijf-rejections/
slug: ijf-rejections
title: Common reasons for rejection
wordpress_id: 3176
categories:
- forecasting
- IJF
- journals
- refereeing
---

Every week I reject some papers submitted to the _International Journal of Forecasting_, without sending the papers off to associate editors or reviewers. Here are five of the most common reasons for rejection.<!-- more -->



### 1. Wrong Journal



Submissions to the IJF should be about forecasting, obviously. But we often get papers on econometrics, or time series analysis, or something else that is not forecasting. Even if a paper has some implications for forecasting, if these are not discussed at all, the paper is not within scope for the journal.



### 2. Poor Literature Review



Some papers are about forecasting, yet contain no citations of papers in the IJF. That is not necessarily a problem, but it almost always suggests the authors have not really explored the literature properly. Surely the premier journal in forecasting would have published something of relevance in the last 30 years.

Sometimes I glance through the bibliography and notice no citations from the last ten years. Again, that suggests the authors have not read the literature adequately.

A poor literature review is not usually by itself sufficient grounds for me to desk-reject a paper, but it is a strong predictor of poor quality research.



### 3. No new forecasting ideas



Some papers will compare a few existing forecasting methods on one data set, and conclude that method A does better than the other methods on this data set. These papers almost always get desk-rejected as there is nothing new in them about forecasting. They may be very useful within the field of application, in which case they should get sent to a different journal within that field. But to be published in a forecasting journal, a paper should have something new to say about forecasting that is of interest beyond the specific examples in the paper.



### 4. Limited empirical evaluation



It is journal policy to encourage extensive empirical evaluations of any proposed forecasting methods. But I get papers every week proposing some new forecasting algorithm, and comparing it to two other closely related algorithms, on a very small number of time series. Any new proposal should be compared against the best available alternative methods, on enough data to be able to draw some conclusions. Comparisons on three carefully selected time series prove nothing. Comparisons against some slightly different alternative methods prove nothing. You must show that your method is better than the best available alternative methods, at least in some well-defined circumstances. I've written previously about [appropriate benchmarks](https://robjhyndman.com/hyndsight/benchmarks/).



### 5. Outrageous claims



Finally, I am on the look out for outrageous claims about how good the proposed forecasting algorithm is.

For example, I have rejected dozens of papers claiming that the "Grey method" gives extremely accurate forecasts based on only 3 or 4 observations. That is just silly, and anyone who believes it doesn't know anything about forecasting.

I have also rejected papers showing that the proposed forecasting method has MSE about 1000 times smaller than the alternatives. Almost always what has happened is that the comparisons are based on the training data rather than test data, and the data have been drastically over-fitted.

If your forecasting results look too good to be true, than they probably are.
