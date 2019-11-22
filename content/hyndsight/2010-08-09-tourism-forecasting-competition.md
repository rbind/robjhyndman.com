---
date: 2010-08-09 05:08:40+00:00
slug: tourism-forecasting-competition
title: The tourism forecasting competition
categories:
- forecasting
- IJF
- kaggle
---

Recently I wrote a paper entitled ["The tourism forecasting competition"](/publications/the-tourism-forecasting-competition/) in which we (i.e., George Athanasopoulos, Haiyan Song, Doris Wu and I) compared various forecasting methods on a relatively large set of tourism-related time series. The paper has been accepted for publication in the _International Journal of Forecasting_. (When I submit a paper to the _IJF_ it is always handled by another editor. In this case, Mike Clements handled the paper and it went through several revisions before it was finally accepted. Just to show the process is unbiased, I have had a paper rejected by the journal during the period I have been Editor-in-Chief.)

We are now opening up the competition to anyone who thinks they can do better than the best methods we implemented in the paper. Methods will be evaluated based on the smallest MASE (Mean Absolute Scaled Error) -- see [Hyndman & Koehler (2006)](/publications/another-look-at-measures-of-forecast-accuracy/) for details of this statistic.

To make it interesting, there is a prize. The overall winner will collect $AUD500 and will be invited to contribute a discussion paper to the _International Journal of Forecasting_ describing their methodology and giving their results, provided either the monthly MASE results are better than 1.38, the quarterly results are better than 1.43 or the yearly results are better than 2.28. These thresholds are the best performing methods in the analysis of these data described in [Athanasopoulos et al (2011)](/publications/the-tourism-forecasting-competition/).  In other words, the winner has to beat the best results in this paper for at least one of the three sets of series. It will also be necessary that the winner be able to describe their method clearly, in sufficient detail to enable replication and in a form suitable for the _International Journal of Forecasting_. The paper would appear in the April 2011 issue of the _IJF_.

The competition is being hosted by the innovative folks at [kaggle.com](http://kaggle.com). Head over to [kaggle.com/tourism1](http://kaggle.com/c/tourism1) to get the data and enter the competition.

The competition will be in two stages. Stage 1 involves only the annual data -- 518 time series. You need to submit forecasts of the next four observations for each series before 20 September 2010. Stage 2 will involve the monthly and quarterly data and will begin after Stage 1 closes.

Good luck!
