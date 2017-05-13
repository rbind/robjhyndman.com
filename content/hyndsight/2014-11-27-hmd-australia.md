---
author: robjhyndman
comments: true
date: 2014-11-27 02:33:46+00:00

link: https://robjhyndman.com/hyndsight/hmd-australia/
slug: hmd-australia
title: New Australian data on the HMD
wordpress_id: 3079
categories:
- demography
- R
- reproducible research
---

The [Human Mortality Database](http://www.mortality.org) is a wonderful resource for anyone interested in demographic data. It is a carefully curated collection of high quality deaths and population data from 37 countries, all in a consistent format with consistent definitions. I have used it many times and never cease to be amazed at the care taken to maintain such a great resource.

The data are continually being revised and updated. Today the Australian data has been updated to 2011. There is a time lag because of lagged death registrations which results in undercounts; so only data that are likely to be complete are included.

[Tim Riffe](https://sites.google.com/site/timriffepersonal/) from the HMD has provided the following information about the update:




    
  1. All death counts since 1964 are now included by year of occurrence, up to 2011. We have 2012 data but do not publish them because they are likely a 5% undercount due to lagged registration.

    
  2. Death count inputs for 1921 to 1963 are now in single ages. Previously they were in 5-year age groups. Rather than having an open age group of 85+ in this period counts usually go up to the maximum observed (stated) age. This change (i) introduces minor heaping in early years and (ii) implies different apparent old-age mortality than before, since previously anything above 85 was modeled according to the [Methods Protocol](http://www.mortality.org/Public/Docs/MethodsProtocol.pdf).

    
  3. Population denominators have been swapped out for years 1992 to the present, owing to new ABS methodology and intercensal estimates for the recent period.



Some of the data can be read into R using the `hmd.mx` and `hmd.e0` functions from the [demography package](http://cran.r-project.org/package=demography). Tim has his own [package on github](https://ucbdemography.github.io/DemogBerkeley/) that provides a more extensive interface.
