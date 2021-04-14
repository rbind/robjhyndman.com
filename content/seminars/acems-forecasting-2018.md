---
title: "ACEMS Forecasting Workshop"
slug: acemsforecasting2018
aliases:
  - /acemsforecasting2018/
author: "Rob J Hyndman"
date: 2018-07-26
draft: no
---

**Date**: 26 July 2018<br>
**Location**: University of Melbourne

This page is for people enrolled in my [ACEMS half-day workshop](https://acems.org.au/events/acems-ecr-retreat-mid-year-2018).

## Prerequisites

Please bring your own laptop with a recent version of R and RStudio installed, along with the `fpp2` package and its dependencies.

Participants will be assumed to be familiar with basic statistical tools such as multiple regression, but no knowledge of time series or forecasting will be assumed.

## Reference

<a href="http://OTexts.org/fpp2" target="_new">
![Online textbook on forecasting](https://otexts.org/fpp2/fpp2_cover.jpg)
</a>

## Need help with R?

* [Datacamp: Introduction to R course](https://www.datacamp.com/courses/free-introduction-to-r)

## Program

<table border=1 cellpadding=2 cellspacing=5 width=100%>
<col width="20%">
<col width="65%">
<col width="15%">
<tr>
  <td>1:00 - 1:45</td>
  <td>Forecast evaluation</td>
  <td><a href="/acemsforecasting2018/1-Forecast-Evaluation.pdf" target="_new">Slides</a></td>
</tr>
<tr>
  <td>1:45 - 2:30</td>
  <td>ARIMA models</td>
  <td><a href="/acemsforecasting2018/2-ARIMA.pdf" target="_new">Slides</a></td>
</tr>
<tr>
  <td>2:30 - 3:00</td>
  <td><em>Break</em></td><td></td>
</tr>
<tr>
  <td>3:00 - 4:00</td>
  <td>Dynamic regression</td>
  <td><a href="/acemsforecasting2018/3-Dynamic-Regression.pdf" target="_new">Slides</a></td>
</tr>
<tr>
  <td>4:00 - 5:00</td>
  <td>Hierarchical forecasting</td>
  <td><a href="/acemsforecasting2018/4-Hierarchical.pdf" target="_new">Slides</a></td>
</tr>
</table>

&nbsp;

## Lab Session 1

 1. For the first four lab sessions, we will use the `qcement` data (Quarterly Australian Portand Cement production, 1956--2014). Plot the data using `autoplot()`.
 2. Split the data into a training set and a test set of 4 years. We will apply models to the training set, and compare the forecasts on the test set. Use `window()` to split the data.
 3. Compute a seasonal naïve forecast applied to the training data, and plot the results. Use `snaive()` to produce the forecasts.
 4. Test if the residuals are white noise using the `checkresiduals()` function. What do you conclude?

## Lab Session 2

  1. Compare the forecasts of the four benchmark methods to the test data using the `accuracy()` command.
  2. What do you conclude?

## Lab Session 3

  1. For the `qcement` data, fit a suitable ARIMA model for the logged data using `auto.arima()`. You can use the argument `lambda=0` in the `auto.arima()` function to take the logs. That way, the forecasts will be on the original scale.
  2. Does this model pass the residuals check?
  3. How does it compare to the benchmark models on the test data?

## Lab Session 4

  1. Download quarterly GDP data from the [Australian Macro Database](http://ausmacrodata.org/series.php?id=gdpcknaaoq). To make this a time series:

     ```r
     ausgdp <- ts(read.csv("gdpcknaaoq.csv")[,1],
       start=c(1959,3), frequency=4)
     ```

  2. Fit a dynamic regression model to the logged `qcement` data with GDP as a predictor variable. Make sure you use the same time periods for both variables.
  3. How do the results compare with the ARIMA model fitted earlier?

## Lab Session 5

  1. The `visnights` data set contains quarterly visitor nights for various regions of Australia. To turn this into an `hts` object:

      ```r
      library(hts)
      tourism.hts <- hts(visnights, characters = c(3, 5))
      ```

  2. Generate forecasts of the bottom level series using ARIMA models, and sum them for "bottom-up" forecasts:

      ```r
      visnightsfc <- forecast(tourism.hts, method='bu', fmethod='arima', h=8)

      autoplot(aggts(tourism.hts, level=0)) +
        autolayer(aggts(visnightsfc, level=0), lty=2)
      autoplot(aggts(tourism.hts, level=1)) +
        autolayer(aggts(visnightsfc, level=1), lty=2)
      autoplot(aggts(tourism.hts, level=2)) +
        autolayer(aggts(visnightsfc, level=2), lty=2)
      ```

      Do the forecasts look reasonable?

  3. Now use optimally reconciled forecasts:

      ```r
      visnightsfc2 <- forecast(tourism.hts, fmethod='arima', h=8)

      autoplot(aggts(tourism.hts, level=0)) +
        autolayer(aggts(visnightsfc2, level=0), lty=2)
      autoplot(aggts(tourism.hts, level=1)) +
        autolayer(aggts(visnightsfc2, level=1), lty=2)
      autoplot(aggts(tourism.hts, level=2)) +
        autolayer(aggts(visnightsfc2, level=2), lty=2)

      autoplot(aggts(visnightsfc2, level=0)) +
        autolayer(aggts(visnightsfc, level=0), lty=2)
      autoplot(aggts(visnightsfc2, level=1)) +
        autolayer(aggts(visnightsfc, level=1), lty=2)
      autoplot(aggts(visnightsfc2, level=2)) +
        autolayer(aggts(visnightsfc, level=2), lty=2)
      ```

      What difference has the reconciliation step made?

## Further resources for forecasting

* [Datacamp: Forecasting using R course](https://www.datacamp.com/courses/forecasting-using-r)
* [International Institute of Forecasters](https://forecasters.org)
* [International Journal of Forecasting](https://ijf.forecasters.org/)
* [International Symposium on Forecasting](https://isf.forecasters.org/)
* [Hyndsight blog](https://robjhyndman.com/hyndsight/)
* [First Port of Call](https://fpc.forecasters.org/)
* [Questions on R](https://stackoverflow.com/questions/tagged/forecasting)
* [Questions on statistics](https://stats.stackexchange.com/questions/tagged/forecasting)

