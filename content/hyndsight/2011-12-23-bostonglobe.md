---
author: robjhyndman
comments: true
date: 2011-12-23 04:39:02+00:00

link: https://robjhyndman.com/hyndsight/bostonglobe/
slug: bostonglobe
title: Are we getting better at forecasting?
wordpress_id: 1688
categories:
- forecasting
---

I was interviewed recently for the _Boston Globe_. The interview was by email and I thought it might be useful to post here.<!-- more -->

Here are the questions from the journalist.

>Are we better at predicting future events than we used to be? Or are there obstacles inherent to the endeavor that prevent us from ever really being able to do it accurately? If we are better, then what allowed it? Computational power? Abundance of data? Some methodological insight?

>And: there's a way in which all scientific inquiry is about prediction. We develop models in order to explain outcomes; once we've established those models, we can theoretically use them to predict. And yet, forecasting future events seems like a distinct undertaking. Is it? If so, what is the distinction?


And this is my reply.

Prediction is largely about distinguishing genuine information from randomness. Nothing interesting is ever perfectly predictable because there is always an element of randomness associated with it. Sometimes the randomness is large, and then the event is hard to predict. At other times, the randomness is relatively small and then the event is easy to predict. For example, tides even a year ahead are relatively easy to predict because the pattern is strong and the uncertainty is small. But migration numbers next year are hard to predict because there are not strong and consistent historical patterns and there is a lot of uncertainty due to changing social environments, changing government policy, changing financial and political contexts, and so on.

To take another example, I do a lot of work in predicting electricity demand from one day to 30 years ahead. The models we use for predicting electricity demand in Australia use information about temperatures, public holidays, time of day, day of week, and so on. They produce remarkably accurate forecasts of the level of demand which are used by the Australian Energy Market Operator in planning sufficient generation capacity to meet the demand. But the models will never be perfect because we can't take account of every person's decision about when they will turn on their heater, or air-conditioner, or microwave oven. The individual choices make the demand essentially random, but with some strong patterns.

So your first question is really about whether we are getting better at identifying and modelling the patterns. The answer is yes. In almost all fields of study, our forecasts are better now than they were 20 years ago. But we will never have perfect forecasts because there will always be uncertainty, randomness and unpredictable forces involved.

The improved forecasts have arisen for several reasons. First, computational power makes it possible to test forecasting models over and over again, and see what works well. In this way, we can improve the models by simply testing them and refining them much more than was ever possible before. Second, computational power makes it possible to fit much more sophisticated models than was done previously. Third, computational power has allowed the collection and analysis of enormous data sets, and this has led to some interesting new forecasting methods. For example, the recommendations produced by Netflix, Amazon and other web services are forecasts of what you will like based on enormous data sets. It has only been possible to do these calculations effectively in the last few years.

We have also learned a lot about forecasting practice in the last 30 years (when the first academic forecasting journals were started). We have discovered new ways of testing models before using them for forecasting, and we have found new ways to measure the accuracy of forecasts making it possible to better understand what makes a good forecast.

I see a distinction between explanation and prediction. They are often confused in research, but I think they should be considered separately. A model that is good at explaining the past is not necessarily good at predicting the future. We develop models in order to explain outcomes, and those models _can_ be used to predict, but they are not necessarily the _best_models for prediction. I prefer to develop separate models that are good for prediction, even if those models are not so good at explaining the past. Some of the same variables may be used in the two types of models, but some information may be unique to one of the models.

This is one of the issues for climate change modellers. The models were designed to explain the way the climate works, but they are being used to forecast what will happen to the climate over the next few decades. We do not know if the models are good at forecasting, and it is likely that good forecasting models are not the same as good explanation models. We published [a paper on this](http://dx.doi.org/10.1016/j.ijforecast.2011.03.008) in the _International Journal of Forecasting_ recently.
