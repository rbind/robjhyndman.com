---
author: robjhyndman
comments: true
date: 2016-03-28 04:35:17+00:00

link: https://robjhyndman.com/hyndsight/sample-quantiles-20-years-later/
slug: sample-quantiles-20-years-later
title: Sample quantiles 20 years later
wordpress_id: 3702
categories:
- computing
- R
- statistics
---

Almost exactly 20 years ago I wrote a paper with [Yanan Fan](https://research.unsw.edu.au/people/dr-yanan-fan) on how [sample quantiles are computed in statistical software](/publications/quantiles/). It was cited 43 times in the first 10 years, and 457 times in the next 10 years, making it my third paper to receive [500+ citations](https://scholar.google.com.au/citations?user=vamErfkAAAAJ&hl=en).

So what happened in 2006 to suddenly increase the citations? I think it was a combination of things:<!-- more -->




    
  * I wrote a new [quantile() function](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/quantile.html) (with Ivan Frohne) which made it into R core v2.0 in October 2004. Everyone computing quantiles in R was now using our code and the paper was cited in the help file.

    
  * A link to the R help file for quantiles was added to the [Wikipedia article on Quantiles](https://en.wikipedia.org/wiki/Quantile) in June 2006 (not by me).

    
  * A link to Hyndman & Fan (1996) was added to the Wikipedia article in May 2007 (yes, I did this).

    
  * The Wikipedia article section on sample quantiles was restructured around the 9 methods discussed in our paper in February 2010 (this time, nothing to do with me).



The main point of our paper was that statistical software should standardize the definition of a sample quantile for consistency. We listed 9 different methods that we found in various software packages, and argued for one of them (type 8). In that sense, the paper was a complete failure. No major software uses type 8 by default, and the diversity of definitions continues 20 years later. In fact, the paper may have had the opposite effect to what was intended. We drew attention to the many approaches to computing sample quantiles and several software products added them all as options. Our own quantile function for R allows all 9 to be computed, and has type 7 as default (for backwards consistency -- the price we had to pay to get R core to agree to include our function).

The story of this paper provides some interesting lessons:


    
  * Impact factors based on 2 or even 5 years are nonsense. Sometimes it takes 10 years or more before your work starts having an impact.

    
  * Convincing the R core team to change a major function is really difficult, but it has a big effect on increasing the visibility of your research.

    
  * Getting a major Wikipedia article to link to your research is helpful for increasing your citations. (Although it is possibly against the terms of service to add links to your own research work!)

    
  * Sometimes your research will have a very different effect from what was intended.


