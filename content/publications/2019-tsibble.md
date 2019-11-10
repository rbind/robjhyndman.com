---
title: "A new tidy data structure to support exploration and modeling of temporal data"
author: Earo Wang, Di Cook and Rob&nbsp;J&nbsp;Hyndman
date: 2020-01-02
slug: tsibble
kind: article
citation: "<em>Journal of Computational & Graphical Statistics</em>, to appear"
tags:
  - data science
  - time series
link: http://pdf.earo.me/tsibble.pdf
---

Mining temporal data for information is often inhibited by a multitude of formats: irregular or multiple time intervals, point events that need aggregating, multiple observational units or repeated measurements on multiple individuals, and heterogeneous data types. On the other hand, the software supporting time series modeling and forecasting, makes strict assumptions on the data to be provided, typically requiring a matrix of numeric data with implicit time indexes. Going from raw data to model-ready data is painful. This work presents a cohesive and conceptual framework for organizing and manipulating temporal data, which in turn flows into visualization, modeling and forecasting routines. Tidy data principles are extended to temporal data by: (1)&nbsp;mapping the semantics of a dataset into its physical layout; (2)&nbsp;including an explicitly declared index variable representing time; (3)&nbsp;incorporating a "key" comprising single or multiple variables to uniquely identify units over time. This tidy data representation most naturally supports thinking of operations on the data as building blocks, forming part of a "data pipeline" in time-based contexts. A sound data pipeline facilitates a fluent workflow for analyzing temporal data. The infrastructure of tidy temporal data has been implemented in the R package [**tsibble**](http://tsibble.tidyverts.org).
