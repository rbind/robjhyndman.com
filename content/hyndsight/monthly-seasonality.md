---
date: 2017-05-03
slug: monthly-seasonality
title: Monthly seasonality
categories:
- R
- seasonality
- time series
---

I regularly get asked why I don't consider monthly seasonality in my models for daily or sub-daily time series. For example, [this recent comment](http://disq.us/p/1icjljk) on my post on seasonal periods, or [this comment](http://disq.us/p/1488nf3) on my post on daily data. The fact is, I've never seen a time series with monthly seasonality, although that does not mean it does not exist.

Monthly seasonality is defined as a regular pattern that recurs every month in data that is observed more frequently than monthly. This is different from the seasonality you frequently see in monthly observations which exhibit an annual seasonality. Monthly seasonality would occur if there is some regular activity that takes place every month and which affects the time series.

For example, some companies try to average their expenditure across the month and often have to spend more at the end of the month to justify the budget. So daily expenditure tends to increase at the end of each month, producing a monthly seasonal pattern.

Or imagine a situation where a company always stocks up on supplies on the second Tuesday in every month. Then daily expenditure would have a monthly seasonal pattern.

This type of seasonal pattern is quite difficult to model. The major problem is that months are not of equal length, and Tuesdays do not always fall on the same day of the month. So unlike weekly and yearly seasonality, the seasonal pattern is not periodic and cannot be modelled in the same way that we model other types of seasonality.

The best approach is to consider what is causing the monthly seasonality, and try to allow for it explicitly using regressor variables. If there is an end-of-month effect, then a dummy variable indicating which day(s) are at the end of the month would effectively handle it. If there is a regular event on a specific day in the month (such as the second Tuesday), then again a dummy variable would be best used.

Approximating monthly seasonality by assuming the months are all of 30 days is unlikely to be effective when the seasonality is induced by these types of business practices.

