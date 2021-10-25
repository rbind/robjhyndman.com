---
author: Souhaib Ben Taieb, James W Taylor, Rob&nbsp;J&nbsp;Hyndman
date: 2021-01-01
slug: hpf-electricity
title: Hierarchical Probabilistic Forecasting of Electricity Demand with Smart Meter Data
kind: article
citation: <em>J American Statistical Association</em>, <b>116</b>(533), 27-43
tags:
- data science
- density estimation
- electricity
- forecasting
- hierarchical time series
link: https://souhaib-bentaieb.com/papers/2020_jasa_hts_prob.pdf
doi: 10.1080/01621459.2020.1736081
github: bsouhaib/prob-hts
---

Decisions regarding the supply of electricity across a power grid must take into consideration the inherent uncertainty in demand. Optimal decision-making requires probabilistic forecasts for demand in a hierarchy with various levels of aggregation, such as substations, cities and regions. The forecasts should be coherent in the sense that the forecast of the aggregated series should equal the sum of the forecasts of the corresponding disaggregated series. Coherency is essential, since the allocation of electricity at one level of the hierarchy relies on the appropriate amount being provided from the previous level. We introduce a new probabilistic forecasting method for a large hierarchy based on UK residential smart meter data. We find our method provides coherent and accurate probabilistic forecasts, as a result of an effective forecast combination. Furthermore, by avoiding distributional assumptions, we find that our method captures the variety of distributions in the smart meter hierarchy. Finally, the results confirm that, to ensure coherency in our large-scale hierarchy, it is sufficient to model a set of lower-dimension dependencies, rather than modeling the entire joint distribution of all series in the hierarchy. In achieving coherent and accurate hierarchical probabilistic forecasts, this work contributes to improved decision-making for smart grids.

