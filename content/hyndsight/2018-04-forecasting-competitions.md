---
date: 2018-04-11
slug: forecasting-competitions
title: "A brief history of time series forecasting competitions"
mathjax: true
categories:
  - forecasting
  - reproducible research
  - time series
  - R
---

Prediction competitions are now so widespread that it is often forgotten how controversial they were when first held, and how influential they have been over the years.

To keep this exercise manageable, I will restrict attention to time series forecasting competitions --- where only the history of the data is available when producing forecasts.

## Nottingham studies

The earliest non-trivial study of time series forecast accuracy was probably by David Reid as part of his PhD at the University of Nottingham (1969). Building on his work, [Paul Newbold](https://en.wikipedia.org/wiki/Paul_Newbold) and [Clive Granger](https://en.wikipedia.org/wiki/Clive_Granger) conducted a study of forecast accuracy involving 106 time series ([JRSSA, 1974](http://www.jstor.org/stable/2344546)). Although they did not invite others to participate, they did start the discussion on what forecasting methods are the most accurate for different types of time series. They presented the ideas to the Royal Statistical Society, and the subsequent discussion  reveals some of the erroneous thinking of the time.

One important feature of the results was the empirical demonstration that forecast combinations improve accuracy. (A similar result had been demonstrated as far back as [Galton, 1907](http://doi.org/10.1214/14-STS468).) Yet one discussant (GJA Stern) stated

> The combined forecasting methods seem to me to be non-starters ... Is a combined method not in danger of falling between two stools?

Another ([Maurice Priestley](https://en.wikipedia.org/wiki/Maurice_Priestley)) said

>The authors' suggestion about combining different forecasts is an interesting one, but its validity would seem to depend on the assumption that the model used in the Box-Jenkins approach is inadequate---for otherwise, the Box-Jenkins forecast alone would be optimal.

This reveals a view commonly held (even today) that there is some single model that describes the data generating process, and that the job of a forecaster is to find it. This seems patently absurd to me --- real data comes from much more complicated, non-linear, non-stationary processes than any model we might dream up --- and George Box famously dismissed it saying ["All models are wrong but some are useful"](https://en.wikipedia.org/wiki/All_models_are_wrong).

There was also a strong bias against automatic forecasting procedures. For example, [Gwilym Jenkins](https://en.wikipedia.org/wiki/Gwilym_Jenkins) said

>  The fact remains that model building is best done by the human brain and is inevitably an iterative process.

Subsequent history has shown that to be untrue provided enough data is available.

## Makridakis & Hibon (1979)

Five years later, [Spyros Makridakis](https://en.wikipedia.org/wiki/Spyros_Makridakis) and [Michèle Hibon](https://www.insead.edu/faculty-research/faculty/michele-hibon) put together a collection of 111 time series and compared many more forecasting methods. They also presented the results to the Royal Statistical Society.  The resulting [JRSSA (1979) paper](http://www.jstor.org/stable/2345077) seems to have caused quite a stir, and the discussion published along with the paper is entertaining, and at times somewhat shocking.

Maurice Priestley was in attendance again and was clinging to the view that there was a true model waiting to be discovered:

>The performance of any particular technique when applied to a particular series depends essentially on (a) the model which the series obeys; (b) our ability to identify and fit this model correctly and &#40;c) the criterion chosen to measure the forecasting accuracy.

Makridakis and Hibon replied

> There is a fact that Professor Priestley must accept: empirical evidence is in *disagreement* with his theoretical arguments.

Many of the discussants seem to have been enamoured with ARIMA models.

> It is amazing to me, however, that after all this exercise in identifying models, transforming and so on, that the autoregressive moving averages come out so badly. I wonder whether it might be partly due to the authors not using the backwards forecasting approach to obtain the initial errors. --- *W.G. Gilchrist*

> I find it hard to believe that Box-Jenkins, if properly applied, can actually be worse than so many of the simple methods --- *Chris Chatfield*

Then [Chatfield](http://people.bath.ac.uk/mascc/) got personal:

> Why do empirical studies sometimes give different answers? It may depend on the selected sample of time series, but I suspect it is more likely to depend on the skill of the analyst ... these authors are more at home with simple procedures than with Box-Jenkins. --- *Chris Chatfield*

Again, Makridakis & Hibon responded:

> Dr Chatfield expresses some personal views about the first author ... It might be useful for Dr Chatfield to read some of the psychological literature quoted in the main paper, and he can then learn a little more about biases and how they affect prior probabilities.

## M-competition

In response to the hostility and charge of incompetence, Makridakis & Hibon followed up with a new competition involving 1001 series. This time, anyone could submit forecasts, making this the first true forecasting competition as far as I am aware. They also used multiple forecast measures to determine the most accurate method.

The 1001 time series were taken from demography, industry and economics, and ranged in length between 9 and 132 observations. All the data were either non-seasonal (e.g., annual), quarterly or monthly. Curiously, all the data were positive, which made it possibly to compute mean absolute percentage errors, but was not really reflective of the population of real data.

The results of their 1979 paper were largely confirmed. The four main findings (taken from [Makridakis & Hibon, 2000](https://doi.org/10.1016/S0169-2070(00)00057-1)) were:

 1.  Statistically sophisticated or complex methods do not necessarily provide more accurate forecasts than simpler ones.
 1.  The relative ranking of the performance of the various methods varies according to the accuracy measure being used.
 1.  The accuracy when various methods are being combined outperforms, on average, the individual methods being combined and does very well in comparison to other methods.
 1.  The accuracy of the various methods depends upon the length of the forecasting horizon involved.

The paper describing the competition [(Makridakis et al, JF, 1982)](https://doi.org/10.1002/for.3980010202) had a profound effect on forecasting research. It caused researchers to:

 * focus attention on what models produced good forecasts, rather than on the mathematical properties of those models;
 * consider how to automate forecasting methods;
 * be aware of the dangers of over-fitting;
 * treat forecasting as a different problem from time series analysis.

These now seem like common-sense to forecasters, but they were revolutionary ideas in 1982.

## M3-competition

In 1998, Makridakis & Hibon ran their third competition (the second was not strictly time series forecasting), intending to take account of new methods developed since their first competition nearly two decades earlier. They wrote

>The M3-Competition is a final attempt by the authors to settle the accuracy issue of various time series methods... The extension involves the inclusion of more methods/researchers (in particular in the areas of neural networks and expert systems) and more series.

It is brave of any academic to claim that their work is "a final attempt"!

This competition involved 3003 time series, all taken from business, demography, finance and economics, and ranging in length between 14 and 126 observations. Again, the data were all either non-seasonal (e.g., annual), quarterly or monthly, and all were positive.

In the published results, [Makridakis & Hibon (2000)](https://doi.org/10.1016/S0169-2070(00)00057-1) claimed that the M3 competition supported the findings of their earlier work. Yet the best two methods were not obviously "simple".

One was the "Theta" method which was described in a highly complicated and confusing manner. Later, Hyndman and Billah (2003) showed that the Theta method was equivalent to an average of a linear regression and simple exponential smoothing with drift, so it turned out to be relatively simple after all. But Makridakis & Hibon could not have known that in 2000.

The other method that performed extremely well in the M3 competition was the commercial software package [ForecastPro](http://www.forecastpro.com/). The algorithm used is not public, but enough information has been revealed that we can be sure it is not simple. The algorithm selects between an exponential smoothing and ARIMA model based on some state space approximations and a BIC calculation [(Goodrich, 2000)](http://bit.ly/forecastpro).

## Neural network competitions

There was only one submission that used neural networks in the M3 competition, but it did relatively poorly. To encourage additional submissions, [Sven Crone](http://sven-crone.com) organized a subsequent competition ([the NN3](http://www.neural-forecasting-competition.com/NN3)) was organized in 2006 involving 111 of the monthly M3 series. Over 60 algorithms were submitted, although none outperformed the original M3 contestants. The [paper describing the competition results](https://doi.org/10.1016/j.ijforecast.2011.04.001) (by Crone, Hibon and Nikolopoulos) was published in the IJF in 2011.

This supports the general consensus in forecasting, that neural networks (and other highly non-linear and nonparametric methods) are not well suited to time series forecasting due to the relatively short nature of most time series. The longest series in this competition was only 126 observations long. That is simply not enough data to fit a good neural network model.

There were [some follow-up competitions](http://www.neural-forecasting-competition.com/), but as far as I know none of the results have ever been published.

## Kaggle time series competitions

Few [Kaggle competitions](https://www.kaggle.com/competitions) have involved time series forecasting; mostly they are about cross-sectional prediction or classification. However, there have been some notable exceptions.

 * George Athanasopoulos and I organized a [Tourism forecasting](https://www.kaggle.com/c/tourism1) competition in 2010. There was a follow-up [part 2](https://www.kaggle.com/c/tourism2) later in the same year. The best methods were described in [papers published by the IJF](https://www.sciencedirect.com/journal/international-journal-of-forecasting/vol/27/issue/3) in 2011. Coincidentally, both the winners were from my own home city, Melbourne!  One of them (Jeremy Howard) went on to become President and Chief Scientist at Kaggle for a few years, and is now running [fast.ai](http://www.fast.ai). Another (Phil Brierley) is better known for winning the [Kaggle heritage health prize](http://blog.kaggle.com/2013/06/03/powerdot-awarded-500000-and-announcing-heritage-health-prize-2-0/) and for running my local [Data Science Meetup](https://www.meetup.com/en-AU/Data-Science-Melbourne/).

 * Recently, Oren Anava and Vitaly Kuznetsov organized a [Web traffic](https://www.kaggle.com/c/web-traffic-time-series-forecasting) competition. Here the task was to forecast future web traffic for approximately 145,000 Wikipedia articles. A paper describing the best methods is currently in progress.

One of the great benefits of the Kaggle platform (and others like it) is that it provides a leaderboard and allows multiple submissions. This has been found to lead to much better results as teams compete against each other over the duration of the competition. George Athanasopoulos and I discussed this important feature in a [2011 IJF paper](/publications/kaggle/).

## M4-competition

Makridakis is now at it again with the [M4 competition](https://mofc.unic.ac.cy/m4/). This time there are 100,000 time series, and many more participants. New features of this competition are:

 * Weekly, daily and hourly data are included, along with annual, quarterly and monthly data.
 * Participants are invited to submit prediction intervals as well as point forecasts.
 * There is a strong emphasis on reproducibility (a problem with earlier competitions), and competitors will be required to post their code on Github.

## Future competitions?

The M4 competition is certainly not the end of time series competitions! There are many features of time series forecasting that have not been studied under competition conditions.

No previous time series competition has explored forecast distribution accuracy (as distinct from point forecast accuracy). The M4 competition is the first to make a start in this diretion with prediction interval accuracy being measured, but it is much richer to measure the whole forecast distribution. This was done, for example, in the [GEFCom2014](http://www.drhongtao.com/gefcom/2014) and [GEFCom2017](http://www.drhongtao.com/gefcom/2017) competitions for energy demand forecasting.

No competition has involved large-scale multivariate time series forecasting. While many of the time series in the competitions are probably related to each other, this information has not been provided. Again, the GEFCom competitions have been ground-breaking in this respect also, by requiring true multivariate forecasts to be provided for the energy demand in different regions of the US.

I know of no large-scale forecasting competition for finance data (e.g., stock prices or returns), yet this would seem to be of great interest judging by the number of submissions to the IJF I receive every week.

## R packages

The data from many of these competitions are available as R packages.

 * [Mcomp](http://pkg.robjhyndman.com/Mcomp/): Data from the M-competition and M3-competition.
 * [M4comp2018](https://github.com/carlanetto/M4comp2018): Data from the M4-competition.
 * [Tcomp](https://cran.r-project.org/package=Tcomp): Data from the Kaggle tourism competition.
 * [tscompdata](https://github.com/robjhyndman/tscompdata): Data from the NN3 and NN5 competitions.

## Further reading

A useful discussion of forecasting competitions and their history is provided by [Fildes, R., & Ord, K. (2002). Forecasting competitions: their role in improving forecasting practice and research. In M. Clements & D. Hendry (Eds.), *A companion to economic forecasting* (pp. 322–353). Oxford, Blackwell.](https://doi.org/10.1002/9780470996430.ch15)

### Some relevant blog posts:

 * [Prediction competitions](/hyndsight/prediction-competitions/)
 * [M4 competition](/hyndsight/m4comp/)
 * [M4 competition response from Spyros Makridakis](/hyndsight/m4comp-response/)
 * [M4 forecasting competition update](/hyndsight/m4competition/)

***

*[This post has been syndicated at [ISBIS Blog Corner](https://blogisbis.wordpress.com/2018/04/16/a-brief-history-of-time-series-forecasting-competitions/)]*

