---
author: Jeremy Forbes, Dianne Cook, Rob&nbsp;J&nbsp;Hyndman
date: 2020-01-05
slug: elections
title: "Spatial modelling of the two-party preferred vote in Australian federal elections: 2001-2016"
kind: article
citation: "<em>Australian and New Zealand Journal of Statistics</em>, to appear"
tags:
- data science
- R
- spatial data
link: https://github.com/jforbes14/eechidna-paper/raw/master/anzjs_elections.pdf
---

We examine the relationships between electoral socio-demographic characteristics and two-party preference in the six Australian federal elections held between 2001 to 2016. Socio-demographic information is derived from the Australian Census, which occurs every five years. Since a Census is not directly available for each election, spatio-temporal imputation is employed to estimate Census data for the electorates at the time of each election. This accounts for both spatial and temporal changes in electoral characteristics between Censuses. To capture any spatial heterogeneity, a spatial error model is estimated for each election, which incorporates a spatially structured random effect vector that can be thought of as the unobserved political climate in each electorate. Over time, the impact of most socio-demographic characteristics that affect electoral two-party preference do not vary, with industry of work, incomes, household mobility and de facto relationships having strong effects in each of the six elections. Education and unemployment are amongst those that have varying effects. It is also found that between 2004 and 2013, the spatial effect was insignificant, meaning that electorates voted effectively independently. All data featured in this study has been contributed to the [`eechidna` `R`](https://github.com/ropenscilabs/eechidna) package (available on [CRAN](http://cran.r-project.org/package=eechidna)).