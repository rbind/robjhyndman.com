---
author: robjhyndman
comments: true
date: 2008-08-20 08:13:47+00:00

link: https://robjhyndman.com/hyndsight/tracking-changes-in-latex-files/
slug: tracking-changes-in-latex-files
title: Tracking changes in LaTeX files
wordpress_id: 80
categories:
- computing
- LaTeX
---

When I write a paper, it usually goes through many versions before being submitted to a journal. I keep track of the different versions by renaming the file when I'm about to make major changes, or when I receive a new version from a coauthor. The files are named `file1.tex`, `file2.tex`, etc. where "`file`" is replaced by something more meaningful.

It is often useful to be able to compare  versions to see what changes have been made, especially when working  with coauthors. It is possible to use text comparison software such as [Compare It!](http://www.grigsoft.com/wincmp3.htm), but  LaTeX files often have insignificant changes due to line wrapping which make no difference to the output, and there is no point in identifying these changes.

I recently discovered a great solution which finds real LaTeX changes and ignores changes due to  line wrapping. It is [LaTeXdiff](http://www.ctan.org/tex-archive/support/latexdiff/).The good news is that MikTeX users already have it, although you probably don't realise it.

To use it, you need both MikTeX and Perl installed on your computer. I'll assume you already have MikTeX. If you create R packages for Windows, you will also have Perl. Otherwise, one simple way to get Perl is to install [Rtools](http://www.murdoch-sutherland.com/Rtools/).

The simplest way to proceed once Perl is installed, is to use the following command (from a DOS prompt)

    
    latexdiff-so file1.tex file2.tex > diff.tex


If you are using MikTeX, then the `latexdiff-so` command should work from any DOS prompt. Then just process the file `diff.tex` as you normally do (probably in WinEdt).
