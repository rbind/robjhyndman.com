---
author: robjhyndman
comments: true
date: 2013-12-22 06:21:24+00:00

link: https://robjhyndman.com/hyndsight/judgmental-forecasting-experiment/
slug: judgmental-forecasting-experiment
title: Judgmental forecasting experiment
wordpress_id: 2341
categories:
- forecasting
- R
- statistics
---

The [Centre for Forecasting at Lancaster University](http://www.lancaster.ac.uk/lums/forecasting/) is conducting some research on judgmental forecasting and model selection. They hope to compare the performance of judgmental model selection with statistical model selection, in order to learn how to best design forecasting support systems. They would like forecasting students, practitioners and researchers to participate, and are offering £50 Amazon Gift Cards as prizes. Here is a brief description from [Fotios Petropoulos](http://www.lums.lancs.ac.uk/profiles/fotios-petropoulos/):<!-- more -->



>We are inviting you to participate in a web-based judgmental forecasting exercise. You are asked to select the best model, based on your judgment, for 32 time series.

>The exercise consists of four rounds. Each round will contain 8 series and will be followed by a short questionnaire, while different types of information will be provided on top of the estimated forecasts for the future periods. Detailed instructions will be given prior to each round. You may complete the exercise at once (preferred option) or in multiple instances. Your progress will be saved and you may resume at your convenience.

>At the end of the exercise you will be provided with your score. Your final performance will be calculated based on the rank of the models corresponding to your choices, according to the actual (out-of-sample) performance of each model. The participants within the Top-20 will be awarded with Amazon Gift Cards (£50 each).

>You can access the web-based exercise here: [www.modelselection.eu](http://www.modelselection.eu)

>Thank you in advance for your participation!



I often challenge my own forecasting students to try to beat the automated forecasting provided by the `ets()` and `auto.arima()` functions in the [forecast package for R](http://github.com/robjhyndman/forecast/).  So I'm interested to see the results of this research.
