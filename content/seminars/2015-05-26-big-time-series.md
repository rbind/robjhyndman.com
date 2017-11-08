---
author: Rob&nbsp;J&nbsp;Hyndman
date: 2015-05-26 03:51:03+00:00
excerpt: Talk given to a joint meeting of the Statistical Society of Australia (Victorian
  branch) and the Melbourne Data Science Meetup Group.
slug: big-time-series
title: Visualization of big time series data
tags:
- forecasting
- functional data
- graphics
- R
- seasonality
- software
- time series
---

Talk given to a joint meeting of the [Statistical Society of Australia (Victorian branch)](http://www.meetup.com/Statistical-Society-of-Australia-Victorian-Branch/events/221315445/) and the [Melbourne Data Science Meetup Group](http://www.meetup.com/Data-Science-Melbourne/events/220621482/).<!-- more -->





It is becoming increasingly common for organizations to collect very large amounts of data over time. Data visualization is essential for exploring and understanding structures and patterns, and to identify unusual observations. However, the sheer quantity of data available challenges current time series visualisation methods.

For example, Yahoo has banks of mail servers that are monitored over time. Many measurements on server performance are collected every hour for each of thousands of servers. We wish to identify servers that are behaving unusually.

Alternatively, we may have thousands of time series we wish to forecast, and we want to be able to identify the types of time series that are easy to forecast and those that are inherently challenging.

I will demonstrate an approach to this problem using a vector of features on each time series, measuring characteristics of the series. For example, the features may include lag correlation, strength of seasonality, spectral entropy, etc. Then we use a principal component decomposition on the features, and plot the first few principal components. This enables us to explore a lower dimensional space and discover interesting structure and unusual observations.

**Slides**


<iframe src="//www.slideshare.net/slideshow/embed_code/key/G2EWjeJA9hMEUP" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe> 

