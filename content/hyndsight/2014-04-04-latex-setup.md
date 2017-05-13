---
author: robjhyndman
comments: true
date: 2014-04-04 02:00:38+00:00

link: https://robjhyndman.com/hyndsight/latex-setup/
slug: latex-setup
title: Getting a LaTeX system set up
wordpress_id: 311
categories:
- computing
- LaTeX
---

Today I was teaching the honours students in econometrics and economics about LaTeX. Here are some brief instructions on how to set up a LaTeX system on different operating systems.<!-- more -->


### MS-Windows

  * Download and run the setup program for [MikTeX](http://www.miktex.org/download). Choose the “basic” system.
  * Download and run the installer program for [TeXstudio](http://texstudio.sourceforge.net/).

Then run TeXstudio and start typing.

### Mac OS
	
  * Download and install [MacTeX](http://tug.org/mactex/).

Then run TeXshop and start typing.

### Ubuntu
	
  * For Ubuntu 12.10 or later, install TexLive and TeXstudio through the software centre.

Then run Texstudio and start typing.

### Comments

  * All the above TeX distributions contain [TeXworks](https://www.tug.org/texworks/) which can be used instead of [TeXstudio](http://texstudio.sourceforge.net/). It is more basic, but works ok. I prefer [TeXstudio](http://texstudio.sourceforge.net/) for its additional features.

	
  * To make sure everything is working ok, open [sample.tex](/research/sample.tex) in TeXstudio (or TeXshop or TeXworks) to see an example of a LaTeX file. (You will also need [sample.bib](/research/sample.bib) stored in the same folder.) Click on “Quick build" (or hit F1) and the file should be processed and appear in a separate window. Study the difference between the original file and the final product to learn some basic LaTeX commands.

	
  * For help with learning LaTeX, see ["Useful LaTeX links"](/hyndsight/useful-latex-links/) or some of [my other LaTeX posts](/categories/latex/).

	
  * Just because I post this information here does not mean I am offering to help with all your LaTeX issues. I will usually not answer emails asking for help. Please ask questions at [TeX.stackexchange.com](https://tex.stackexchange.com/).


