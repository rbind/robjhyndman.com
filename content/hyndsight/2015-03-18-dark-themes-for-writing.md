---
author: robjhyndman
comments: true
date: 2015-03-18 04:55:11+00:00

link: https://robjhyndman.com/hyndsight/dark-themes-for-writing/
slug: dark-themes-for-writing
title: Dark themes for writing
wordpress_id: 3182
categories:
- computing
- LaTeX
- R
- writing
---

I spend much of my day sitting in front of a screen, coding or writing. To limit the strain on my eyes, I use a dark theme as much as possible. That is, I write with light colored text on a dark background. I don't know why this is not the default in more software as it makes a big difference after a few hours of writing.

Most of the time, I am writing using either Sublime Text, RStudio or TeXstudio. Each of them can be set to use a dark theme with syntax coloring to highlight structural features in the text.
<!-- more -->



### Sublime Text



[Sublime Text](http://www.sublimetext.com/) is a wonderful editor and I am spending more of my time in it than anywhere else. The default color scheme is very well chosen -- Monokai. I use that, coupled with the [Numix theme](https://packagecontrol.io/packages/Numix%20Theme), as shown in the screenshot below.

[![Screenshot from 2015-03-18 13:04:50](/files/Screenshot-from-2015-03-18-130450.png)](/files/Screenshot-from-2015-03-18-130450.png)



### RStudio



[RStudio](http://www.rstudio.com/) now has a few dark themes available, including Monokai (although it is not the default). Go to Tools, Global Options, Appearance, and select the Monokai theme (or whichever other one takes your fancy). Here is a screenshot of RStudio as I use it.

[![Screenshot from 2015-03-18 13:09:02](/files/Screenshot-from-2015-03-18-130902.png)](/files/Screenshot-from-2015-03-18-130902.png)



### TeXstudio



I tend to use Sublime Text for LaTeX editing these days, but occasionally I might open [TeXStudio](http://texstudio.sourceforge.net/). Unfortunately the default theme is not dark, and it is very difficult to edit the color scheme. From the menus, choose Options, Configure TeXstudio, Syntax Highlighting. Then you have to edit each color individually.

It is possible to save the scheme in a profile file, and then load it on another computer. Several dark themes have been [proposed on TeX.stackexchange.com](http://tex.stackexchange.com/q/108315/143). I edited one of them to create my own theme shown below.

[![Screenshot from 2015-03-18 13:11:22](/files/Screenshot-from-2015-03-18-131122.png)](/files/Screenshot-from-2015-03-18-131122.png)

Here is [the profile file](https://robjhyndman.com/download/rjh.txsprofile) that implements the above scheme. You should be able to load it in TeXstudio (after which you will need to re-start TeXstudio to see the effect).
