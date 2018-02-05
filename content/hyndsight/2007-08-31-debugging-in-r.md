---
author: robjhyndman
comments: true
date: 2007-08-31 03:53:43+00:00

link: https://robjhyndman.com/hyndsight/debugging-in-r/
slug: debugging-in-r
title: Debugging in R
wordpress_id: 11
categories:
- R
---

Anyone who starts writing serious R code (i.e., code that involves user-written functions) soon finds the need to use debugging tools. There are a few basic tools in R that are worth knowing about.

The function `debug()` allows one to step through the execution of a function, line by line. At any point, you can print out values of variables or produce a graph of the results within the function. While debugging, you can simply type "c" to continue to the end of the current  section of code (e.g., to the end of a for loop, or the end of the function itself).

The function `browser()` stops the execution of a function until the user allows it to continue. This is useful if you don't want to step through all the code, line-by-line, but you want it to stop at a certain point so you can check out what is going on.

If your code has already crashed and you want to know where the offending line is, try `traceback()`. This will (sometimes) show where abouts in the code the problem occurred.

Check out the help files for the above functions for the details.

Duncan Murdoch also has an excellent debugging page on the web:  [Debugging in R](https://web.archive.org/web/20170706215053/http://www.stats.uwo.ca:80/faculty/murdoch/software/debuggingR/) which contains a wealth of extremely helpful information.
