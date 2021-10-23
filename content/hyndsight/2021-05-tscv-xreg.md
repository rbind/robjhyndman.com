---
author: robjhyndman
comments: true
date: 2021-05-16
title: "Time series cross-validation using fable"
slug: tscv-fable
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



[Time series cross-validation](https://otexts.com/fpp3/tscv.html)  is handled in the `fable` package using the `stretch_tsibble()` function to generate the data folds. In this post I will give two examples of how to use it, one without covariates and one with covariates.

## Quarterly Australian beer production

Here is a simple example using quarterly Australian beer production from 1956 Q1 to 2010 Q2. First we create a data object containing many training sets starting with 3 years (12 observations), and adding one quarter at a time until all data are included.


```r
library(fpp3)
beer <- aus_production %>%
  select(Beer) %>%
  stretch_tsibble(.init = 12, .step=1)
beer
```

```
## # A tsibble: 23,805 x 3 [1Q]
## # Key:       .id [207]
##     Beer Quarter   .id
##    <dbl>   <qtr> <int>
##  1   284 1956 Q1     1
##  2   213 1956 Q2     1
##  3   227 1956 Q3     1
##  4   308 1956 Q4     1
##  5   262 1957 Q1     1
##  6   228 1957 Q2     1
##  7   236 1957 Q3     1
##  8   320 1957 Q4     1
##  9   272 1958 Q1     1
## 10   233 1958 Q2     1
## # … with 23,795 more rows
```

This gives 207 training sets of increasing size. We fit an ETS model to each training set and produce one year of forecasts from each model. Because I want to compute RMSE for each forecast horizon, I will add the horizon `h` to the resulting object.


```r
fc <- beer %>%
  model(ETS(Beer)) %>%
  forecast(h = "1 year") %>%
  group_by(.id) %>%
  mutate(h = row_number()) %>%
  ungroup()
```

Finally, we compare the forecasts against the actual values and average over the folds.


```r
fc %>%
  accuracy(aus_production, by=c("h",".model")) %>%
  select(h, RMSE)
```

```
## # A tibble: 4 × 2
##       h  RMSE
##   <int> <dbl>
## 1     1  17.1
## 2     2  16.7
## 3     3  18.1
## 4     4  19.2
```

Forecasts of 1 and 2 quarters ahead both have about the same accuracy here, but then the error increases for horizons 3 and 4.

## Insurance quotes with TV advertisements

Things are a little more complicated when we want to use covariates in the model. Here is an example of monthly quotations issued by a US insurance company modelled as a function of the TV advertising expenditure in the same month.

The first step is the same, where we stretch the tsibble. This time we will start with one year of data.


```r
stretch <- insurance %>%
  stretch_tsibble(.step=1, .init=12)
stretch
```

```
## # A tsibble: 754 x 4 [1M]
## # Key:       .id [29]
##       Month Quotes TVadverts   .id
##       <mth>  <dbl>     <dbl> <int>
##  1 2002 Jan   13.0      7.21     1
##  2 2002 Feb   15.4      9.44     1
##  3 2002 Mar   13.2      7.53     1
##  4 2002 Apr   13.0      7.21     1
##  5 2002 May   15.4      9.44     1
##  6 2002 Jun   11.7      6.42     1
##  7 2002 Jul   10.1      5.81     1
##  8 2002 Aug   10.8      6.20     1
##  9 2002 Sep   13.3      7.59     1
## 10 2002 Oct   14.6      8.00     1
## # … with 744 more rows
```

Next we fit a regression model with AR(1) errors to each fold.


```r
fit <- stretch %>%
  model(ARIMA(Quotes ~ 1 + pdq(1,0,0) + TVadverts))
```

Before we forecast, we need to provide the advertising expenditure for the future periods. We will forecast up to 3 steps ahead, so the test data needs to have 3 observations per fold.


```r
test <- new_data(stretch, n=3) %>%
  # Add in covariates from corresponding month
  left_join(insurance, by="Month")
test
```

```
## # A tsibble: 87 x 4 [1M]
## # Key:       .id [29]
##       Month   .id Quotes TVadverts
##       <mth> <int>  <dbl>     <dbl>
##  1 2003 Jan     1   17.0      9.53
##  2 2003 Feb     1   16.9      9.39
##  3 2003 Mar     1   16.5      8.92
##  4 2003 Feb     2   16.9      9.39
##  5 2003 Mar     2   16.5      8.92
##  6 2003 Apr     2   15.3      8.37
##  7 2003 Mar     3   16.5      8.92
##  8 2003 Apr     3   15.3      8.37
##  9 2003 May     3   15.9      9.84
## 10 2003 Apr     4   15.3      8.37
## # … with 77 more rows
```

The actual value in each month is also included, but that will be ignored when forecasting.


```r
fc <- forecast(fit, new_data = test) %>%
  group_by(.id) %>%
  mutate(h = row_number()) %>%
  ungroup()
```

Finally, we can compare the forecasts against the actual values, averaged across each forecast horizon.


```r
fc %>% accuracy(insurance, by=c("h",".model")) %>%
  select(h, RMSE)
```

```
## # A tibble: 3 × 2
##       h  RMSE
##   <int> <dbl>
## 1     1 0.761
## 2     2 1.20 
## 3     3 1.49
```
