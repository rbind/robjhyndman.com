---
date: 2017-12-22
slug: m4competition
title: "M4 Forecasting Competition update"
mathjax: true
categories:
  - forecasting
  - R
  - reproducible research
  - time series
---

[![](/img/m4.png)](https://mofc.unic.ac.cy/m4/)

The [official guidelines](https://www.m4.unic.ac.cy/wp-content/uploads/2018/03/M4-Competitors-Guide.pdf) for the M4 competition have now been published, and there have been several developments since my last post on this.

1. There is now a prize for prediction interval accuracy using a scaled version of the Mean Interval Score. If the $100(1-\alpha)$% prediction interval for time $t$ is given by $[L\_{t},U\_{t}]$, for $t=1,\dots,h$, then the MIS is defined as
 $$\frac{1}{h}\sum_{t=1}^{h} \left[ (U_t-L_t) +  \frac{2}{\alpha}(L_t-Y_t)1(Y_t < L_t) +  \frac{2}{\alpha}(Y_t-U_t)1(Y_t > U_t) \right] $$
where $Y_t$ is the observation at time $t$. The competition will use 95% prediction intervals, so $\alpha=0.05$. This both penalizes for wide intervals (since $U\_t-L\_t$ will be large), and penalizes for non-coverage with observations well outside the interval being penalized more heavily. So it deals with sharpness and calibration. See [Gneiting & Raftery (2007)](https://www.stat.washington.edu/raftery/Research/PDF/Gneiting2007jasa.pdf) for further details.


2. There is now a strong emphasis on reproducibility with benchmark R code [posted on Github](https://github.com/M4Competition/M4-methods/blob/master/Benchmarks%20and%20Evaluation.R) and most competitors will be required to post their code on Github also.

3. There will be weekly, daily and hourly series included, so there will almost certainly be some series with multiple seasonality.


I am grateful to Spyros Makridakis for taking account of [my concerns](/hyndsight/m4comp/). I think the M4 competition is much improved as a result, and I am excited to see the submissions and results.

Spyros has provided [an overview of the competition on the IIF blog](https://forecasters.org/blog/2017/12/21/m4-competition-1-1-2018/).

I have agreed to publish a selection of articles on the M4 competition in the IJF. More details about this will be announced at a later date.

For now, please [register to participate](https://mofc.unic.ac.cy/m4/). The more forecasters who get involved the better.
