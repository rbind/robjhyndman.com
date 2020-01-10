---
author: Catherine&nbsp;Leigh, Sevvandi&nbsp;Kandanaarachchi, James&nbsp;M&nbsp;McGree, Rob&nbsp;J&nbsp;Hyndman, Omar&nbsp;Alsibai, Kerrie&nbsp;Mengersen, Erin&nbsp;E&nbsp;Peterson
date: 2019-08-23
slug: water-quality
title: Predicting sediment and nutrient concentrations from high-frequency water-quality data
kind: article
citation: "<em>PLoS ONE</em>, <b>14</b>(8): e0215503"
tags:
- data science
- time series
- environment
link: https://arxiv.org/abs/1810.12499
doi: 10.1371/journal.pone.0215503
---

Water-quality monitoring in rivers often focuses on the concentrations of sediments and nutrients, constituents that can smother biota and cause eutrophication. However, the physical and economic constraints of manual sampling prohibit data collection at the frequency required to adequately capture the variation in concentrations through time. Here, we developed models to predict total suspended solids (TSS) and oxidized nitrogen (NOx) concentrations based on high-frequency time series of turbidity, conductivity and river level data from in situ sensors in rivers flowing into the Great Barrier Reef lagoon. We fit generalized-linear mixed-effects models with continuous first-order autoregressive correlation structures to water-quality data collected by manual sampling at two freshwater sites and one estuarine site and used the fitted models to predict TSS and NOx from the in situ sensor data. These models described the temporal autocorrelation in the data and handled observations collected at irregular frequencies, characteristics typical of water-quality monitoring data. Turbidity proved a useful and generalizable surrogate of TSS, with high predictive ability in the estuarine and fresh water sites. Turbidity, conductivity and river level served as combined surrogates of NOx. However, the relationship between NOx and the covariates was more complex than that between TSS and turbidity, and consequently the ability to predict NOx was lower and less generalizable across sites than for TSS. Furthermore, prediction intervals tended to increase during events, for both TSS and NOx models, highlighting the need to include measures of uncertainty routinely in water-quality reporting. Our study also highlights that surrogate-based models used to predict sediments and nutrients need to better incorporate temporal components if variance estimates are to be unbiased and model inference meaningful. The transferability of models across sites, and potentially regions, will become increasingly important as organizations move to automated sensing for water-quality monitoring throughout catchments.
