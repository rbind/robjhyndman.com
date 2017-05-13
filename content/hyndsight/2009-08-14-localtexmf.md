---
author: robjhyndman
comments: true
date: 2009-08-14 03:46:30+00:00

link: https://robjhyndman.com/hyndsight/localtexmf/
slug: localtexmf
title: Maintaining local LaTeX files
wordpress_id: 397
categories:
- computing
- LaTeX
---

If you use LaTeX, then you probably have a bib file — a data base of all the papers and books that you have cited. It is much more efficient to keep one database in one location, than have multiple copies of it floating around your hard drive. (Or even worse, have different bib files created for different papers.) You might also have a few of your own style files, and again it is best to keep these in a central location and not have duplicates all over the place. So you need a central place to store these files where LaTeX will find them.

You could store your local files inside C:\Program Files\MiKTeX 2.7, but then when you upgrade to v2.8, you will have to go and find them and copy them to prevent them being lost. A better solution is to create your own directory. But it is important that your own directory has the same tree structure as C:\Program Files\MiKTeX 2.7.

My own local directory is called C:\localtexmf. A few versions ago, that is the only name it could have so I've stuck with it. Now you can call it whatever you like. Within that directory, it is important to have the following file structure:


![](/files/localtexmf.gif)



`C:\localtexmf\bibtex` contains `.bib` and `.bst` files.

`C:\localtexmf\tex\latex\` contains  `.sty` and `.cls` files.

You will also need to register your local latex tree. Just go to MiKTeX settings and click on the Roots tab. Then enter the new directory as follows:


![](/files/localtexmf2.gif)



To add your local tree to the list, click Add, browse to C:\localtexmf (or whatever name you've chosen) and click OK.

The only other thing to remember is to refresh your filename database every time you add a new file to the local tree.
