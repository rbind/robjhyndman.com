---
date: 2017-11-20
slug: m4comp-response
title: "M4 Forecasting Competition: response from Spyros Makridakis"
categories:
  - forecasting
  - R
  - reproducible research
  - time series
---

***Following my [post on the M4 competition](/hyndsight/m4comp/) yesterday, Spyros Makridakis sent me these comments for posting here.***

I would like to thank Rob, my friend and co-author, for his insightful remarks concerning the upcoming M4 competition. As Rob says, the two of us have talked a great deal about competitions and I certainly agree with him about the “ideal” forecasting competition. In this reply, I will explain why I have deviated from the “ideal”, mostly for practical reasons and to ensure higher participation.

**Confidence Intervals:** Rob proposes asking for a “full forecast distribution”. Although a valid point, this would have excluded more than 95% of the methods (including ML and those based on exponential smoothing) that cannot produce prediction intervals, not to mention “full distribution forecasts”. Given this tradeoff, the choice was easy for me to go with the alternative of encouraging the participants to submit “Confidence Interval” predictions and to introduce a prize for the most accurate method.

**Replicability versus Reproducibility:** I could have asked the participants to submit their source program code. Imagine, however, someone intending to deploy his/her forecasting method for stock market predictions. Asking for the source code would have stopped him/her from participating.

**Annual, Quarterly and Monthly Data:** This is indeed not yet fully outlined on the M4 site ([mofc.unic.ac.cy/m4/](https://mofc.unic.ac.cy/m4/)), but will be updated accordingly in the coming days. In addition to the crucial “Annual/Quarterly/Monthly” categories, we’ve also incorporated an “Others” category that includes non-economic, Finance, Demographics and Industry data, as well as non-annual, quarterly and monthly data. The purpose of the M4, as explained on the site, is to represent the real world as much as possible, making it imperative to include weekly, daily and hourly data among others.

**Real Time, Multiple Forecasts:** We had an in-depth discussion about having participants make several/multiple forecasts using real time data (e.g. stock market closing prices, GNP and other economic variables, inventories, housing starts, oil and gold prices, even temperatures). We decided against it for mainly practical reasons: so as not to make the competition unnecessarily complex and to keep it open to entrants who are unable to participate full-time. We, therefore, opted to follow the practice of the previous M Competitions for convenience. In parallel, we are looking to run an M5 Competition, potentially in collaboration with Kaggle, to compare the accuracy of forecasting methods on a real time basis using stock market, price, financial, economic and other real life data.

> ***The following remarks are from me [RJH]:***

> * I prefer "prediction intervals" to "confidence intervals" when describing uncertainty about future values of a time series. There is a difference, and I think it is worth preserving the distinction. See [this blog post](/hyndsight/intervals/) for further discussion on this point.
> * While statements of uncertainty are not common in the machine learning community, it is possible to produce prediction intervals as I explained in my post on [prediction intervals for NNETAR models](/hyndsight/nnetar-prediction-intervals/).
> * Exponential smoothing can produce prediction intervals as a result of the innovations state space modelling framework. See [my Springer book](http://exponentialsmoothing.net) for an in-depth treatment, or [my textbook with George Athanasopoulos](https://otexts.com/fpp2/ets.html) for a simpler explanation.
> * I look forward to the M5 competition with a more Kaggle-like approach!
