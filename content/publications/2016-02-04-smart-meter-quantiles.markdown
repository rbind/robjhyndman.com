---
author: Souhaib Ben Taieb, Raphael Huser, Rob&nbsp;J&nbsp;Hyndman and Marc G Genton
Status: Published
comments: false
date: 2016-02-04 04:19:37+00:00
slug: smart-meter-quantiles
title: Forecasting uncertainty in electricity smart meter data by boosting additive
  quantile regression
wordpress_id: 3488
kind:
 article
tags:
- boosting
- data science
- electricity
- forecasting
citation: <em>IEEE Transactions on Smart Grid</em> <b>7</b>(5), 2448-2455
file: smart-meter-quantiles.pdf
doi: 10.1109/TSG.2016.2527820
---



Smart electricity meters are currently deployed in millions of households to collect detailed individual electricity consumption data. Compared to traditional electricity data based on aggregated consumption, smart meter data are much more volatile and less predictable. There is a need within the energy industry for probabilistic forecasts of household electricity consumption to quantify the uncertainty of future electricity demand, in order to undertake appropriate planning of generation and distribution. We propose a probabilistic forecasting method where a different quantile regression model is estimated for each quantile of the future distribution. Each model is estimated by boosting additive quantile regression which enjoys many useful properties including flexibility, interpretability and automatic variable selection. We compare our approach with three benchmark methods on both aggregated and disaggregated scales using a smart meter dataset collected from 3639 households in Ireland at 30-minute intervals over a period of 1.5 years. The empirical results demonstrate that our approach based on quantile regression provides better forecast accuracy for disaggregated demand while the traditional approach based on a normality assumption provides better forecasts for aggregated demand. These results are particularly useful since more energy data will become available at the disaggregated level in the future.

