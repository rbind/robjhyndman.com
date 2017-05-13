---
author: robjhyndman
comments: true
date: 2014-05-23 13:32:32+00:00

link: https://robjhyndman.com/hyndsight/structural-breaks/
slug: structural-breaks
title: Structural breaks
wordpress_id: 2749
categories:
- econometrics
- forecasting
- statistics
---

I'm tired of reading about tests for structural breaks and here's why.

A structural break occurs when we see a sudden change in a time series or a relationship between two time series. Econometricians love papers on structural breaks, and apparently believe in them. Personally, I tend to take a different view of the world. I think a more realistic view is that most things change slowly over time, and only occasionally with sudden discontinuous change.<!-- more -->

I do a lot of work on mortality time series, and in that context structural breaks do occur when there are wars and epidemics. But the rest of the time I expect the rates to change in a more evolutionary manner. In economics, a structural break might occur when there is a war, or a major change in government policy, or some equally sudden event. But that is not very often, and we know about it when it happens. We don't need to test if there was a structural break in 1945 -- there was, because it was the end of World War 2.

In some circumstances, a structural break test makes good sense. For example, I’ve used them when looking at [time series of satellite images of forests](/publications/bfast1/), and trying to identify when forests might have been cleared. It makes sense to think that the images are constant and stable over time, but with sudden changes when the bulldozers move in. There are no records of when parts of the forests were illicitly cleared, so we used a statistical test to try to identify the likely times when these genuine structural breaks occurred.

But I think econometricians often tend to misapply these tests — they look for structural breaks in everything when there is no reason to think that anything sudden has happened. Instead, there is evolutionary change, which is mis-identified as structural change due to the use of these tests.

When people test for structural breaks, they assume that the supposed model (the null hypothesis) is correct unless they find evidence otherwise (a significant result), and then they conclude that the lack of fit is due to a structural break. The tests are sensitive to such breaks. However, the tests will also be significant under other variations from the assumed model. When a structural break is identified, all we can say with confidence is that the assumed model is probably incorrect. Whether or not we wish to identify the significant result as a structural break is a different issue, and the model says nothing about that. This is a general issue with statistical tests — they can only tell you what is probably not true, and never what is true.

If structural breaks are identified, the onus is on the analyst to then specify what happened. Just saying "something changed here" is not enough. Without a mechanism to cause the structural break, nothing useful has been demonstrated except that the null hypothesis is probably not true.  (For the frequentist pedants out there, read "that the data are unlikely to have arisen from the model defined by the null hypothesis".)

A more realistic model is one with time varying parameters. A genuine structural break can still be accommodated by allowing the parameters to change rapidly at the time of the event. Such models also provide much better forecasts, because they better approximate the underlying data generating mechanism.
