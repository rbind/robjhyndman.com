---
author: Souhaib Ben Taieb, Rob&nbsp;J&nbsp;Hyndman
Status: Published
comments: false
date: 2014-04-01 04:40:12+00:00
slug: kaggleloadforecasting
title: A gradient boosting approach to the Kaggle load forecasting competition
wordpress_id: 2252
kind:
 article
tags:
- boosting
- electricity
- forecasting
doi: 10.1016/j.ijforecast.2013.07.005
citation: <em>International Journal of Forecasting</em> <b>30</b>(2), 382–394
file: kaggle-competition.pdf
---

We describe and analyse the approach used by Team TinTin (Souhaib Ben Taieb and Rob&nbsp;J&nbsp;Hyndman) in the Load Forecasting track of the Kaggle Global Energy Forecasting Competition 2012. The competition involved a hierarchical load forecasting problem for a US utility with 20 geographical zones. The available data consisted of the hourly loads for the 20 zones and hourly temperatures from 11 weather stations, for four and a half years. For each zone, the hourly electricity load for nine different weeks needed to be predicted without having the location of zones or stations. We used separate models for each hourly period, with component-wise gradient boosting to estimate each model using univariate penalised regression splines as base learners. The models allow for the electricity demand to change with time-of-year, day-of-week, time-of-day, and on public holidays, with the main predictors being current and past temperatures as well as past demand. Team TinTin ranked fifth out of 105 participating teams.

**Keywords:** Short-term load forecasting; multi-step forecasting; additive models; gradient boosting; machine learning; Kaggle competition



[
