---
date: 2019-08-21
title: "Forecasting is not prophecy: dealing with high-dimensional probabilistic forecasts in practice"
slug: isi_prophecy
link: https://github.com/robjhyndman/ISI_talk_2019/raw/master/ISI_Hyndman_2019.pdf
---

## Invited talk for ISI-WSC 2019 in Kuala Lumpur

Many large organizations need to forecast huge numbers of related time series every week. Manufacturing companies forecast product demand to plan their supply chains; call centres forecast call volume to inform staff scheduling; technology companies forecast web traffic to maintain service levels; energy companies forecast electricity demand to prevent blackouts. In each case, what is required is a high-dimensional probabilistic forecast describing multivariate quantiles of the uncertain future, not a vector of point forecasts.

This raises several difficulties:

  1. it is analytically and computationally challenging to produce probabilistic forecasts for very high-dimensional time series;
  2. users find multivariate probability distributions difficult to use and interpret;
  3. the predictive accuracy of a high-dimensional probability distribution is not easy to measure.

I will discuss these problems and how they can be tackled.

R packages available at [tidyverts.org](http://tidyverts.org).
