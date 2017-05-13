---
author: robjhyndman
comments: true
date: 2015-12-09 21:27:30+00:00

link: https://robjhyndman.com/hyndsight/fpp-downloads/
slug: fpp-downloads
title: Who's downloading the forecast package?
wordpress_id: 3455
categories:
- computing
- forecasting
- fpp
- otexts
- R
---

The [github page for the forecast package](https://github.com/robjhyndman/forecast) currently shows the following information
[![Screenshot from 2015-12-10 07-52-10](/files/Screenshot-from-2015-12-10-07-52-10.png)](/files/Screenshot-from-2015-12-10-07-52-10.png)

Note the downloads figure: **264K/month**. I know the package is popular, but that seems crazy. Also, the downloads figure on github only counts the downloads from the RStudio mirror, and ignores downloads from the other 125 mirrors around the world.<!-- more -->

Here are the top ten downloaded packages from the last month:


```r    

library(cranlogs)
cran_top_downloads(when='last-month')

 rank   package  count       from         to
    1       zoo 308290 2015-11-09 2015-12-08
    2  forecast 263797 2015-11-09 2015-12-08
    3      Rcpp 260636 2015-11-09 2015-12-08
    4    lmtest 258810 2015-11-09 2015-12-08
    5       fpp 244989 2015-11-09 2015-12-08
    6 expsmooth 244179 2015-11-09 2015-12-08
    7       fma 243556 2015-11-09 2015-12-08
    8   tseries 243172 2015-11-09 2015-12-08
    9   stringi 199384 2015-11-09 2015-12-08
   10   ggplot2 192072 2015-11-09 2015-12-08
```



OK, that is very weird. Four of those packages are mine (forecast, fpp, expsmooth, and fma), and zoo, Rcpp, lmtest and tseries are all dependencies of forecast. Further, expsmooth, fma and forecast are all dependencies of fpp. So it looks like a lot of people were installing fpp plus all its dependencies.

If we check the daily downloads for 2015, we get the following plot.


    
    
    library(ggplot2)
    data <- cran_downloads(packages=c("forecast","fpp"), from="2015-01-01")
    qplot(date, count, data=data, geom="line", colour=package, 
      ylab="Downloads", main="Package downloads in past year")
    



[![Rplot](/files/fppdownloads.png)](/files/fppdownloads.png)

Sure enough, the last few weeks show a very strong correspondence between fpp and forecast downloads, while previously most forecast downloads were not correlated with fpp downloads.

So the recent spike in forecast package downloads are clearly being driven by fpp installations. But why so many in one month, and most of them in one week? The [fpp package](https://cran.r-project.org/package=fpp) is used by people studying forecasting with [my textbook (_Forecasting: principles and practice_ coauthored with George Athanasopoulos)](http://www.otexts.org/fpp), but there wouldn't be that many people in the world studying forecasting. I wonder if some large organization installed fpp on every computer they own as part of some generic set up. But surely any sys admin who knew what they were doing would only download it once.

Anyone like to own up?
