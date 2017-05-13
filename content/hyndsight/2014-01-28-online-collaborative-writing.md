---
author: robjhyndman
comments: true
date: 2014-01-28 02:18:13+00:00

link: https://robjhyndman.com/hyndsight/online-collaborative-writing/
slug: online-collaborative-writing
title: Online collaborative writing
wordpress_id: 787
categories:
- LaTeX
- productivity
- writing
---

Everyone who has written a paper with another author will know it can be tricky making sure you don't end up with two versions that need to be merged. The good news is that the days of sending updated drafts by email backwards and forwards is finally over (having lasted all of 25 years -- I can barely imagine writing papers before email).<!-- more -->


### LaTeX solutions


There has been a lot of activity in the development of online LaTeX tools over the last few years.

My current tool of choice when collaborating with other authors is **[WriteLateX](https://www.writelatex.com/)**. One nice feature is it gives a rich-text editor window which is helpful for co-authors who have limited LaTeX experience. Also, the compiled document is available in the right hand panel, and is automatically updated without my co-authors needing to do anything. It also has some great templates to help get started.

There is no need for any author to have a local LaTeX installation.  One author must set up a "project" for the paper which contains any graphics, bib files, local sty files and one or more tex files. Then start work editing the tex files online. The file is saved online so everyone has access to exactly the same version.  If you use any packages from CTAN, they will be included automatically. Here is the window (in a browser) showing the paper I am currently working on.

[![Screenshot from 2014-01-28 12:20:30](/files/Screenshot-from-2014-01-28-122030.png)](/files/Screenshot-from-2014-01-28-122030.png)

Other authors can be invited to join the project provided they have first registered on WriteLaTeX (which is free). Then all authors will be editing the up-to-date version. It is easy to roll back to an earlier version. The Pro account ($8 per month) allows protected projects (i.e., a higher level of privacy and security), and more storage space. [Other plans](https://www.writelatex.com/plans) are also available.

An alternative is **[ShareLaTeX](http://www.sharelatex.com)** which has very similar functionality to WriteLaTeX. A student account (available to anyone with an edu email address) also costs $8 per month. ShareLaTeX does not include a rich-text editor, or automated compiling, but otherwise looks similar to WriteLaTeX. Here is the same project as shown above, but using ShareLaTeX.

[![Screenshot from 2014-01-28 12:37:51](/files/Screenshot-from-2014-01-28-123751.png)](/files/Screenshot-from-2014-01-28-123751.png)

In both cases, the color choices are set by choosing a theme. I prefer to type on a dark background.


### Non-LaTeX solutions


Occasionally I have to write a paper using MS-Word or something similar. I lose even more hair each time it happens, and I spend my time failing to convince my coauthors to at least use an online collaborative editor instead of circulating drafts by email. There are a few solutions available:



	
  * [**Google Docs**](http://docs.google.com). This is my favourite non-LaTeX solution, partly because it integrates seamlessly with other Google products and also because it works amazingly well for real-time joint editing. It is easy to save the document as a pdf or in MS-Word format when it is finished, although conversion to MS-Word format is not perfect.

	
  * [**SkyDrive**](http://skydrive.live.com) is Microsoft's response to the move to online editing. Apparently it works well, although I've never tried it. Saving in docx format should work better than in Google Docs. Real-time editing only became available in November 2013, so it probably still has some glitches.




Before anyone comments about using a version control system such as svn or git, in this post I'm discussing solutions for coauthors that want something easy using software they don't have to install. I also use git and github with some of my coauthors, but I'll leave that to another post.




* * *



Note: this is an update of a post from four years ago. The online offerings have changed enough that I thought it needed revising.

