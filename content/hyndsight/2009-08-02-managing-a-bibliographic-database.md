---
author: robjhyndman
comments: true
date: 2009-08-02 05:50:11+00:00

link: https://robjhyndman.com/hyndsight/managing-a-bibliographic-database/
slug: managing-a-bibliographic-database
title: Managing a bibliographic database
wordpress_id: 357
categories:
- computing
- LaTeX
- references
---

All researchers need to maintain a database of papers they have read, cited, or simply noted for later reference. For those of us using LaTeX, the database is in the BibTeX format and is stored as a simple text file (a bib file) that can be edited using a text editor such as [WinEdt](http://www.winedt.com).

But it is often easier to edit the file using specialist software. My current favourite tool is [JabRef](http://jabref.sourceforge.net/). It is especially useful when searching for references in a large database. However, there are several things I would like to be able to do with my bib file, but JabRef doesn't provide the facilities.

First, when I save a pdf of an article to my local disk, I would like the bib details to be automatically added to my database. But I currently have to go and type them in myself. Usually I don't bother until I need to cite the paper, but then I have trouble trying to find a paper that I'm sure I've saved, but can't find. Even Google Desktop seems to have trouble finding papers that I've saved.

Second, it would be nice to share my bib file with my research students and post-docs. Currently I have to send them a copy periodically.

Third, when I find a paper on [ScienceDirect](http://www.sciencedirect.com), or [RePEc](http://repec.org), or some other online repository, it would be great if I could just click a button and have the paper added to my database, along with a link to the URL where the paper can be obtained.

In the last year, [there has been a lot of work going on in trying to develop new tools to solve some of these problems](http://blogs.plos.org/mfenner/2009/08/01/bibliographic_management_meets_web_2_0/). There are now tools available to do almost everything I want, but no one tool does them all. Unfortunately, many of the available tools are designed to work with MS-Word (ugh) and don't integrate neatly with LaTeX/BibTeX.

One of the  most promising of the new tools appears to be [Mendeley](http://www.mendeley.com/). I've tried importing my bib file into Mendeley, but it seems to fall over with anything more than a few hundred items. My bib file contains about 3000 items. I'm told they are working on performance issues for the next release, so I'll look forward to trying it out again in a few months.

In the meantime, I'll stick with my tried and trusty [JabRef](http://jabref.sourceforge.net/), despite its limitations.
