---
author: robjhyndman
comments: true
date: 2014-04-06 00:04:36+00:00
mathjax: true
link: https://robjhyndman.com/hyndsight/interpreting-noise/
slug: interpreting-noise
title: Interpreting noise
wordpress_id: 2640
categories:
- fpp
- statistics
- teaching
---

![04_03_2_prev](/files/04_03_2_prev-300x200.jpg)

When watching the TV news, or reading newspaper commentary, I am frequently amazed at the attempts people make to interpret random noise.

For example, the latest tiny fluctuation in the share price of a major company is attributed to the CEO being ill. When the exchange rate goes up, the TV finance commentator confidently announces that it is a reaction to Chinese building contracts. No one ever says "The unemployment rate has dropped by 0.1% for no apparent reason."

What is going on here is that the commentators are assuming we live in a noise-free world. They imagine that everything is explicable, you just have to find the explanation. However, the world is noisy -- real data are subject to random fluctuations, and are often also measured inaccurately. So to interpret every little fluctuation is silly and misleading.<!-- more -->


### The finance news


Every night on the nightly TV news bulletins, a supposed expert will go through the changes in share prices, stock prices indexes, currency rates, and economic indicators, from the past 24 hours. Have these guys never heard of the [efficient market hypothesis](http://en.wikipedia.org/wiki/Efficient-market_hypothesis)? The daily fluctuations in these time series are guaranteed to be close to white noise. So unless the change is much larger than normal, it is not worth reporting. (Or if it must be reported, than it should not be interpreted.)

A good rule-of-thumb would be that the change should not be interpreted unless it is at least $k$ in magnitude, where $k$ is the 99th percentile of all changes in that time series in the last 12 months. That way, we would only get attempts to explain the fluctuations 3-4 times per year.

Sadly, that's unlikely to happen. Investors don't like to think that their fortune is largely governed by randomness. I suspect that they get comfort in hearing bogus explanations of random fluctuations, because then they feel better about what is happening to their money. It also gives an illusion of potential control --- if only I had known x, I could have made a different decision and made more money. People seem to like to think that the world is more controllable and less random than it really is.


### Seasonally adjusted data


Seasonal adjustment of data usually assumes the following model
$$ Y_t = T_t \times S_t \times E_t,$$
where $Y_t$ is the original data at time $t$, $T_t$ is a smooth trend component, $S_t$ is a seasonal component and $E_t$ is the random error. (Sometimes an additive version is used instead.) There are some well-tested algorithms for estimating $T_t$ and $S_t$ from a set of data. The Australian Bureau of Statistics (ABS) primarily uses the [X-12-ARIMA algorithm](https://www.otexts.org/fpp/6/4).

When the ABS releases an important time series, they will normally report both the trend value $T_t$ and the seasonally adjusted value $Y_t^* = Y_t/S_t$. For example, here is the [February 2014 release](http://www.abs.gov.au/AUSSTATS/abs@.nsf/mf/6202.0) of the labour force participation rate. But the media tend to only report the seasonally adjusted value $Y\_t^\*$ which is, of course, subject to much more noise than the trend estimate $T_t$. Consequently, focusing on little fluctuations in $Y\_t^\*$ is likely to be misleading. Unfortunately, the ABS encourages this mis-representation by focusing on the seasonally-adjusted value rather than the trend value in the media release. It is only those who bother to read the longer release who will get the more important information.

There are two simple solutions to this problem:



	
  1. Report the trend figure instead. It is far less volatile and more likely to reflect what is really happening with unemployment.

	
  2. Only report changes in seasonally adjusted data when they are significant. The ABS helpfully provides a 95% confidence interval for the change in $Y_t^*$, but that seems to be ignored.


However, that would mean that media outlets would have to be responsible, and not fill nightly news bulletins with meaningless interpretations of random fluctuations. It would also mean that politicians would have to be responsible, and not over-hype tiny increases or tiny decreases in the seasonally adjusted data. Unfortunately, that's unlikely to happen any time soon.



(Photo credit: [FreeFoto](http://www.freefoto.com/preview/04-03-2/Stock-Market-Prices), reproduced under [CC licence](http://creativecommons.org/licenses/by-nc-nd/3.0/).)
