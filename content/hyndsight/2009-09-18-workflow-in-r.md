---
author: robjhyndman
comments: true
date: 2009-09-18 03:21:33+00:00

link: https://robjhyndman.com/hyndsight/workflow-in-r/
slug: workflow-in-r
title: Workflow in R
wordpress_id: 546
categories:
- productivity
- R
---

This came up recently on [StackOverflow](http://stackoverflow.com/questions/1429907/workflow-for-statistical-analysis-and-report-writing). One of the answers was particularly helpful and I thought it might be worth mentioning here. The idea presented there is  to break the code into four files, all stored in your project directory. These four files are to be processed in the following order.



**load.R**
:     This file includes all code associated with loading the data. Usually, it will be a short file reading in data from files.

**clean.R**
:    This is where you do all the pre-processing of data, such as taking care of missing values, merging data frames, handling outliers. By the end of this file, the data should be in a clean state, ready to use. It is much better to do this here rather than clean the data on the original file as this enables you to have a complete record of everything done to the data. 

**functions.R**
:    All of the functions needed to perform the actual analysis are stored here.  This file should do nothing other than define the functions you need for analysis. (If you require your own functions for loading or cleaning the data, include them at the top of either load.R or clean.R.) In particular, functions.R should not do anything to the data. This means that you can modify this file and reload it without having to go back and repeat steps 1 & 2 which can take a long time to run for large data sets. 

**do.R**
:    Here is the code to actually do the analysis. This file will use the functions defined in functions.R to do the calculations, produce figures and tables, etc. All figures and tables that end up in your report, paper or thesis should be coded here. Never create figures and tables manually (i.e., with the mouse and menus) as then you can't easily reproduce. 
It is a good idea to save your workspace after each file is run.

There are many advantages to this set up. First, you don't have to reload the data each time you make a change in a subsequent step. Second, if you come back to an old project, you will be able to work out what was done relatively quickly. It also forces a certain amount of structured thinking in what you are doing, which is helpful.

Often there will be bits and pieces of code that you write, but don't end up using, yet don't want to delete. These should either be commented out or saved in files with other names. All analysis from reading data to producing the final results should be reproducible by simply `source()`ing these four files in order with no further user intervention.

I've tried this process on a few projects and found it rather too restrictive. In particular, my `do.R` file often becomes large and unwieldy. Instead, I am now using the following process.



**main.R**
:    This file simply contains a list of source statements to run each of the other R files in order.

**functions.R**
:    As above, all of the functions needed to perform the actual analysis are stored here.  This file should do nothing other than define the functions you need for analysis.

**xxx.R**
:    All other code is contained in files of the form `xxx.R` which are called in an appropriate order by `main.R`. The number and content of these files will depend on the project. Often it will include a `load.R` file and `clean.R` file as above. However, I usually have more than one file containing the actual analysis (instead of the `do.R` file). 

The important part of this is that running `main.R` will run the entire project from scratch. So if the data are updated, or the functions are changed, it is easy to repeat the entire analysis in one step --- just run `source("main.R")`.

It is important to be disciplined about keeping the R files neat and documented. You want to be able to figure out what each part of the code does when you look at it a year after writing it. That means inserting comments and removing anything that is not actually used.
