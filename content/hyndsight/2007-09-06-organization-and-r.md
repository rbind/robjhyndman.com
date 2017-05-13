---
author: robjhyndman
comments: true
date: 2007-09-06 04:04:54+00:00

link: https://robjhyndman.com/hyndsight/organization-and-r/
slug: organization-and-r
title: Organization and R
wordpress_id: 18
categories:
- R
---

Many R users seem to get themselves in a bit of a mess with R files and workspaces scattered across different directories. The R files themselves also get messy and hard to follow. So here is some advice on keeping organized with R:





  * Try to keep code strictly indented based on the code structure such as loops, if statements, etc. Every left brace { should be followed by an extra level of indentation which continues until the matching right brace }. You should be able to quickly identify what lines are part of a loop, or are conditioned by an if statement, simply by the levels of indentation.


  * Comment copiously. You need to be able to figure out what your code does in a year's time.


  * Have a single directory for each project. Within that, keep an R workspace, an R file containing the functions you've written, and one or more R files containing the code to read in the data, apply the functions to the data, plot some graphs, etc.


  * Don't have multiple versions of essentially the same code. If you are doing similar things to what you've done before, write a function to do it and call it when required.


  * Have a main.R file which does all the analysis for the paper, chapter or report. It may simply consist of source lines such as

  ```r
  source("functions.R")
  source("readdata.R")
  source("fitmodel.R")
  ```

Then the whole project can be run by sourcing the main file. If you find an error in your data, or you get updated or revised data, it is then a simple matter of running   main.R and all the graphs and analysis will be re-created.



	
  * Every graph and table to go into your written document should be created via code. Use pdf() for graphs, and xtable() in the [xtable ](http://cran.r-project.org/web/packages/xtable/) package for LaTeX tables. (For more complicated LaTeX tables, latex() in the [Hmisc](http://cran.r-project.org/web/packages/Hmisc) package is also useful.)


