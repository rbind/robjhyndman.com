---
author: robjhyndman
comments: true
date: 2014-04-24 05:41:29+00:00

link: https://robjhyndman.com/hyndsight/jss-rpackages/
slug: jss-rpackages
title: Publishing an R package in the Journal of Statistical Software
wordpress_id: 2696
categories:
- computing
- journals
- JSS
- R
- refereeing
---

I've been an editor of JSS for the last few years, and as a result I tend to get email from people asking me about publishing papers describing R packages in JSS. So for all those wondering, here are some general comments.<!-- more -->

JSS prefers to publish papers about packages where the package is on [CRAN](http://cran.r-project.org) and has been there long enough to have matured (i.e., obvious bugs ironed out and a few active users). This is partly because we have so many submissions that it helps to filter some out and this approach provides some basic quality checks. So I suggest you begin by developing the package for CRAN. This is a preference rather than a requirement, and it is not stated anywhere in the JSS rules. A paper describing a package that has only recently been put on CRAN will still be considered, but the probability of it getting through the reviewing process is smaller.

We prefer substantial packages rather than very specific but small packages. That is, a package that solves a very specific problem is less likely to be published than a package that provides a general toolkit for a discipline area, or one that implements a number of useful approaches to a problem. Think about making your package as ambitious as you can in scope and functionality. Here is an excerpt from a rejection letter I wrote:



>This paper/package does what it claims quite well, but it could do so much more. It lacks ambition. As it stands, the package re-implements a popular algorithm in R. To be publishable in JSS, I would want to see it aim higher and provide more general facilities for xxxx...


Descriptions of smaller and more focused packages may still be acceptable as papers in the "Code Snippets" section of the journal. But in that case, the paper should be suitably shorter.

JSS now has the highest impact factor of any statistics/mathematics journal (which reflects what a silly measure IF is, but that's another story). As a result we are flooded with submissions. Consequently, the standards required for publication have increased fairly rapidly in the last couple of years. Do not think you can get away with a quick description of an R package you have written and have it published in JSS. Spend as much time as you would for any other journal in providing a context in terms of the existing literature, explaining the relevant background material, and describing the innovative features of your work.

JSS papers involve a review of the software as well as the paper. You need to make sure the R code in the package is of high quality, and that the help files are complete, correct and informative. A well-written paper that describes a poor R package is not acceptable. In particular, please follow [standard R coding conventions](https://google.github.io/styleguide/Rguide.xml), and spend lots of time writing good help files. Just because your package passes a CRAN check does not mean the code is well written or that the help files contain no errors.

Make sure the package is actively maintained and developed. I've seen papers describing packages that have not changed for more than two years. Surely in that time you will have found at least one bug, or thought of at least one new feature to add.

Make sure the output in the paper exactly matches the results obtained from the version of the package provided, and state in the introduction which version of the package was used for this paper.

Here are a few further comments taken directly from reports I have written on JSS papers.





  * The examples use the object name "`data`", which clashes with the `data()` function. Please avoid object names that already exist as functions.


  * The examples in the man files and in the paper would be easier to read if you put space around the assignment `<-`


  * Many symbols are not in math mode when not part of an equation. Please be consistent in putting mathematical symbols in math mode.


  * Much better error reporting is needed. It should return something interpretable whenever the user specifies inappropriate arguments.


  * Please consider using S3 methods and classes to allow much simpler printing and plotting.


  * The help page is unnecessarily cluttered. There seems no good reason to put all functions on the one page.


  * Given that plotting is one of the main features of this package, the available plotting facilities are very primitive. For example, it is not possible to change fonts, labels, line types, titles, or anything else. At least add an "`...`" argument so that plotting parameters can be used, and make sure that the plotting parameters passed in this way do not cause clashes.


  * You specify default values for most arguments, but then re-specify them in your examples. It would be simpler to leave out the arguments in the examples if you want to use the default values. Otherwise, why have defaults at all?


  * Use `FALSE` and `TRUE` not `F` and `T` in examples.


  * The code for xxxx would be simpler if you used `match.arg()` to do argument matching.


