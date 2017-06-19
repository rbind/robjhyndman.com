---
author: Rob&nbsp;J&nbsp;Hyndman
date: 2017-06-22
slug: isea2017
title: 'Probabilistic outlier detection and visualization of smart metre data'
tags:
- electricity demand
- R
- time series
- clustering
speakerdeck: c59584d49a9c495bbac79badc58b6edc
---

**Talk to be given at *International Symposium on Energy Analytics* (22-23 June 2017), Cairns, Australia.**

Standard time series analysis and visualization tools fail on smart metre data due to the sheer volume of available data (both in the time dimension and due to the large numbers of smart metres providing data). In addition, smart metre data is often messy, with missing observations, periods where some metres are offline, periods of relatively constant low level energy usage, occasional days of unusually high demand, and so on.

We introduce some new tools for exploring large collections of smart metre data based on the probability distribution of demand for each household, as it varies by the time of day and day of the week.

We are particularly interested in clustering households into groups with similar probability demand distributions, and in identifying households with unusual demand distributions. It is also of interest to estimate a typical household distribution.

Our approach involves computing the pairwise Jensen-Shannon distances between household probability distributions. Then we show that a kernel density estimate can be constructed on the distribution of distances, allowing us to cluster similar households, and find unusual households.

