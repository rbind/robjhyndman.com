---
author: robjhyndman
comments: true
date: 2009-09-13 11:21:14+00:00

link: https://robjhyndman.com/hyndsight/finding-an-r-function/
slug: finding-an-r-function
title: Finding an R function
wordpress_id: 524
categories:
- R
---

Suppose you want a function to fit a neural network. What's the best way to find it? Here are three steps that help to find the elusive function relatively quickly.

First, use `help.search("neural")` or the shorthand `??neural`. This will search the help files of installed packages for the word "neural". Actually, fuzzy matching is used so it returns pages that have words similar to "neural" such as "natural". For a stricter search, use `help.search("neural",agrep=FALSE)`. The following results were returned for me (using the stricter search).

    
    nnet::nnetHess             Evaluates Hessian for a Neural Network
    nnet::nnet                 Fit Neural Networks
    nnet::predict.nnet         Predict New Examples by a Trained Neural Net
    tseries::terasvirta.test   Teraesvirta Neural Network Test for Nonlinearity
    tseries::white.test        White Neural Network Test for Nonlinearity


If you want to look through packages that you have not necessarily installed, you could try using the `findFn` function in the [`sos`](http://cran.r-project.org/web/packages/sos) package. This function searches the help pages of packages covered by the RSiteSearch archives (which includes all packages on CRAN). For example

    
    require("sos")
    findFn("neural")


returns 206 matches (on 13 September 2009) from over 60 packages. These are ordered based on a relevance score, so the top few packages on the list are probably the most useful. (There's a good discussion of `findFn` [here](http://cran.r-project.org/web/packages/sos/vignettes/sos.pdf).)

To look even further afield, use `RSiteSearch("neural")` which will send your search to [R site search](http://search.r-project.org/cgi-bin/namazu.cgi?query=neural&max=20&result=normal&sort=score&idxname=Rhelp08&idxname=functions&idxname=views). As well as CRAN packages, this covers the  R-help mailing list archives, help pages, vignettes and task views.

Still no luck? Try [Rseek.org](https://rseek.org/). It's a restricted Google search covering on R-related sites.

Finally, if all else fails, try asking a question on [StackOverflow](http://stackoverflow.com/questions/tagged/r) (make sure your question is tagged with "r"),  or send your question to the [R-help mailing list](https://stat.ethz.ch/mailman/listinfo/r-help). Both usually solicit replies in under an hour. However, don't do this without first trying to find the function using one of the other methods.
