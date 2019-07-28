---
author: Alexander Severinsen, Rob&nbsp;J&nbsp;Hyndman
Status: Published
date: 2019-06-08
slug: energy-savings
title: Quantification of energy savings from energy conservation measures in buildings using machine learning
kind: conference
tags:
- energy
- R
- time series
- machine learning
link: https://www.eceee.org/library/conference_proceedings/eceee_Summer_Studies/2019/4-monitoring-and-evaluation-for-greater-impact/quantification-of-energy-savings-from-energy-conservation-measures-in-buildings-using-machine-learning/
citation: "In: <em>ECEEE Summer Study Proceedings</em>. Presqu'île de Giens, France. 3-8 June 2019"
mathjax: true
---

This paper demonstrates how machine learning is used to measure energy savings from energy conservation measures (ECMs); in particular ECMs with a low expected saving.

We develop a model that predict energy consumption in buildings on an hourly level. The model is trained on energy data from the main meter before the ECMs took place. The model is then used to predict energy consumption after the ECMs.

The difference between the prediction (the estimated energy consumption in the building given no ECMs) and the actual usage is the estimated savings. According to the International Performance and Verification Protocol (IPMVP) using data from the main meter is a recommended option when the collective savings of several ECMs are analysed, and the savings are expected to be large.

For ECMs where the expected savings is less than 10 % the IPMVP recommends system simulation or installation of sub-meters to isolate the ECMs. However, when performing smaller ECMs (< 10% expected savings) the added cost of installing sub-meters and/or undertaking system simulation could turn a previous positive cost-benefit analysis into negative taking into consideration the increased cost of measurement and verification.

For this purpose, we show that recent developments within predictive modelling will enable the building owners to quantify energy savings from ECMs where the expected saving is less than 10 %. The model has a feature set of 32 different variables that can explain energy consumption in buildings. For example, calendar-data, minimum, maximum, and average temperatures last 12, 24 and 36 hours. Based on this feature set the model chooses the variables that best explains the energy consumption in each building. Results from analysis in 9 Norwegian grocery stores suggests that our methods are able to detect and quantify savings from small ECMs, thus a cost-efficient and viable alternative to simulation and installing sub-meters.

