---
author: robjhyndman
comments: true
date: 2014-06-11 01:29:22+00:00

link: https://robjhyndman.com/hyndsight/beamer-handout/
slug: beamer-handout
title: Creating a handout from beamer slides
wordpress_id: 2763
categories:
- beamer
- conferences
- LaTeX
- seminars
- teaching
---

I'm about to head off on a speaking tour to Europe (more on that in another post) and one of my hosts has asked for my powerpoint slides so they can print them. They have made two false assumptions: (1) that I use powerpoint; (2) that my slides are static so they can be printed.

Instead, I produced a cut-down version of my beamer slides, leaving out some of the animations and other features that will not print easily. Then I produced a pdf file with several slides per page. <!-- more -->

The beamer manual suggests using the handout option with the pgfpages package, like this:


    
    \documentclass[handout]{beamer}
    \usepackage{pgfpages}
    \pgfpagesuselayout{4 on 1}[a4paper,border shrink=5mm]
    



Unfortunately that won't work for me because I also use the `textpos` package to enable precisely positioned overlays, and pgfpages does not respect the positioning of the overlays.

Instead, the following works. First, add the handout option:


    
    \documentclass[14pt,handout]{beamer}
    



Note that I always use `14pt` to make the text large enough to be easily read in a large lecture theatre.

Then I wrap some of the slides in `\mode<beamer>{` ... `}`. These won't appear in the handout, but they will appear when I remove the handout option from `\documentclass`. Typically the slides I remove contain animations, photographs, and some dynamic overlays.

When the file is compiled, each slide should now be printable. But I want several slides on each page. So I then use the **[`pdfnup`](http://www2.warwick.ac.uk/fac/sci/statistics/staff/academic-research/firth/software/pdfjam/)** command (sorry Windows users, you need a real computer to do this):


    
    
    pdfnup --a4paper --keepinfo --nup 1x3 --frame true 
      --scale 0.92 --no-landscape --outfile handout.pdf slides.pdf
    



To see an example, here are [some slides](https://robjhyndman.com/talks/ElectricityForecasting_Switzerland1.pdf) from a talk I am giving in Switzerland, and here is [the handout](https://robjhyndman.com/talks/handout1a.pdf).
