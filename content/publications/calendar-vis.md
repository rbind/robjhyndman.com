---
author: Earo Wang, Dianne Cook, Rob&nbsp;J&nbsp;Hyndman
date: 2017-08-11
slug: calendar-vis
title: Calendar-based graphics for visualizing people's daily schedules
kind: unpublished
tags:
- data science
- time series
- graphics
file: calendar-vis.pdf
---

![](/img/calendar-vis.png)

This paper describes a `frame_calendar` function that organizes and displays temporal data, collected on sub-daily resolution, into a calendar layout. Calendars are broadly used in society to display temporal information, and events. The `frame_calendar` uses linear algebra on the date  variable to create the layout. It utilizes the grammar of graphics to create the plots inside each cell, and thus synchronizes neatly with [ggplot2](http://ggplot2.tidyverse.org) graphics. The motivating application is studying pedestrian behavior in Melbourne, Australia, based on counts which are captured at hourly intervals by sensors scattered around the city. Faceting by the usual features such as day and month, was insufficient to examine the behavior. Making displays on a monthly calendar format helps to understand pedestrian patterns relative to events such as work days, weekends, holidays, and special events. The layout algorithm has several format options and variations. It is implemented in the R package [sugrrants](http://pkg.earo.me/sugrrants).

