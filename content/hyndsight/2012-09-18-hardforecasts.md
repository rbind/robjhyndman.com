---
author: robjhyndman
comments: true
date: 2012-09-18 02:15:35+00:00

link: https://robjhyndman.com/hyndsight/hardforecasts/
slug: hardforecasts
title: Why are some things easier to forecast than others?
wordpress_id: 1957
categories:
- forecasting
- R
- statistics
---

Forecasters are often met with skepticism. Almost every time I tell someone that I work in forecasting, they say something about forecasting the stock market, or forecasting the weather, usually suggesting that such forecasts are hopelessly inaccurate. In fact, forecasts of the weather are amazingly accurate given the complexity of the system, while anyone claiming to forecast the stock market deserves skepticism. So what is the difference between these two types of forecasts, and can we say anything about what can be reasonably be forecast and what can't?<!-- more -->

Clearly, some things are easier to forecast than others. The time of the sunrise tomorrow morning can be forecast very precisely. On the other hand, tomorrow's lotto numbers cannot be forecast with any accuracy. The predictability of an event or a quantity depends on several factors including:




  1. how well we understand the factors that contribute to it;


  2. how much data are available;


  3. whether the forecasts can affect the thing we are trying to forecast.


For example, forecasts of electricity demand can be highly accurate because all three conditions are usually satisfied. We have a good idea on the contributing factors:  electricity demand is largely driven by temperatures, with smaller effects for calendar variation such as holidays, and economic conditions. Provided there is a sufficient history of data on electricity demand and weather conditions, and we have the skills to develop a good model linking electricity demand and the key driver variables, the forecasts can be remarkably accurate.

On the other hand, when forecasting currency exchange rates, only one of the conditions is satisfied: there is plenty of available data. However, we have a very limited understanding of the factors that affect exchange rates, and the forecasts of the exchange rate have a direct effect on the rates themselves. If there are well-publicized forecasts that the exchange rate will increase, then people will immediately adjust the price they are willing to pay and so the forecasts are self-fulfilling. In a sense the exchange rates become their own forecasts. This is an example of the efficient market hypothesis. Consequently, forecasting whether the exchange rate will rise or fall tomorrow is about as predictable as forecasting whether a tossed coin will come down as a head or a tail. In both situations, you will be correct about 50% of the time whatever you forecast. In situations like this, forecasters need to be aware of their own limitations, and not claim more than is possible.

Often in forecasting, a key step is knowing when something can be forecast accurately, and when forecasts are no better than tossing a coin. Good forecasts capture the genuine patterns and relationships which exist in the historical data, but do not replicate past events that will not occur again.

Many people wrongly assume that forecasts are not possible in a changing environment. Every environment is changing, and a good forecasting model captures the way things are changing. Forecasts rarely assume that the environment is unchanging. What is normally assumed is that _the way the environment is changing_ will continue into the future. That is, that a highly volatile environment will continue to be highly volatile; a business with fluctuating sales will continue to have fluctuating sales; and an economy that has gone through booms and busts will continue to go through booms and busts. A forecasting model is intended to capture the way things move, not just where things are. As Abraham Lincoln said "If we could first know where we are and whither we are tending, we could better judge what to do and how to do it".





* * *



This is an edited version of Section 1­/1 from my new book [_Forecasting: principles and practice_.](http://otexts.org/fpp/1/1/)
