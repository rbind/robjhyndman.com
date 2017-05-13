---
author: robjhyndman
comments: true
date: 2010-06-11 03:18:34+00:00

link: https://robjhyndman.com/hyndsight/use-fake-data-and-real-data/
slug: use-fake-data-and-real-data
title: Use fake data and real data
wordpress_id: 821
categories:
- computing
- forecasting
- IJF
---

When developing new statistical methods, it is very useful to test them on both fake data (i.e., simulations) and real data.

Testing on fake data is useful because then you know the "true" answer and can check the procedure under ideal conditions. If your method doesn't work when the data are designed for the task, it is unlikely to work in real conditions. Fake data also enables you to test the robustness of your method when the conditions aren't perfect -- for example, try adding some nasty outliers and see if the method still works. With fake data, you can generate as many samples as you need, thus ensuring that what you see is real (statistically significant) rather than just an odd example.

A further advantage of fake data is that anyone can reproduce your work and check (or extend) your results. Sometimes real data cannot be distributed due to restrictions imposed by the owner of the data. But there are never restrictions on fake data. You just have to make sure you explain the data generating process sufficiently clearly that other people can replicate what you've done.

Testing on real data is useful because it gives some indication of whether your method will be useful in reality and not just in theory.

Yeasmin Khandakar and I once developed a neat method for selecting the order of an ARIMA model which worked wonderfully well on fake data that were generated from ARIMA processes, but failed on any real data. The problem seemed to be that it was particularly sensitive to model mis-specification. So when the data had any features that were not typical of ARIMA processes, the method failed. No real data are genuinely ARIMA processes, and so the method is not particularly useful (and has never been published).

On the other hand, damped exponential smoothing works better than you would expect, even on data that come from processes for which damped exponential smoothing is far from theoretically optimal. In chapter 7 of my [exponential smoothing book](http://www.exponentialsmoothing.net), we showed (with real data) that using a damped exponential smoothing model for all series gives results that are almost as good as those obtained after a computationally intensive search for an optimal model over the entire model space.
