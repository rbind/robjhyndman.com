---
author: Rob&nbsp;J&nbsp;Hyndman
comments: false
date: 2015-06-29 23:01:12+00:00
slug: banff2015
title: Exploring the feature space of large collections of time series
wordpress_id: 3206
slideshare: l6DoBXdZig8ZoM
---

### **Work­shop on Fron­tiers in Func­tional Data Analy­sis**


Banff, Canada.



It is becoming increasingly common for organizations to collect very large amounts of data over time. Data visualization is essential for exploring and understanding structures and patterns, and to identify unusual observations. However, the sheer quantity of data available challenges current time series visualisation methods.

For example, Yahoo has banks of mail servers that are monitored over time. Many measurements on server performance are collected every hour for each of thousands of servers. We wish to identify servers that are behaving unusually.

Alternatively, we may have thousands of time series we wish to forecast, and we want to be able to identify the types of time series that are easy to forecast and those that are inherently challenging.

I will demonstrate a functional data approach to this problem using a vector of features on each time series, measuring characteristics of the series. For example, the features may include lag correlation, strength of seasonality, spectral entropy, etc. Then we use a principal component decomposition on the features, and plot the first few principal components. This enables us to explore a lower dimensional space and discover interesting structure and unusual observations.







**[Video](http://www.birs.ca/events/2015/5-day-workshops/15w5096/videos/watch/201506301041-Hyndman.html)**
