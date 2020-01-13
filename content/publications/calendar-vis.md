---
author: Earo Wang, Dianne Cook, Rob&nbsp;J&nbsp;Hyndman
date: 2020-01-07
slug: calendar-vis
title: Calendar-based graphics for visualizing people's daily schedules
kind: article
citation: <em>J Computational & Graphical Statistics</em>, to appear
tags:
- data science
- time series
- graphics
file: calendar-vis.pdf
doi: 10.1080/10618600.2020.1715226
---

![](/img/calendar-vis.png)

Calendars are broadly used in society to display temporal information and events. This paper describes a new calendar display for plotting data, that includes a layout algorithm with many options, and faceting functionality. The functions use modular arithmetic on the date variable to restructure the data into a calendar format. The user can apply the grammar of graphics to create plots inside each calendar cell, and thus the displays synchronize neatly with [ggplot2](http://ggplot2.tidyverse.org) graphics. The motivating application is studying pedestrian behavior in Melbourne, Australia, based on counts which are captured at hourly intervals by sensors scattered around the city. Faceting by the usual features such as day and month, is insufficient to examine the behavior. Making displays on a monthly calendar format helps to understand pedestrian patterns relative to events such as work days, weekends, holidays, and special events. The functions for the calendar algorithm are available in the R package [sugrrants](http://pkg.earo.me/sugrrants).

