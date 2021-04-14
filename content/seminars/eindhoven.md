---
title: "Forecasting Using R (Eindhoven)"
slug: eindhoven
aliases:
  - /eindhoven/
subtitle: "EURANDOM-SIKS Masterclass"
author: "Rob J Hyndman"
date: 2016-10-19
draft: no
---


**Date**: 19-21 October 2016<br>
**Location**: Eurandom, Metaforum Building MF11-12, Department of Mathematics and Computer Science, TU Eindhoven, the Netherlands

## Prerequisites

Please bring your own laptop with a recent version of R installed, along with the following packages and their dependencies:

  * `fpp`
  * `ggplot2`
  * `magrittr`
  * `readxl`
  * `thief`
  * `knitr`

Participants will be assumed to be familiar with basic statistical tools such as multiple regression, but no knowledge of time series or forecasting will be assumed.

## Reference

<a href="http://OTexts.org/fpp" target="_new">
![alt text](/eindhoven/fppcover-small.jpg)
</a>

## Need help with R?

* [Base R cheatsheet](https://www.rstudio.com/wp-content/uploads/2016/10/r-cheat-sheet-3.pdf)
* [Datacamp: Introduction to R course](https://www.datacamp.com/courses/free-introduction-to-r)
* [Help with Rmarkdown](http://rmarkdown.rstudio.com/lesson-2.html)
* [Rmarkdown cheatsheet](https://www.rstudio.com/wp-content/uploads/2016/03/rmarkdown-cheatsheet-2.0.pdf)  [[Dutch translation](https://www.rstudio.com/wp-content/uploads/2015/06/RMarkdown-dutch.pdf)]

## Program

### Wednesday 19 October

<table border=1 cellpadding=2 cellspacing=5 width=100%>
<col width="15%">
<col width="70%">
<col width="15%">
<tr>
  <td>09.30 - 10.00</td>
  <td>Registration and welcome</td>
  <td><a href="/eindhoven/1-0-intro.pdf" target="_new">Slides</a></td>
</tr>
<tr>
  <td>10.00 - 11.30</td>
  <td>Time series and R, Time series graphics</td>
  <td><a href="/eindhoven/1-1-Graphics.pdf" target="_new">Slides</a></td>
</tr>
<tr>
  <td>11.30 - 11.45</td>
  <td><em>Break</em></td>
</tr>
<tr>
  <td>11.45 - 13.00</td>
  <td>The forecaster's toolbox</td>
  <td><a href="/eindhoven/1-2-Toolbox.pdf" target="_new">Slides</a></td>
</tr>
<tr>
  <td>13.00 - 14.00</td>
  <td><em>Lunch</em></td>
</tr>
<tr>
  <td>14.00 - 15.30</td>
  <td>Seasonality and trends</td>
  <td><a href="/eindhoven/1-3-Seasonality.pdf" target="_new">Slides</a></td>
</tr>
<tr>
  <td>15.30 - 15.45</td>
  <td><em>Break</em></td>
</tr>
<tr>
  <td>15.45 - 17.00</td>
  <td>Exponential smoothing</td>
  <td><a href="/eindhoven/1-4-ExponentialSmoothing.pdf" target="_new">Slides</a></td>
</tr>
</table>

### Thursday 20 October

<table border=1 cellpadding=2 cellspacing=5 width=100%>
<col width="15%">
<col width="70%">
<col width="15%">
<tr>
  <td>10.00 - 11.30</td>
  <td>ETS and state space models</td>
  <td><a href="/eindhoven/2-1-StateSpace.pdf" target="_new">Slides</a></td>
</tr>
<tr>
  <td>11.30 - 11.45</td>
  <td><em>Break</em></td>
</tr>
<tr>
  <td>11.45 - 13.00</td>
  <td>Transformations and differencing</td>
  <td><a href="/eindhoven/2-2-Transformations.pdf" target="_new">Slides1</a>
  <a href="/eindhoven/2-3-Differencing.pdf" target="_new">Slides2</a></td>
</tr>
<tr>
  <td>13.00 - 14.00</td>
  <td><em>Lunch</em></td>
</tr>
<tr>
  <td>14.00 - 15.30</td>
  <td>Non-seasonal ARIMA models</td>
  <td><a href="/eindhoven/2-4-NonseasonalARIMA.pdf" target="_new">Slides</a></td>
</tr>
<tr>
  <td>15.30 - 15.45</td>
  <td><em>Break</em></td>
</tr>
<tr>
  <td>15.45 - 17.00</td>
  <td>Seasonal ARIMA models</td>
  <td><a href="/eindhoven/2-5-SeasonalARIMA.pdf" target="_new">Slides</a></td>
</tr>
</table>


### Friday 21 October

<table border=1 cellpadding=2 cellspacing=5 width=100%>
<col width="15%">
<col width="70%">
<col width="15%">
<tr>
  <td>10.00 - 11.30</td>
  <td>Time series cross-validation, Dynamic regression</td>
  <td><a href="/eindhoven/3-1-Cross-validation.pdf" target="_new">Slides1</a>
  <a href="/eindhoven/3-2-Dynamic-Regression.pdf" target="_new">Slides2</a></td>
</tr>
<tr>
  <td>11.30 - 11.45</td>
  <td><em>Break</em></td>
</tr>
<tr>
  <td>11.45 - 13.00</td>
  <td>Hierarchical forecasting</td>
  <td><a href="/eindhoven/3-3-Hierarchical.pdf" target="_new">Slides</a></td>
</tr>
<tr>
  <td>13.00 - 14.00</td>
  <td><em>Lunch</em></td>
</tr>
<tr>
  <td>14.00 - 15.30</td>
  <td>VAR, TBATS and NNAR models</td>
  <td><a href="/eindhoven/3-4-Advanced.pdf" target="_new">Slides</a></td>
</tr>
<tr>
  <td>15.30 - 15.45</td>
  <td><em>Break</em></td>
</tr>
<tr>
  <td>15.45 - 16.30</td>
  <td>Final comments, questions and discussion</td>
   <td><a href="/eindhoven/Final-Comments.pdf" target="_new">Slides</a></td>
</tr>
</table>

## Lab sessions

Download the following two Rmarkdown files for recording your lab session exercises:

 * [`Retail.Rmd`](/eindhoven/Retail.Rmd)
 * [`OtherData.Rmd`](/eindhoven/OtherData.Rmd)

Use these to record your answers to all lab session exercises. Use `Retail.Rmd` for all questions involving the retail data introduced in the first lab session, and the other file for the remaining exercises.

### Lab Session 1

1. Download the [monthly Australian retail data](https://robjhyndman.com/data/retail.xlsx). These represent retail sales in various categories for different Australian states.

2.  Read the data into R and choose *one* of the series. This time series will be used throughout the short course in lab sessions.

    Please script this, don't just use the Rstudio click-and-point interface. That way you can save the results for easy replication later.

    You will need the `read_excel` function from the `readxl` package:

    ```r
    retaildata <- readxl::read_excel("retail.xlsx", skip = 1)
    mytimeseries <- ts(retaildata[["A3349873A"]], frequency=12, start=c(1982,4))
    autoplot(mytimeseries)
    ```

    [Replace the column name with your own chosen column.]

### Lab Session 2

  1. The following graphics functions have been introduced:

    ```r
    autoplot, ggseasonplot, ggmonthplot, gglagplot, ggAcf, ggtsdisplay
    ```

    Explore your chosen retail time series using these functions. Can you spot any seasonality, cyclicity and trend? What do you learn about the series?

  2. Repeat for some of the following series:

    ```r
    bicoal, chicken, dole, usdeaths, bricksq, lynx, ibmclose
    ```

    Use the help files to find out what the series are.

### Lab Session 3

 1. Calculate the residuals from a seasonal naïve forecast applied to  quarterly Australian beer production from 1992.

    ```r
    beer <- window(ausbeer, start=1992)
    fc <- snaive(beer)
    autoplot(fc)
    res <- residuals(fc)
    ```

  2. Test if the residuals are white noise.

    ```r
    ggtsdisplay(res, plot.type='scatter')
    Box.test(res, lag=8, fitdf=0, type="Lj")
    ```

    What do you conclude?

  3. Check if the residuals are normally distributed.

    ```r
    qplot(res)
    ```

    What do you conclude?

### Lab Session 4

For your retail time series:

1. Split the data into two parts using

    ```r
    x1 <- window(mytimeseries, end=c(2010,12))
    x2 <- window(mytimeseries, start=2011)
    ```

2. Check that your data have been split appropriately by producing the following plot.

    ```r
    autoplot(cbind(Training=x1,Test=x2))
    ```

3. Calculate forecasts using `snaive` applied to `x1`.

4. Compare the accuracy of your forecasts against the actual values stored in `x2`.

    ```r
    f1 <- snaive(x1)
    accuracy(f1,x2)
    ```

5. Compute the residuals and plot them.

    ```r
    res <- residuals(f1)
    ggtsdisplay(res)
    Box.test(res, lag=24, fitdf=0, type="Lj")
    qplot(res)
    ```

    Do the residuals appear to be uncorrelated and normally distributed?

6. How sensitive are the accuracy measures to the training/test split?

### Lab Session 5

We will use the `bricksq` data for this exercise.

  1. Use an STL decomposition to calculate the trend-cycle and seasonal indices. (Experiment with having fixed or changing seasonality.)
  2. Compute and plot the seasonally adjusted data.
  3. Use a naïve method to produce forecasts of the seasonally adjusted data.
  4. Reseasonalize the results to give forecasts on the original scale.<br>
    [Hint: use the `stlf` function with `method="naive"`.]
  5. Do the residuals look uncorrelated?
  6. Repeat with a robust STL decomposition. Does it make much difference?

### Lab Session 6

1. For this exercise, use the price of a dozen eggs in the United States
from 1900–1993 (data set `eggs`).

    * Use SES and Holt's method (with and without damping) to forecast "future " data.<br>
      [Hint: use `h=100` so you can clearly see the differences between the options when plotting the forecasts.]
    * Which method gives the best training RMSE?
    * Are these RMSE values comparable?
    * Do the residuals from the best fitting method look like white noise?

### Lab Session 7

1. Now we will apply Holt-Winters' multiplicative method to your retail time series data.

    * Why is multiplicative seasonality necessary here?
    * Experiment with making the trend damped.
    * Compare the RMSE of the one-step forecasts from the two methods. Which do you prefer?
    * Check that the residuals from the best method look like white noise.

2. Now use the same training/test split you did in Lab Session 4 to test your Holt-Winters' forecasts on the retail data. Can you beat the seasonal  naïve approach from Lab Session 4?

### Lab Session 8

1. Use `ets()` to find the best ETS model for your retail data.

    * How does this model compare to the Holt-Winters' method you applied in the previous lab session?
    * What do the smoothing parameters tell you about the trend and seasonality?

2. Use `ets()` on some of these series:

    ```r
     bicoal, chicken, dole, usdeaths, bricksq, lynx, ibmclose, eggs, bricksq, ausbeer
    ```

    Does it always give good forecasts?

3. Find an example where it does not work well. Can you figure out why?

### Lab Session 9

1. For the following series, find an appropriate Box-Cox transformation in order to stabilize the variance.

    * `usnetelec`
    * `usgdp`
    * `mcopper`
    * `enplanements`

2. Why is a Box-Cox transformation unhelpful for the `cangas` data?

3. What Box-Cox transformation would you select for your retail data?

4. For the same retail data, try an STL decomposition applied to the Box-Cox transformed series, followed by ETS on the seasonally adjusted data. How does that compare with your best previous forecasts on the test set?

### Lab Session 10

1. For the following series, find an appropriate differencing (after transformation if necessary) to obtain stationary data.

    * `usnetelec`
    * `usgdp`
    * `mcopper`
    * `enplanements`
    * `visitors`

2. For your retail data, find the appropriate order of differencing (after transformation if necessary) to obtain stationary data.

### Lab Session 11

Select a time series from `wmurders`, `usgdp` and `mcopper`.

  * if necessary, find a suitable Box-Cox transformation for the data;
  * fit a suitable ARIMA model to the transformed data using `auto.arima()`;
  * try some other plausible models by experimenting with the orders chosen;
  * choose what you think is the best model and check the residual diagnostics;
  * produce forecasts of your fitted model. Do the forecasts look reasonable?
  * compare the results with what you would obtain using `ets()` (with no transformation).

### Lab Session 12

1. For your retail time series, develop an appropriate seasonal ARIMA model, and compare the forecasts with those you obtained earlier.

2. Obtain up-to-date retail data from the [ABS website (Cat. 8501.0, Table 11)](https://goo.gl/HdrV0G), and compare your forecasts with the actual numbers. How good were the forecasts from the various models?

3. Choose one of the following seasonal time series: `condmilk`, `hsales`, `uselec`

    * Do the data need transforming?  If so, find a suitable transformation.
    * Are the data stationary?  If not, find an appropriate differencing which yields stationary data.
    * Identify a couple of ARIMA models that might be useful in describing the time series.  Which of your models is the best according to their AIC values?
    * Estimate  the  parameters  of  your  best model  and   do diagnostic testing on the residuals.  Do the residuals resemble white noise?  If not, try to find another ARIMA model which fits better.
    * Forecast   the  next  24  months  of  data using your preferred model.
    * Compare the forecasts obtained using `ets()`.

### Lab Session 13

1. For this exercise, we will continue to use your retail data.

  * Use `ets` to find the best model for these data and record the training set RMSE.
  * We will now check how much larger the one-step RMSE is on out-of-sample data using time series cross-validation. The following code will compute the
 result, beginning with four years of data in the training set. Replace `???` with the appropriate values for your ETS model.

    ```r
    k <- 48 # minimum size for training set
    n <- length(mytimeseries) # Total number of observations
    e <- mytimeseries*NA # Vector to record one-step forecast errors
    for(i in 48:(n-1))
    {
      train <- ts(mytimeseries[1:i],freq=12)
      fit <- ets(train, model=???, damped=???)
      fc <- forecast(fit,h=1)$mean
      e[i] <- mytimeseries[i+1]-fc
    }
    sqrt(mean(e^2,na.rm=TRUE))
    ```

 * What would happen in the above loop if I had set `train <- mytimeseries[1:i]`?

 * Plot `e` using `ggtsdisplay`. Do they look uncorrelated and homoscedastic?

 * In practice, we will not know the best model on the whole data set  until we observe all the data. So a more realistic analysis would be to allow `ets` to select a different model each time through the loop. Calculate the RMSE using this approach. (Warning: it will take a while as there are a lot of models to fit.)

 * How do the RMSE values compare? Does the re-selection of a model at each step make much difference?

### Lab Session 14

For your retail time series:

* Develop an appropriate dynamic regression model with Fourier terms for the seasonality. Use the AIC to select the number of Fourier terms to include in the model. (You will probably need to use the same Box-Cox transformation you identified previously.)
* Check the residuals of the fitted model. Does the residual series look like white noise?
* Compare the forecasts with those you obtained earlier using alternative models.

<!--
## Lab Session 15

* This exercise concerns the total monthly takings from accommodation and the total room nights occupied at hotels, motels, and guest houses in Victoria, Australia, between January 1980 and June 1995 (Data set `motel`). Total monthly takings are in thousands of Australian dollars; total room nights occupied are in thousands.

* Use the data to calculate the average cost of a night's accommodation in Victoria each month.

* Plot this cost time series against CPI.

* Produce time series plots of both variables and explain why logarithms of both variables need to be taken before fitting any models.

* Fit an appropriate regression model with ARIMA errors.

* Forecast the average price per room for the next twelve months using your fitted model. (Hint: You will need to produce forecasts of the CPI figures first.)
 -->

### Lab Session 15

We will reconcile the forecasts for the infant deaths data. The following code can be used. Check that you understand what each step is doing.

```r
library(hts)
plot(infantgts)
smatrix(infantgts)

# Forecast 10-step-ahead and reconcile the forecasts
infantforecast <- forecast(infantgts, h=10)

# Plot the forecasts including the last ten historical years
plot(infantforecast, include=10)

# Create a matrix of all aggregated time series
allts_infant <- aggts(infantgts)

# Forecast all series using ARIMA models
allf <- matrix(, nrow=10, ncol=ncol(allts_infant))
for(i in 1:ncol(allts_infant))
  allf[,i] <- forecast(auto.arima(allts_infant[,i]), h=10)$mean
allf <- ts(allf, start=2004)

# combine the forecasts with the group matrix to get a gts object
y.f <- combinef(allf, groups = infantgts$groups)

# set up training and testing samples
data <- window(infantgts, end=1993)
test <- window(infantgts, start=1994)

# Compute forecasts on training data
forecast <- forecast(data, h=10)

# calculate ME, RMSE, MAE, MAPE, MPE and MASE
accuracy.gts(forecast, test)
```

1. How would you measure overall forecast accuracy across the whole collection of time series?

2. Repeat the training/test set analysis using "bottom-up" forecasts (set `method="bu"` in the `forecast` function).

3. Does the ``optimal'' reconciliation method work best here?

### Lab Session 16

Use `thief()` on your retail data, using ARIMA models for each aggregation. Does the temporal reconciliation lead to improved forecasts on your test set?

### Lab Session 17

1. Use the `tbats` function to model your retail time series.

    (a) Check the residuals and produce forecasts.
    (b) Does this completely automated approach work for these data?
    (c) Have you saved any degrees of freedom by using Fourier terms rather than seasonal differencing?

2. The following code will read weekly data on US finished motor gasoline products supplied (thousands of barrels per day):

    ```r
    gas <- read.csv("https://robjhyndman.com/data/gasoline.csv")[,1]
    gas <- ts(gas, start=1991+31/365.25, frequency = 365.25/7)
    ```

    (a) Fit a `tbats` model to these data.
    (b) Check the residuals and produce forecasts.
    (c) Could you model these data using any of the other methods we have considered in this course?

### Lab Session 18

Experiment with using `nnetar()` on your retail data and other data we have considered in previous lab sessions.

### Lab Session 19

Over this short-course, you have developed several models for your Australian retail data. The last exercise is to use cross-validation to objectively compare the models you have developed. Compute cross-validated RMSE values for each of the time series models you have considered. It will take some time to run, so perhaps leave it running overnight and check the results tomorrow.
