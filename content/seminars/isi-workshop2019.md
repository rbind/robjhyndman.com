---
title: "High-dimensional time series analysis"
slug: isi2019workshop
aliases:
  - /isi2019workshop/
  - /hdtsa/
author: "Rob J Hyndman"
date: 2019-08-17
---

## Venue

[Sasana Kijang, Bank Negara Malaysia, Kuala Lumpur](http://bit.ly/2DJ3Wit)

## Presenters

 * [Rob J Hyndman](https://robjhyndman.com)
 * [Mitchell O'Hara-Wild](https://mitchelloharawild.com)

## Course description

It is becoming increasingly common for organizations to collect huge amounts of data over time, and existing time series analysis tools are not always suitable to handle the scale and type of data collected. In this workshop, we will look at some new methods that have been developed to handle the analysis of large collections of time series.

We will explore feature-based visualizations and interactive visualizations, in order to explore time series data in high dimensions. A similar feature-based approach can be used to identify anomalous time series within a collection of time series. Finally, we  will discuss how fast automatic forecasting algorithms, along with sparse forecast reconciliation, can allow millions of time series to be forecast in a relatively short time

## Program
*(approximate times)*

* 09:00. *Welcome*
* 09:15. **1. Tidy time series analysis using tsibbles** [[Slides](https://github.com/robjhyndman/ISI_Workshop_2019/raw/master/1_tsibbles/tsibbles.pdf)]
* 10:15. **2. Visualization of high-dimensional time series** [[Slides](https://github.com/robjhyndman/ISI_Workshop_2019/raw/master/2_graphics/graphics.pdf)]
* 11:30. **3. A feature-based approach to time series analysis** [[Slides](https://github.com/robjhyndman/ISI_Workshop_2019/raw/master/3_feasts/feasts.pdf)]
* 12:30. *Lunch*
* 13:30. **4. Automatic forecasting algorithms** [[Slides](https://github.com/robjhyndman/ISI_Workshop_2019/raw/master/4_fable/fable.pdf)]
* 15:30. **5. Optimal forecast reconciliation** [[Slides](https://github.com/robjhyndman/ISI_Workshop_2019/raw/master/5_reconciliation/reconciliation.pdf)]
* 16:45. *Conclusion*

## Prerequisites

Participants should be familiar with the use of R, at least to the point where they can fit a linear regression model, and work with data frames.

Please bring your own laptop with a recent version of R and RStudio installed. The following code will install the main packages needed for the workshop.

```r
install.packages("tidyverse")
install.packages("tsibble")
install.packages("tsibbledata")
install.packages("fabletools")
install.packages("feasts", repos = "https://tidyverts.org")
install.packages("fable", repos = "https://tidyverts.org")
```

## Lab Sessions

### Lab Session 1

 * Download [`tourism.xlsx`](http://robjhyndman.com/data/tourism.xlsx) from [`http://robjhyndman.com/data/tourism.xlsx`](http://robjhyndman.com/data/tourism.xlsx), and read it into R using `read_excel()` from the `readxl` package.
 * Create a tsibble which is identical to the `tourism` tsibble from the `tsibble` package.
 * Find what combination of `Region` and `Purpose` had the maximum number of overnight trips on average.
 * Create a new tsibble which combines the Purposes and Regions, and just has total trips by State.


### Lab Session 2

- Create time plots of the following time series: `Beer` from `aus_production`, `Lynx` from `pelt`, `Close` from `gafa_stock`
- Use `help()` to find out about the data in each series.
- For the last plot, modify the axis labels and title.

### Lab Session 3

Look at the quarterly tourism data for the Snowy Mountains

   ```r
   snowy <- filter(tourism, Region == "Snowy Mountains")
   ```

  - Use `autoplot()`, `gg_season()` and `gg_subseries()` to explore the data.
  - What do you learn?

### Lab Session 4

Repeat the decomposition using

   ```r
   holidays %>%
     STL(Trips ~ season(window=7) + trend(window=11)) %>%
     autoplot()
  ```

What happens as you change `season(window = ???)` and `trend(window = ???)`?

### Lab Session 5

 * Use ``GGally::ggpairs()`` to look at the relationships between the STL-based features. You might wish to change `seasonal_peak_year` and `seasonal_trough_year` to factors.
 * Which is the peak quarter for holidays in each state?


### Lab Session 6

* Use a feature-based approach to look for outlying series in `PBS`.
* What is unusual about these series?


### Lab Session 7

Find an ETS model for the Gas data from `aus_production`.

  * Why is multiplicative seasonality necessary here?
  * Experiment with making the trend damped.

### Lab Session 8

For the United States GDP data (from `global_economy`):

 * Fit a suitable ARIMA model for the logged data.
 * Produce forecasts of your fitted model. Do the forecasts look reasonable?

### Lab Session 9

For the Australian tourism data (from `tourism`):

 * Fit a suitable ARIMA model for all data.
 * Produce forecasts of your fitted models.
 * Check the forecasts for the "Snowy Mountains" and "Melbourne" regions. Do they look reasonable?

### Lab Session 10

* Prepare aggregations of the PBS data by Concession, Type, and ATC1.
* Use forecast reconciliation with the PBS data, using ETS, ARIMA and SNAIVE models, applied to all but the last 3 years of data.
* Which type of model works best?
* Does the reconciliation improve the forecast accuracy?
* Why doesn't the reconcililation make any difference to the SNAIVE forecasts?

### Lab solutions

[Here is my code produced during the workshop.](https://robjhyndman.com/files/labs.R)
