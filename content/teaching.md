# ETC3550: Applied Forecasting for Business and Economics

Reliable forecasts of business and economic variables must often be obtained against a backdrop of structural change in markets and the economy. This unit introduces methods suitable for forecasting in these circumstances including the decomposition of time series, exponential smoothing methods, ARIMA modelling, and regression with auto-correlated disturbances. Students can expect to enhance their computer skills with exercises using R.

**[Handbook entry](https://handbook.monash.edu/current/units/ETC3550)**

**Textbook:** [*Forecasting: Principles and Practice*, Hyndman & Athanasopoulos (3rd ed., 2020)](https://OTexts.org/fpp3/)

**Slides**

 * [Introduction](https://github.com/robjhyndman/ETC3550Slides/raw/master/etc3550_intro.pdf)
 * [1. Getting started](https://github.com/robjhyndman/ETC3550Slides/raw/master/1-getting-started.pdf)
 * [2. Time series graphics](https://github.com/robjhyndman/ETC3550Slides/raw/master/2-tsgraphics.pdf)
 * [3. Time series decomposition](https://github.com/robjhyndman/ETC3550Slides/raw/master/3-decomposition.pdf)
 * [5. The forecasters toolbox](https://github.com/robjhyndman/ETC3550Slides/raw/master/5-toolbox.pdf)
 * [7. Time series regression](https://github.com/robjhyndman/ETC3550Slides/raw/master/7-regression.pdf)
 * [8. Exponential smoothing](https://github.com/robjhyndman/ETC3550Slides/raw/master/8-ets.pdf)
 * [9. ARIMA models](https://github.com/robjhyndman/ETC3550Slides/raw/master/9-arima.pdf)
 * [10. Dynamic regression models](https://github.com/robjhyndman/ETC3550Slides/raw/master/10-dynamic-regression.pdf)
 * [11. Advanced forecasting methods](https://github.com/robjhyndman/ETC3550Slides/raw/master/11-advanced.pdf)
 * [12. Some practical forecasting issues](https://github.com/robjhyndman/ETC3550Slides/raw/master/12-practical.pdf)
 * [Revision](https://github.com/robjhyndman/ETC3550Slides/raw/master/revision.pdf)

* * *

# Tidy time series & forecasting in R

*This is a 2-day workshop held no more than once per year.*

**Day 1**: We look at the tsibble data structure for flexibly managing collections of related time series. We look at how to do data wrangling, data visualizations and exploratory data analysis. We explore feature-based methods to explore time series data in high dimensions. A similar feature-based approach can be used to identify anomalous time series within a collection of time series, or to cluster or classify time series. Primary packages for day 1 are [tsibble](https://cran.r-project.org/package=tsibble), [lubridate](https://cran.r-project.org/package=lubridate) and [feasts](https://cran.r-project.org/package=feasts) (along with the [tidyverse](http://tidyverse.org) of course).

**Day 2** is about forecasting. We look at some classical time series models and how they are automated in the [fable](https://cran.r-project.org/package=fable) package. We look at creating ensemble forecasts and hybrid forecasts, as well as some new forecasting methods that have performed well in large-scale forecasting competitions. Finally, we look at forecast reconciliation, allowing millions of time series to be forecast in a relatively short time while accounting for constraints on how the series are related.

[**More information . . .**](http://robjhyndman.com/workshop2020/)

* * *
