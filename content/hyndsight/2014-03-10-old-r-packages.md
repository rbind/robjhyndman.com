---
author: robjhyndman
comments: true
date: 2014-03-10 04:02:25+00:00

link: https://robjhyndman.com/hyndsight/old-r-packages/
slug: old-r-packages
title: Using old versions of R packages
wordpress_id: 2580
categories:
- computing
- forecasting
- R
---

I received this email yesterday:




>I have been using your ‘forecast’ package for more than a year now. I was on R version 2.15 until last week, but I am having issues with lubridate package, hence decided to update R version to  R 3.0.1. In our organization even getting an open source application require us to go through a whole lot of approval processes. I asked for R 3.0.1,  before I get approval for 3.0.1, a new version of R ( R 3.0.2 ) came out. Unfortunately for me forecast package was built in R3.0.2. Is there any version of forecast package that works in older version of R(3.0.1). I just don’t want to go through this entire approval war again  within the organization.
Please help if you have any work around for this.



This is unfortunately very common. Many corporate IT environments lock down computers to such an extent that it cripples the use of modern software like R which is continuously updated. It also affects universities (which should know better) and I am constantly trying to invent work-arounds to the constraints that Monash IT services place on staff and student computers.

Here are a few thoughts that might help.<!-- more -->




  1. Obviously, educating the people who run the IT environment is the ideal solution, but I've never had any success going that route.


  2. If you have to install old versions of packages, you can download them from the package archives. For the forecast package, go to [cran.r-project.org/src/contrib/Archive/forecast/](http://cran.r-project.org/src/contrib/Archive/forecast/). However, that is only going to help non-Windows users. For Windows, you need the binary zip file instead. Archives for all previous Windows versions can be obtained from [cran.r-project.org/bin/windows/contrib/](http://cran.r-project.org/bin/windows/contrib/).


  3. When my students run R in the student labs, I get them to first run the following script:


    ```r
    lib <- .libPaths()
    .libPaths(c(lib,"c:/users/public"))
    install.packages("fpp",lib="c:/users/public",
      repos="http://cran.ms.unimelb.edu.au/",dependencies=TRUE)
    ```

That way, the students install the latest version of the fpp and dependent packages (including forecast) to a writable section of their local drive. That drive is re-imaged every night, so they have to run this script every time they use R in the labs, but at least they get to use the latest version of the packages.


  4. Usually, installing a package that was built using a later version of R is not a problem except when the underlying data storage structures have changed. Using a package that was built using R3.0.2 in R3.0.1 should not normally cause issues as far as I know. I'm sure readers will correct me on this if I'm wrong. (Thinking of you Dirk!)

  5. However, there is a problem with using the forecast package due to the way it links to the RcppArmadillo package. I used a facility only available from R3.0.2 and so the binary version of the forecast package for R3.0x may cause problems when used with R3.0.0 or R3.0.1. (In fact, it may refuse to install.) The last version of the forecast package that did not depend on R3.0.2 was v4.9 which can be [downloaded here](https://www.dropbox.com/s/jphoafyl5w22zzi/forecast_4.9.zip). (It was built using R3.0.2 but it should run on R3.0.1 without a problem.)






