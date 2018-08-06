---
author: robjhyndman
comments: true
date: 2015-06-03 01:04:56+00:00

link: https://robjhyndman.com/hyndsight/show-me-the-evidence/
slug: show-me-the-evidence
title: R vs Autobox vs ForecastPro vs ...
wordpress_id: 3292
categories:
- computing
- forecasting
- IJF
- R
- reproducible research
- time series
---

Every now and then a commercial software vendor makes claims on social media about how their software is so much better than the forecast package for R, but no details are provided.

There are lots of reasons why you might select a particular software solution, and R isn't for everyone. But anyone claiming superiority should at least provide some evidence rather than make unsubstantiated claims.<!-- more -->

The M3 forecasting competition was organized by Spyros Makridakis and Michèle Hibon. Entrants had to forecast 3003 time series and the results were compared to a test set that was withheld from participants. All the data (both training and test sets) and the forecasts of the original participants are publicly available in the [Mcomp package for R](http://cran.r-project.org/package=Mcomp). The [competition results are also publicly available](http://www.forecastingprinciples.com/paperpdf/Makridakia-The%20M3%20Competition.pdf) in an IJF paper published in 2000. The best performing methods overall were the Theta method, ForecastPro and ForecastX, as measured by the symmetric MAPE (sMAPE) that was favoured by Makridakis and Hibon. The following table shows some of the results from the original competition including results from the main commercial software vendors. The first sMAPE column is taken from the original paper. My own recalculation of the sMAPE results usually gives values slightly less than those published (I don't know why). The MAPE column shows the mean absolute percentage error and the MASE column shows the mean absolute scaled errors.

<table >
<tbody >
<tr >
<th><b>Method</b></th>
<th><b>Average sMAPE</b></th>
<th><b>Average sMAPE (recalculated)</b></th>
<th><b>MAPE</b></th>
<th><b>MASE</b></th>
</tr>
<tr >

<td >Theta
</td>

<td >13.01
</td>

<td >12.76
</td>

<td >17.42
</td>

<td >1.39
</td>
</tr>
<tr >

<td >ForecastPro
</td>

<td >13.19
</td>

<td >13.06
</td>

<td >18.00
</td>

<td >1.47
</td>
</tr>
<tr >

<td >ForecastX
</td>

<td >13.49
</td>

<td >13.09
</td>

<td >17.35
</td>

<td >1.42
</td>
</tr>
<tr >

<td >BJ automatic
</td>

<td >14.01
</td>

<td >13.72
</td>

<td >19.13
</td>

<td >1.54
</td>
</tr>
<tr >

<td >Autobox2
</td>

<td >14.41
</td>

<td >13.82
</td>

<td >18.23
</td>

<td >1.51
</td>
</tr>
<tr >

<td >Autobox1
</td>

<td >15.23
</td>

<td >15.20
</td>

<td >20.36
</td>

<td >1.69
</td>
</tr>
<tr >

<td >Autobox3
</td>

<td >15.33
</td>

<td >15.46
</td>

<td >19.31
</td>

<td >1.57
</td>
</tr>
</tbody>
</table>

BJ automatic was produced by ForecastPro but with the forecasts restricted to ARIMA models. For some reason, Autobox was allowed three separate submissions (a practice normally not allowed as it leads to over-fitting on the test set).

Any good forecasting software should be aiming to get close to (or better than) Theta on this test. After all, the M3 competition was held more than 15 years ago. Presumably all of the software companies have tried to improve their results since then. Unfortunately, none of them to my knowledge has published any updated figures. I wish they would (preferably independently verified). It would provide some evidence that they are improving their algorithms.

My aim with the forecast package for R is to make freely available state-of-the-art algorithms for some forecasting models. I do not attempt to offer a comprehensive suite of algorithms, but what I do provide gives forecasts that are in the same ballpark as the best methods in the M3 competition. Here is the evidence.

<table >
<tbody >
<tr >
<th><b>Method</b></th>
<th><b>Average sMAPE</b></th>
<th><b>MAPE</b></th>
<th><b>MASE</b></th>
</tr>
<tr >

<td >ETS
</td>

<td >13.13
</td>

<td >17.38
</td>

<td >1.43
</td>
</tr>
<tr >

<td >AutoARIMA
</td>

<td >13.59
</td>

<td >18.92
</td>

<td >1.46
</td>
</tr>
<tr >

<td >Combined ETS/AutoARIMA
</td>

<td >12.82
</td>

<td >17.59
</td>

<td >1.40
</td>
</tr>
</tbody>
</table>

The last method is a simple average of the forecasts from `ets` and `auto.arima`. If you only want point forecasts, that is the best approach available in the forecast package. It is also better than any of the commercial software (at least as far as they have been prepared to subject their algorithms to independent testing).

Unlike the commercial vendors, you don't have to take my word for it. My algorithms are open source, and the [code that produced the above tables can be downloaded](https://robjhyndman.com/Rfiles/m3comparisons.R).
