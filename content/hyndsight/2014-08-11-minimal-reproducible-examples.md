---
author: robjhyndman
comments: true
date: 2014-08-11 04:54:39+00:00

link: https://robjhyndman.com/hyndsight/minimal-reproducible-examples/
slug: minimal-reproducible-examples
title: Minimal reproducible examples
wordpress_id: 2832
categories:
- computing
- R
---

I occasionally get emails from people thinking they have found a bug in one of my R packages, and I usually have to reply asking them to provide a minimal reproducible example (MRE). This post is to provide instructions on how to create a MRE.<!-- more -->



### Bug reports on github, not email



First, if you think there is a bug, please don't send me emails. Instead, use the bug-reporting facility on github. All eight of my R packages that are on CRAN have pre-release versions [on github](https://github.com/robjhyndman?tab=repositories). If you think there is a bug, just add an "issue" to the github repository and it will get looked at provided it is reproducible.



### Creating an MRE



An MRE is intended to reproduce an error using the smallest amount of code. It saves package developers time in wading through messy code that is not relevant to the apparent bug.

It should consist of a single R script file that can be run without error. The file should contain the following three sections:
    
<ol>
<li> <b>Packages to be loaded</b>.
    
<li><b>The shortest amount of code that reproduces the problem</b>.
<p>Please get rid of anything that is unnecessary.
<p>Try to use one of the built-in datasets if possible.
<p>But if you need to include some data, then use <code>dput()</code> so the data can be included as part of the same text file. For example, if you have a time series <code>y</code>, it can be included in your code by running <code>dput(y)</code>, copying the output, and then in the text file type <code>y <-</code> then paste. In most cases, you do not need to include all of your data, just a small subset that will allow the problem to be reproduced.
<p>If you randomly generate some data, use <code>set.seed()</code> for reproducibility.
<p>Please spend time adding comments so I can understand your code quickly.

<li> <b>The output of <code>sessionInfo()</code> as a comment</b>.
<p>Then I can immediately see what versions of packages you are using, and your R environment.</li>
</ol>


To check that your code is reproducible, try running it in a fresh R session.

### Adding your code to a bug report

Copy and paste your MRE into [gist.github.com](https://gist.github.com/), set the language to R, and choose "Create secret Gist". Copy the URL.

Then go to the github repository for the package, create a new issue, explain the problem in a few words and paste the URL to your MRE.

### What not to do

  * Report a bug that has already been fixed. Please update your packages first to make sure the problem still occurs in the most recent version of the package.
  * copy and paste a section from an R console window.
  * provide anything in a Word file.
  * use bug reporting as a way of getting help. This is not a help service. If you are stuck, try asking on [CrossValidated.com](http://crossvalidated.com) (for statistics problems) or [StackOverflow.com](http://stackoverflow.com) (for R problems).

* * *

This post was based heavily on answers to [this question](http://stackoverflow.com/q/5963269/144157) on StackOverflow.
