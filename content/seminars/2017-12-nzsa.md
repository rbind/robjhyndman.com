---
author: Rob&nbsp;J&nbsp;Hyndman
date: 2017-12-13
slug: nzsa2017
mathjax: true
title: 'Probabilistic outlier detection and visualization of smart metre data'
tags:
- electricity demand
- R
- time series
- clustering
speakerdeck: 240880464fcb4ef587faa2d17e0efba5
filename: "NZSA-Hyndman.pdf"
---

**Talk given at meeting of *New Zealand Statistical Association* and *International Association for Statistical Computing* (11-14 December 2017), Auckland, New Zealand.**

It is always a good idea to plot your data before fitting any models, making any predictions, or drawing any conclusions. But how do you actually plot data on thousands of smart meters, each comprising thousands of observations over time? We cannot simply produce time plots of the demand recorded at each meter, due to the sheer volume of data involved.

I will propose an approach in which each long series of demand data is converted to a single two-dimensional point that can be plotted in a simple scatterplot. In that way, all the meters can be seen in the scatterplot; so outliers can be detected, clustering can be observed, and any other interesting structure can be examined. To illustrate, I will use data collected during a smart metering trial conducted by the Commission for Energy Regulation (CER) in Ireland.

First we estimate the demand percentiles for each half hour of the week, giving us 336 probability distributions per household. Then, we compute the distances between pairs of households using the sum of Jensen--Shannon distances.

From these pairwise distances, we can compute a measure of the
"typicality" of a specific household, by seeing how many similar
houses are nearby. If there are many households with similar probability distributions, the typicality measure will be high. But if there are few similar households, the typicality measure will be low. This gives us a way of finding anomalies in the data set --- they are the smart meters corresponding to the least typical households.

The pairwise distances between households can also be used to create a plot of all households together. Each of the household distributions can be thought of as a vector in $K$-dimensional space where $K=7\times48\times99 = 33,264$. To easily visualize these, we need to project them onto a two-dimensional space. I propose using Laplacian eigenmaps which attempt to preserve the smallest distances --- so the most similar points in $K$-dimensional space are as close as possible in the two-dimensional space.

This way of plotting the data easily allows us to see the anomalies, to identify any clusters of observations in the data, and to examine any other structure that might exist.
