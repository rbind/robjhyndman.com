---
author: robjhyndman
comments: true
date: 2014-12-05 12:05:33+00:00

link: https://robjhyndman.com/hyndsight/prediction-competitions/
slug: prediction-competitions
title: Prediction competitions
wordpress_id: 3082
categories:
- data science
- forecasting
- IJF
- kaggle
- statistics
---

Competitions have a long history in forecasting and prediction, and have been instrumental in forcing research attention on methods that work well in practice. In the forecasting community, the [M competition](http://forecasters.org/resources/time-series-data/m-competition/) and [M3 competition](http://forecasters.org/resources/time-series-data/m3-competition/) have been particularly influential. The data mining community have the annual [KDD cup](http://kdd.org/kdd-cup) which has generated attention on a wide range of prediction problems and associated methods. Recent KDD cups are [hosted on kaggle](https://www.kaggle.com/c/kdd-cup-2014-predicting-excitement-at-donors-choose).

In my research group meeting today, we discussed our (limited) experiences in competing in some [Kaggle competitions](https://www.kaggle.com/competitions), and we reviewed the following two papers which describe two prediction competitions:




    
  1. [Athanasopoulos and Hyndman (IJF 2011). The value of feedback in forecasting competitions](http://dx.doi.org/10.1016/j.ijforecast.2011.03.002). [[preprint version](/papers/kaggle.pdf)]

    
  2. [Roy et al (2013). The Microsoft Academic Search Dataset and KDD Cup 2013](http://www.kdd.org/kddcup2013/sites/default/files/papers/papers.pdf).



<!-- more -->Some points of discussion:


    
  * The old style of competition where participants make a single submission and the results are compiled by the organizers is much less effective than competitions involving feedback and a leaderboard (such as those hosted on [kaggle](http://www.kaggle.com)). The feedback seems to encourage participants to do better, and the results often improve substantially during the competition.

    
  * Too many submissions results in over-fitting to the test data. Therefore the final scores need to be based on a different test data set than the data used to score the submissions during the competition. Kaggle does not do this, although they partially address the problem by computing the leaderboard scores on a subset of the final test set.

    
  * The metric used in the competition is important, and this is sometimes not thought through carefully enough by competition organizers.

    
  * There are several competition platforms available now including [Kaggle](http://kaggle.com), [CrowdAnalytix](http://crowdanalytix.com) and [Tunedit](http://tunedit.org/).

    
  * The best competitions are focused on specific domains and problems. For example, the [GEFcom 2014](http://www.gefcom.org) competitions are about specific problems in energy forecasting.

    
  * Competitions are great for advancing knowledge of what works, but they do not lead to data scientists being well paid as many people compete but few are rewarded.

    
  * The IJF likes to publish papers from winners of prediction competitions because of the extensive empirical evaluation provided by the competition. However, a condition of publication is that the code and methods are fully revealed, and winners are not always happy to comply.

    
  * The IJF will only publish competition results if they present new information about prediction methods, or tackle new prediction problems, or measure predictive accuracy in new ways. Just running another competition like the previous ones is not enough. It still has to involve genuine research results.

    
  * I would love to see some serious research about prediction competitions, but that would probably require a company like kaggle to make their data public. See [Frank Diebold's comments on this](http://fxdiebold.blogspot.com.au/2014/04/on-kaggle-forecasting-competitions-part_28.html) too.

    
  * A nice side effect of some competitions is that they create a benchmark data set with well tested benchmark methods. This has worked well for the M3 data, for example, and new time series forecasting algorithms can be easily tested against these published results. However, over-study of a single benchmark data set means that methods are probably over-fitting to the published test data. Therefore, a wider range of benchmarks is desirable.

    
  * Prediction competitions are a fun way to hone your skills in forecasting and prediction, and every student in this field is encouraged to compete in a few competitions. I can guarantee you will learn a great deal about the challenges of predicting real data --- something you don't always learn in classes or via textbooks.


