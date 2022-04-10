---
author: robjhyndman
comments: true
date: 2022-02-23
title: "Monash time series forecasting repository"
slug: forecastingdata
output: 
  html_document:
    keep_md: true
mathjax: true
categories:
  - time series
  - R
  - forecasting
  - data science
---



The [Monash time series forecasting respository](https://forecastingdata.org) is a comprehensive collection of time series data made available in a convenient form to encourage empirical forecast evaluations. The repository includes the data from many forecasting competitions including the M1, M3, M4, NN5, tourism, and KDD cup 2018, as well as many other data sets from diverse applications. The [associated paper](https://robjhyndman.com/publications/monash-forecasting-data/) discusses the various data sets and their characteristics. Where a time series collection contains data with different observation frequencies, they are split into different data sets so that the series within each data set has the same frequency.

Some of these data sets have been made available in R packages previously, based on `ts` objects which worked ok for annual, quarterly and monthly data, but is not a good format for daily and sub-daily data.

The [`tsibbledata` package](https://tsibbledata.tidyverts.org) provides the function `monash_forecasting_respository()` to download the data and return it as a [`tsibble` object](https://tsibble.tidyverts.org/articles/intro-tsibble.html). These can be analysed and plotted using the [`feasts` package](https://feasts.tidyverts.org), and modelled and forecast using the [`fable` package](https://fable.tidyverts.org). It is convenient to simply load the `fpp3` package which will then load all the necessary packages.


```r
library(fpp3)
```

```
## ── Attaching packages ────────────────────────────────── fpp3 0.4.0.9000 ──
```

```
## ✓ tibble      3.1.6          ✓ tsibble     1.1.1     
## ✓ dplyr       1.0.8          ✓ tsibbledata 0.4.0.9000
## ✓ tidyr       1.2.0          ✓ feasts      0.2.2     
## ✓ lubridate   1.8.0          ✓ fable       0.3.1     
## ✓ ggplot2     3.3.5          ✓ fabletools  0.3.2
```

```
## ── Conflicts ──────────────────────────────────────────── fpp3_conflicts ──
## x lubridate::date()    masks base::date()
## x dplyr::filter()      masks stats::filter()
## x tsibble::intersect() masks base::intersect()
## x tsibble::interval()  masks lubridate::interval()
## x dplyr::lag()         masks stats::lag()
## x tsibble::setdiff()   masks base::setdiff()
## x tsibble::union()     masks base::union()
```

## M3 data

To download the M3 data, we need to know the unique zenodo identifiers for each data set. From the [forecastingdata.org](https://forecastingdata.org) page, find the M3 links (there are four, one for each observational frequency). For example, the Yearly link takes you to [https://zenodo.org/record/4656222](https://zenodo.org/record/4656222), so the Zenodo identifier for this data set is 4656222. Similarly, the Quarterly, Monthly and Other links have identifiers 4656262, 4656298 and 4656335 respectively. 


```r
m3_yearly <- monash_forecasting_repository(4656222)
m3_quarterly <- monash_forecasting_repository(4656262)
m3_monthly <- monash_forecasting_repository(4656298)
m3_other <- monash_forecasting_repository(4656335)
```

The first three data sets are stored with a date index, so they are read as daily data. Therefore we first need to convert them to yearly, quarterly and monthly data.


```r
m3_yearly <- m3_yearly %>%
  mutate(year = year(start_timestamp)) %>%
  as_tsibble(index=year) %>%
  select(-start_timestamp)
m3_quarterly <- m3_quarterly %>%
  mutate(quarter = yearquarter(start_timestamp)) %>%
  as_tsibble(index=quarter) %>%
  select(-start_timestamp)
m3_monthly <- m3_monthly %>%
  mutate(month = yearmonth(start_timestamp)) %>%
  as_tsibble(index=month) %>%
  select(-start_timestamp)
```

The resulting monthly data set is shown below.


```r
m3_monthly
```

```
## # A tsibble: 167,562 x 3 [1M]
## # Key:       series_name [1,428]
##    series_name value    month
##    <chr>       <dbl>    <mth>
##  1 T1           2640 1990 Jan
##  2 T1           2640 1990 Feb
##  3 T1           2160 1990 Mar
##  4 T1           4200 1990 Apr
##  5 T1           3360 1990 May
##  6 T1           2400 1990 Jun
##  7 T1           3600 1990 Jul
##  8 T1           1920 1990 Aug
##  9 T1           4200 1990 Sep
## 10 T1           4560 1990 Oct
## # … with 167,552 more rows
```

The series names are `T1`, `T2`, ... The M3 data included both training and test data. These have been combined in this data set.

## Australian electricity demand data

This data set contains total half-hourly electricity demand by state from 1 January 2002 to 1 April 2015, for five states of Australia: New South Wales, Queensland, South Australia, Tasmania, and Victoria. A subset of this data (one state and only three years) is provided as `tsibbledata::vic_elec`.


```r
aus_elec <- monash_forecasting_repository(4659727)
aus_elec
```

```
## # A tsibble: 1,155,264 x 4 [30m] <UTC>
## # Key:       series_name, state [5]
##    series_name state start_timestamp     value
##    <chr>       <chr> <dttm>              <dbl>
##  1 T1          NSW   2002-01-01 00:00:00 5714.
##  2 T1          NSW   2002-01-01 00:30:00 5360.
##  3 T1          NSW   2002-01-01 01:00:00 5015.
##  4 T1          NSW   2002-01-01 01:30:00 4603.
##  5 T1          NSW   2002-01-01 02:00:00 4285.
##  6 T1          NSW   2002-01-01 02:30:00 4075.
##  7 T1          NSW   2002-01-01 03:00:00 3943.
##  8 T1          NSW   2002-01-01 03:30:00 3884.
##  9 T1          NSW   2002-01-01 04:00:00 3878.
## 10 T1          NSW   2002-01-01 04:30:00 3838.
## # … with 1,155,254 more rows
```


```r
aus_elec %>% 
  filter(state=="VIC") %>%
  autoplot(value) +
  labs(x = "Time", y="Electricity demand (MWh)")
```

![](2022-02-forecastdata_files/figure-html/auselec_plot-1.png)<!-- -->

## Forecasting benchmarks

We also provide some [accuracy measures](https://forecastingdata.org/#results) of the performance of 13 baseline forecasting methods applied to the data sets in the repository. This makes it easy for anyone proposing a new method to compare against some standard existing methods, without having to do all the calculations themselves.

## What about Python?

The data can be loaded as a Pandas dataframe by following [this example in the github repository](https://github.com/rakshitha123/TSForecasting/blob/master/utils/data_loader.R). Download the `.tsf` files as required from Zenodo and put them into `tsf_data` folder.
