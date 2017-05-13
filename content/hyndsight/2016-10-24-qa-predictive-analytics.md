---
author: robjhyndman
comments: true
date: 2016-10-24 12:00:25+00:00

link: https://robjhyndman.com/hyndsight/qa-predictive-analytics/
slug: qa-predictive-analytics
title: 'Q&A: predictive analytics'
wordpress_id: 3906
categories:
- data science
- forecasting
- technology
---

A major news outlet interviewed me on predictive analytics. Here were my responses.<!-- more -->


>Data mining is not just for tech companies, in fact it can be especially useful for industries which are not typically thought of to be 'innovative' such as agriculture. What are some of the main industries that you think benefit from predictive analysis?



Any industry that collects data can use data mining and statistical modelling.

Agriculture is becoming a heavy user of data science methods, with data being collected on every aspect of crop or livestock health and development. This data is then used to optimize crop rotation, or breeding programs.

Energy companies are now using very sophisticated predictive analytic methods for forecasting energy usage from one day to 20 years ahead. With the widespread installation of smart-meters, we now have available electricity demand data by household throughout the day. This allows better network planning, finding anomalies due to equipment malfunction, etc.

Many companies are collecting data, but not using it effectively. I've worked with manufacturing companies that have extremely detailed data on demand for their products right down to store level, but they do almost nothing with the data. This is a waste of resources and useful information. Good predictive modelling will help optimize the supply chain, reduce warehouse costs, have more effective promotions, and so on.


>What can predictive analytics tell us that we would be surprised by?



I am frequently surprised when I am on Amazon how good it is at predicting what books I might be interested in. These suggestions are from a "recommendation algorithm" that is based on what books I have bought, or browsed, in the past. I do buy a lot of books, so I've provided plenty of data for Amazon to predict my interests. Netflix uses a similar algorithm, although it is not so good in my case because I haven't watched enough movies and TV for it to learn what I like.

In Pennsylvania, [statistical models are being used to predict if someone convicted of a crime is likely to re-offend](https://www.themarshallproject.org/2015/08/04/the-new-science-of-sentencing). This information is being used to determine the length of sentences in some cases. So the time in prison is based not just on what crime the person has committed, but also on what crimes they are predicted to commit in the future.

A related project is to predict at the time someone is born, how likely it is that they will commit a crime before they turn 18, based on the history of the child's parents, their socio-economic status, where they live, and so on. The big question, of course, is how will those predictions be used?



>Are there limits to how much data we can mine and what it can tell us?



The data sets that are being mined are getting larger every year. Google handles data sets involving every search query from every user in the world for many years. The data set is so large that it has to be distributed across thousands of separate computers just to store it. Once a data set is too large for an individual computer to handle, we need to use a different set of tools for data analysis. There has been a lot of work in recent years on making analysis on distributed data sets easier. It is hard to see that there would be a limit to the amount of data that could be stored.

Where we can record data frequently, we can usually do good predictive modelling. But there are situations where it is simply not possible to get enough data. For example, we are currently very bad at predicting economies. The problem is that economies change so slowly that we don't have a very long history of data to work with. There is not much point using data more frequently than quarterly or monthly, because economic variables such as the GDP and unemployment rates do not change that quickly. Even if we combine data from similar countries, we do not have enough data to develop a good predictive model. We supplement our data with economic theory, but still the results are not very accurate. This situation is unlikely to improve in the future, because we are never going to get enough data.

There are also some things that are not amenable to data analysis, at least using currently available tools. For example, how to compose a symphony, or write beautiful poetry. Most likely the analytic tools will eventually develop to the point where computers can write great music and beautiful poetry, but we are a long way off that right now. Not so long ago it was thought impossible for a computer to beat a person at the game GO, or drive a car in traffic, and both are now possible. Maybe, one day, you will be driven around by your car, listening to music composed by your phone.
