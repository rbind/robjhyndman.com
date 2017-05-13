---
author: robjhyndman
comments: true
date: 2008-08-20 08:09:38+00:00

link: https://robjhyndman.com/hyndsight/tracking-changes-in-text-files/
slug: tracking-changes-in-text-files
title: Tracking changes in text files
wordpress_id: 76
categories:
- computing
---

A common issue that arises with text files (e.g., R code) is to identify changes that have been made between versions. I usually number my R files as file1.R, file2.R, etc. (with "file" replaced by something more meaningful),with the number indicating the version of the file. Version numbers change whenever I send the file to someone else to modify, or whenever I make major changes myself.

I often need to know what changes have been made between successive versions. The best solution I've found is [Compare It!](http://www.grigsoft.com/wincmp3.htm). All I need to do is highlight the two files in Windows Explorer, right click and choose "Compare 2 files". Then a screen showing the differences appears. An example is given below.

[![](https://robjhyndman.com/pics/compareit.jpg)](https://robjhyndman.com/pics/compareit.jpg)

The bar on the left shows the parts of the file that have been changed. White background denotes unchanged lines.

The software enables me to:



	
  * See all deletions, additions & changes highlighted.

	
  * Choose to over-ride any changes that are not wanted.

	
  * Edit either file onscreen and refresh the highlighted differences.


I frequently use this software for R files and other text file. I sometimes use it for LaTeX files, but here there is often a problem with changes causing subsequent lines to re-wrap, thus producing apparent changes that have no effect on the final result.

For LaTeX files, there is a better solution which I will discuss in the next post.
