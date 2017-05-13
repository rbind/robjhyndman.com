---
author: robjhyndman
comments: true
date: 2014-01-28 22:21:19+00:00

link: https://robjhyndman.com/hyndsight/time-series-data-in-r/
slug: time-series-data-in-r
title: Time series data in R
wordpress_id: 2107
categories:
- R
- statistics
- time series
---

There is no shortage of time series data available on the web for use in student projects, or self-learning, or to test out new forecasting algorithms. It is now relatively easy to access these data sets directly in R.<!-- more -->


### M Competition data


The 1001 series from the M-competition and the 3003 series from the M3-competition are available as part of the [Mcomp package](http://cran.r-project.org/web/packages/Mcomp/) in R.


### DataMarket and Quandl


Both [DataMarket](http://datamarket.com) and [Quandl](http://quandl.com) contain many thousands of time series that can be downloaded directly into R. A search for "Australian Real GDP per capita" on both sites returned many variants. The version from the Federal Reserve Bank in 2010 US dollars was available on both sites ([Datamarket](http://data.is/1jDQwpr) and [Quandl](http://www.quandl.com/FRED/AUSRGDPC)). These data can be downloaded to R using the [rdatamarket](http://cran.r-project.org/package=rdatamarket) and [Quandl](http://cran.r-project.org/package=Quandl) packages respectively:

    
    
    library(rdatamarket)
    library(Quandl)
    ausgdp <- as.ts(dmseries("http://data.is/1jDQwpr")[,1])
    ausgdp2 <- ts(rev(Quandl("FRED/AUSRGDPC", type="ts")), end=2011)
    


The two series should be identical. For some bizarre reason, the Quandl data comes in reverse time order so `rev` needs to be used, and then the time series attributes applied. The `Quandl` function will also generate a warning that no authentication token has been used. Unauthenticated users are limited to 50 downloads per day. See the [help page](http://www.quandl.com/help/r) for details.

The `dmseries` function from the rdatamarket package is simpler to use. The short URL is provided on the "Export" tab of the page for the data set on Datamarket. The data come in `zoo` format, but can easily be converted to a `ts` object using `as.ts`.


### TSDL


For many years, I maintained the [Time Series Data Library](https://robjhyndman.com/TSDL/) consisting of about 800 time series including many from well-known textbooks. These were [transferred to DataMarket](https://robjhyndman.com/hyndsight/tsdl/) in June 2012 and are now [available here](http://data.is/TSDLdemo).


### R packages


A number of other R packages contain time series data. The following packages are listed in the [Time Series Analysis Task View](http://cran.r-project.org/web/views/TimeSeries.html)



	
  * Data from Makridakis, Wheelwright and Hyndman (1998) _Forecasting: methods and applications_ are provided in the [fma](http://cran.r-project.org/package=fma) package.

	
  * Data from Hyndman, Koehler, Ord and Snyder (2008) _Forecasting with exponential smoothing_ are in the [expsmooth](http://cran.r-project.org/package=expsmooth) package.

	
  * Data from Hyndman and Athanasopoulos (2013) _Forecasting: principles and practice_ are in the [fpp](http://cran.r-project.org/package=fpp) package.

	
  * Data from Cryer and Chan (2010) _Time series analysis with applications in R_ are in the [TSA](http://cran.r-project.org/package=TSA) package.

	
  * Data from Shumway and Stoffer (2011) _Time series analysis and its applications_ are in the [astsa](http://cran.r-project.org/package=astsa) package.

	
  * Data from Tsay (2005) _Analysis of financial time series_ are in the [FinTS](http://cran.r-project.org/package=FinTS) package, along with some functions and script files required to work some of the examples.

	
  * [TSdbi](http://cran.r-project.org/package=TSdbi) provides a common interface to time series databases.

	
  * [fame](http://cran.r-project.org/package=fame) provides an interface for FAME time series databases

	
  * [AER](http://cran.r-project.org/package=AER) and [Ecdat](http://cran.r-project.org/package=Ecdat) both contain many data sets (including time series data) from many econometrics text books


