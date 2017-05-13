---
author: robjhyndman
comments: true
date: 2011-03-29 11:20:13+00:00

link: https://robjhyndman.com/hyndsight/texstudio/
slug: texstudio
title: I'm switching to TeXstudio
wordpress_id: 1303
categories:
- computing
- LaTeX
- writing
---

I've happily used [WinEdt](http://www.winedt.com) for all my LaTeX editing for about 15 years and I've encouraged my whole research team to use it. But I'm tired of problems with WinEdt that take up my time.<!-- more --> I regularly have requests for help from one of my research team because something in WinEdt is not working properly --- such as pdf synchronization problems, or it is using an old version of MikTeX that no longer updates, or that it has switched to using another pdf viewer without warning. These aren't that hard to fix, but they shouldn't happen. When a coauthor at another university has a request for help, it is much more difficult. If a new person joins our research team, there is always a hassle getting WinEdt configured for their use. Jeromy Anglim has a [nice post on configuring WinEdt 6.0](http://jeromyanglim.blogspot.com/2010/04/winedt-60-for-latex-features.html), but it should work nicely without needing this sort of configuration.

I tried [TeXnicCenter](http://www.texniccenter.org/) for a while, the most popular freeware LaTeX editor for Windows. V1.0 is very cluttered and messy which drives me crazy. V2.0 is an improvement, but is very buggy and progress is so slow that I'll be dead before it is released! It was announced in 2008, but there still isn't a beta version. The last alpha 3 release was nearly a year ago.

So I've been looking around for another LaTeX editor, and after trying a handful of alternatives, discovered **[TeXstudio](http://texstudio.sourceforge.net/)** (previously called TexMakerX) which seems very clean and simple, but does everything I need. The following features are great:



	
  * Colour syntax coding;

	
  * Integrated pdf viewer with syncing in both directions;

	
  * Tree view of document structure automatically created and highlighting my position in the document;

	
  * Auto-completion of standard commands;

	
  * Auto-fill of \ref commands;

	
  * Automatic detection of master document;

	
  * Automatically works with MikTeX with no configuration required;

	
  * Code folding;

	
  * Error list with automatic linking to the relevant line of the document;

	
  * Regex search and replace facility;

	
  * One click build process for LaTeX documents;

	
  * Built-in spelling checker;

	
  * Built-in thesaurus;

	
  * Text analysis including word counts;

	
  * It works on Windows, Unix/Linux, BSD and Mac OS X;

	
  * Freeware.


For beginners, there are lots of buttons to assist with fonts, mathematical symbols, etc. There are also wizards for figures and tables. I won't use these but they might be useful to new LaTeXers.

It is not as powerful as WinEdt in it's macro capability, and it only handles LaTeX (so no good if you want to use TeX, ConTeXt, or some other variant). But for the sort of work I do, it has all the facilities I need. I think it will also lead to far fewer requests for help.

The only customizing I've done is to map F3 to the "Find next" so it matches other software I use. By default, F3 is linked to YAP for dvi files, but I never use dvi files anyway. I also turned off ToolTip-Help which I found annoying.

One bug I have found is that BibTeX is not always called when it should be. It is easy enough to manually run BibTeX, but it would be nice if the need to do so was detected more reliably.

I'm not sure if TeXstudio will be my LaTeX editor for the next 15 years, but I'll use it as my main LaTeX editor unless something better comes along, and I will encourage my research team and coauthors to use it too.
