---
date: 2018-06-24
slug: benchmark-combination
title: "A forecast ensemble benchmark"
mathjax: true
categories:
  - forecasting
  - time series
  - R
---




[Forecasting benchmarks](/hyndsight/benchmarks) are very important when testing new forecasting methods, to see how well they perform against some simple alternatives. Every week I get sent papers proposing new forecasting methods that fail to do better than even the simplest benchmark. They are rejected without review.

[Typical benchmarks](https://otexts.org/fpp2/simple-methods.html) include the naïve method (especially for finance and economic data), the seasonal naïve method (for seasonal data), an automatically selected [ETS model](https://otexts.org/fpp2/ets.html), and an automatically selected [ARIMA model](https://otexts.org/fpp2/arima.html). These are easily calculated using the `naive()`, `snaive()`, `ets()` and `auto.arima()` functions in the forecast package. Note that the seasonal naïve method is equivalent to the naïve method for annual data (or any other data with frequency=1).

Another benchmark worth considering is the Theta method which did very well in the M3 forecasting competition. The `thetaf()` function provides a convenient implementation.

At the [International Symposium on Forecasting](http://isf.forecasters.org) held in Boulder last week, [Srihari Jaganathan](https://forecasters.org/blog/2017/01/30/member-profile-srihari-jaganathan/) proposed that a simple average of these forecasts should be used as a standard forecast combination (or ensemble) benchmark. This is a good idea as it is very easy to do, relatively fast to compute, and often provides an excellent forecast. (For other combinations, the [forecastHybrid](https://cran.r-project.org/package=forecastHybrid) package might be useful.)

In this post, I will test various subsets of the four benchmark methods mentioned above to see which performs best. Here is some R code to compute all possible subset ensembles from these four benchmarks. That gives 15 ($=2^4-1$) possible combinations.

The code is general enough that it is easy to add additional methods if anyone wants to include other possible benchmark methods. Just name them with a unique letter in the following function; no other code in this post needs to be changed.


```r
benchmarks <- function(y, h) {
  require(forecast)
  # Compute four benchmark methods
  fcasts <- rbind(
    N = snaive(y, h)$mean,
    E = forecast(ets(y), h)$mean,
    A = forecast(auto.arima(y), h)$mean,
    T = thetaf(y, h)$mean)
  colnames(fcasts) <- seq(h)
  method_names <- rownames(fcasts)
  # Compute all possible combinations
  method_choice <- rep(list(0:1), length(method_names))
  names(method_choice) <- method_names
  combinations <- expand.grid(method_choice) %>% tail(-1) %>% as.matrix()
  # Construct names for all combinations
  for (i in seq(NROW(combinations))) {
    rownames(combinations)[i] <- paste0(method_names[which(combinations[i, ] > 0)],
      collapse = "")
  }
  # Compute combination weights
  combinations <- sweep(combinations, 1, rowSums(combinations), FUN = "/")
  # Compute combinations of forecasts
  return(combinations %*% fcasts)
}
```

Let's try it out on the M3 competition data.


```r
library(Mcomp)
library(tidyverse)
# Compute "symmetric" percentage errors and scaled errors
errors <- map(M3, function(u) {
  train <- u$x
  test <- u$xx
  f <- benchmarks(train, u$h)
  error <- -sweep(f, 2, test)
  pcerror <- (200 * abs(error) / sweep(abs(f), 2, abs(test), FUN = "+")) %>%
    as_tibble() %>%
    mutate(Method = rownames(f)) %>%
    gather(key = h, value = sAPE, -Method)
  scalederror <- (abs(error) / mean(abs(diff(train, lag = frequency(train))))) %>%
    as_tibble() %>%
    mutate(Method = rownames(f)) %>%
    gather(key = h, value = ASE, -Method)
  return(list(pcerror = pcerror, scalederror = scalederror))
})
# Construct a tibble with all results
M3errors <- tibble(
    Series = names(M3),
    Period = map_chr(M3, "period"),
    se = map(errors, "scalederror"),
    pce = map(errors, "pcerror")) %>%
  unnest() %>%
  select(-h1, -Method1) %>%
  mutate(h = as.integer(h),
         Period = factor(str_to_title(Period),
                         levels = c("Monthly","Quarterly","Yearly","Other")))
```

We need to average the accuracy measures for each period, horizon and method.


```r
accuracy <- M3errors %>%
  group_by(Period, Method, h) %>%
  summarize(MASE=mean(ASE), sMAPE=mean(sAPE)) %>%
  ungroup()
```

```
## `summarise()` has grouped output by 'Period', 'Method'. You can override using the `.groups` argument.
```

To keep the table of results of a manageable size, I have summarised the accuracy statistics over all forecast horizons, and included only the best combination approach plus the original benchmark methods. The table is ordered by MASE value with the best method at the top for each period.


```r
# Find names of original methods
original_methods <- unique(accuracy[["Method"]])
original_methods <- original_methods[str_length(original_methods)==1L]
# Compute summary table of accuracy measures
accuracy_table <- accuracy %>%
  group_by(Method,Period) %>%
  summarise(
    sMAPE = mean(sMAPE, na.rm = TRUE),
    MASE = mean(MASE, na.rm = TRUE) ) %>%
  arrange(MASE) %>% ungroup()
```

```
## `summarise()` has grouped output by 'Method'. You can override using the `.groups` argument.
```

```r
best <- accuracy_table %>% filter(MASE==min(MASE))
accuracy_table <- accuracy_table %>%
  filter(Method %in% original_methods | Method %in% best$Method) %>%
  arrange(Period, MASE) %>%
  select(Period, Method, sMAPE, MASE)
knitr::kable(accuracy_table)
```



|Period    |Method | sMAPE|  MASE|
|:---------|:------|-----:|-----:|
|Monthly   |EAT    | 13.52| 0.828|
|Monthly   |T      | 13.86| 0.864|
|Monthly   |E      | 14.14| 0.865|
|Monthly   |A      | 14.97| 0.867|
|Monthly   |N      | 17.23| 1.146|
|Quarterly |EAT    |  9.01| 1.064|
|Quarterly |T      |  9.20| 1.117|
|Quarterly |E      |  9.68| 1.170|
|Quarterly |A      | 10.01| 1.189|
|Quarterly |N      | 11.06| 1.425|
|Yearly    |EAT    | 16.03| 2.688|
|Yearly    |T      | 16.76| 2.774|
|Yearly    |E      | 17.00| 2.860|
|Yearly    |A      | 17.10| 2.959|
|Yearly    |N      | 17.88| 3.172|
|Other     |EAT    |  4.32| 1.807|
|Other     |E      |  4.37| 1.814|
|Other     |A      |  4.51| 1.841|
|Other     |T      |  4.92| 2.271|
|Other     |N      |  6.30| 3.089|

The best performing ensemble method is EAT -- a combination of an ETS model, an ARIMA model and the Theta method.

Next, we can plot the accuracy statistics against the forecast horizon. The legend has been ordered to correspond roughly to the order of the series in the MASE plots.


```r
order <- accuracy_table %>% group_by(Method) %>%
  summarise(MASE = mean(MASE)) %>% arrange(MASE) %>%
  pull("Method") %>% rev()
accuracy %>%
  gather(key = "Measure", value = "accuracy", sMAPE, MASE) %>%
  filter(Method %in% unique(accuracy_table$Method)) %>%
  mutate(Method = factor(Method, levels=order)) %>%
  ggplot(aes(x = h, y = accuracy), group = Method) +
    geom_line(aes(col = Method)) +
    facet_grid(rows = vars(Measure), cols=vars(Period), scale = "free") +
    xlab("Forecast horizon") + ylab("Forecast accuracy")
```

<img src="/hyndsight/2018-06-combination-benchmark_files/figure-html/plots-1.png" width="960" />

From the graph we can see that the EAT ensemble works well for all periods and almost all horizons. To finish, here is a function which produces the EAT ensemble as a forecast object.


```r
eat_ensemble <- function(y, h = ifelse(frequency(y) > 1, 2*frequency(y), 10)) {
  require(forecast)
  fets <- forecast(ets(y), h)
  farima <- forecast(auto.arima(y), h)
  ftheta <- thetaf(y, h)
  comb <- fets
  comb$mean <-(fets$mean + farima$mean + ftheta$mean)/3
  comb$method <- "ETS-ARIMA-Theta Combination"
  return(comb)
}
USAccDeaths %>% eat_ensemble() %>% autoplot()
```

<img src="/hyndsight/2018-06-combination-benchmark_files/figure-html/eat-1.png" width="672" />

The prediction intervals shown are simply those from the ETS model. Combining prediction intervals is more difficult, and I'll leave that to another post.
