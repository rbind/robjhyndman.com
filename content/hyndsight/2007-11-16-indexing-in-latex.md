---
author: robjhyndman
comments: true
date: 2007-11-16 04:42:56+00:00

link: https://robjhyndman.com/hyndsight/indexing-in-latex/
slug: indexing-in-latex
title: Indexing in LaTeX
wordpress_id: 39
categories:
- LaTeX
---

I'm in the final stages of preparing my new exponential smoothing book for publication and have been learning about some LaTeX indexing tools.

The standard subject index is created using the following procedure:



	
  1. Include `\index{entry}` commands wherever you want an index entry.

	
  2. Include `\usepackage{makeidx}` and `\makeindex` in the preamble.

	
  3. Put a `\printindex` command where the index is to appear, normally before the `\end{document}` command.


The details are well-documented in [this tutorial](http://www.tug.org/tutorials/tugindia/chap16-scr.pdf) (starting on p9).

An author index can be generated automatically from the `\cite` commands (assuming bibtex is used) using the [authorindex](http://www.ctan.org/tex-archive/indexing/authorindex/authorindex.pdf) package. However, you do need to have perl installed on your computer to use it. To create hyperlinks in the author index, use 

    
    \def\theaipage{\string\hyperpage{\thepage}}



We also wanted back references in the bibliography to show on which pages each reference was cited. This is easily accomplished using

    
    
    \usepackage[backref=page]{hyperref}
    \def\backref#1{{\scriptsize [#1]}}
    


in the preamble.

The final results can be seen [here](http://www.exponentialsmoothing.net/endmatter.pdf).
