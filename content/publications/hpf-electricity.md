---
author: Souhaib Ben Taieb, James W Taylor, Rob&nbsp;J&nbsp;Hyndman
date: 2017-06-13
slug: hpf-electricity
title: Hierarchical Probabilistic Forecasting of Electricity Demand with Smart Meter Data
kind: unpublished
tags:
- data science
- density estimation
- electricity
- forecasting
- hierarchical time series
file: HPFelectricity.pdf
---

Electricity smart meters record consumption, on a near real-time basis, at the level of individual commercial and residential properties. From this, a hierarchy can be constructed consisting of time series of demand at the smart meter level, and at various levels of aggregation, such as substations, cities and regions. Forecasts are needed at each level to support the efficient and reliable management of consumption. A limitation of previous research in this area is that it considered only deterministic prediction. To enable improved decision-making, we introduce an algorithm for producing a probability density forecast for each series within a large-scale hierarchy. The resulting forecasts are coherent in the sense that the forecast distribution of each aggregate series is equal to the convolution of the forecast distributions of the corresponding disaggregate series. Our algorithm has the advantage of synthesizing information from different levels in the hierarchy through forecast combination. Distributional assumptions are not required, and dependencies between forecast distributions are imposed through the use of empirical copulas. Scalability to large hierarchies is enabled by decomposing the problem into multiple lower-dimension sub-problems. Results for UK electricity smart meter data show performance gains for our method when compared to benchmarks.

