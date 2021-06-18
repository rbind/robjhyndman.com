---
author: robjhyndman
comments: true
date: 2021-06-18
title: "Useful extensions for online books"
slug: fpp-extensions
mathjax: false
categories:
  - publishing
  - writing
---

I've had two recent questions from readers of my online textbook (with George Athanasopoulos) which could be solved using Google Chrome extensions.

> Hi, I'm an MSc student and am shortly starting my project/dissertation on time series data. I've started reading Version 3 of your book and improving my R skills but am wondering if there's any way I can read V3 that will allow annotation? Thanks

For personal annotation of websites, the [Hypothesis extension](https://chrome.google.com/webstore/detail/hypothesis-web-pdf-annota/bjfhmglciegochdpefhhlphglcehbmek) is very useful. You can highlight, annotate and discuss with other readers. You will need to set up a (free) account at https://web.hypothes.is/start/

> Thanks you so much for putting out this book! ... would it be possible to add OpenDyslexic (https://opendyslexic.org/) to your list of available type face on your website? I am attempting to make my way through your text book, but access to this font would make my life immeasurably easier.

The simplest approach here is to use the install the [OpenDyslexic Font](https://chrome.google.com/webstore/detail/opendyslexic-font-for-chr/kplpcbodojdjlejmkfbghifakoinigie/) extension. When installed, the fpp3 book looks like this:

![](/img/opendyslexic.png)

The only issue is that the equations are not rendered properly by default. But these can be fixed. First, right click on an equation and choose `Math Settings/Math Renderer/HTML-CSS`. Then right click again and choose `Math Settings/Scale all math/50%`. You only need to do these steps once.

By the way, a print version of the third edition is [now available](http://geni.us/fpp3).
