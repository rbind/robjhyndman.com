---
author: robjhyndman
comments: true
date: 2014-11-07 01:43:08+00:00

link: http://robjhyndman.com/hyndsight/seasonal-periods/
slug: seasonal-periods
title: Seasonal periods
wordpress_id: 3044
categories:
- forecasting
- R
- seasonality
- statistics
---

I get questions about this almost every week. Here is an example from a recent comment on this blog:



> I have two large time series data. One is separated by seconds intervals and the other by minutes. The length of each time series is 180 days. I'm using R (3.1.1) for forecasting the data. I'd like to know the value of the "frequency" argument in the ts() function in R, for each data set. Since most of the examples and cases I've seen so far are for months or days at the most, it is quite confusing for me when dealing with equally separated seconds or minutes. According to my understanding, the "frequency" argument is the number of observations per season. So what is the "season" in the case of seconds/minutes? My guess is that since there are 86,400 seconds and 1440 minutes a day, these should be the values for the "freq" argument. Is that correct?



<!-- more -->
The [same question was asked on crossvalidated.com](http://stats.stackexchange.com/q/120806/159).

Yes, the "frequency" is the number of observations per "cycle" (normally a year, but sometimes a week, a day or an hour). This is the opposite of the definition of frequency in physics, or in Fourier analysis, where "period" is the length of the cycle, and "frequency" is the inverse of period. When using the `ts()` function in R, the following choices should be used.

[table]
Data, frequency
Annual,1
Quarterly,4
Monthly,12
Weekly, 52
[/table]
Actually, there are not 52 weeks in a year, but 365.25/7 = 52.18 on average. But most functions which use `ts` objects require integer frequency.

Once the frequency of observations is smaller than a week, then there is usually more than one way of handling the frequency. For example, hourly data might have a daily seasonality (frequency=24), a weekly seasonality (frequency=24x7=168) and an annual seasonality (frequency=24x365.25=8766). If you want to use a `ts` object, then you need to decide which of these is the most important.

An alternative is to use a `msts` object (defined in the `forecast` package) which handles multiple seasonality time series. Then you can specify all the frequencies that might be relevant. It is also flexible enough to handle non-integer frequencies.




<table style="width: 100%;" border="0" class="easy-table easy-table-default" >

<tr >
Data
frequencies




</tr>
<tr >

<td >
</td>
minute
hour
day
week
year
</tr>

<tbody >
<tr >

<td >Daily
</td>

<td >
</td>

<td >
</td>

<td >
</td>

<td >7
</td>

<td >365.25
</td>
</tr>
<tr >

<td >Hourly
</td>

<td >
</td>

<td >
</td>

<td >24
</td>

<td >168
</td>

<td >8766
</td>
</tr>
<tr >

<td >Half-hourly
</td>

<td >
</td>

<td >
</td>

<td >48
</td>

<td >336
</td>

<td >17532
</td>
</tr>
<tr >

<td >Min­utes
</td>

<td >
</td>

<td >60
</td>

<td >1440
</td>

<td >10080
</td>

<td >525960
</td>
</tr>
<tr >

<td >Sec­onds
</td>

<td >60
</td>

<td >3600
</td>

<td >86400
</td>

<td >604800
</td>

<td >31557600
</td>
</tr>
</tbody>
</table>




You won't necessarily want to include all of these frequencies --- just the ones that are likely to be present in the data. For example, any natural phenomena (e.g., sunshine hours) is unlikely to have a weekly period, and if your data are measured in one-minute intervals over a 3 month period, there is no point including an annual frequency.

For example, the `taylor` data set from the `forecast` package contains half-hourly electricity demand data from England and Wales over about 3 months in 2000. It was defined as


    
    taylor <- msts(x, seasonal.periods=c(48,336)



One convenient model for multiple seasonal time series is a TBATS model:


    
    taylor.fit <- tbats(taylor)
    plot(forecast(taylor.fit))



(Warning: this takes a few minutes.)

If an `msts` object is used with a function designed for `ts` objects, the largest seasonal period is used as the "frequency" attribute.
