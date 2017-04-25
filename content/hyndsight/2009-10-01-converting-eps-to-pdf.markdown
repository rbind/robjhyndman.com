---
author: robjhyndman
comments: true
date: 2009-10-01 11:45:42+00:00

link: http://robjhyndman.com/hyndsight/converting-eps-to-pdf/
slug: converting-eps-to-pdf
title: Converting eps to pdf
wordpress_id: 580
categories:
- computing
- LaTeX
---

Now that there is a [way to sync a pdf file and tex file in both directions](http://robjhyndman.com/hyndsight/synchronizing-winedt-and-pdf-files/), the only remaining reason to use dvi files is when the graphics are in eps format.

However, that problem has also been solved for those using MikTeX 2.8 or TeXLive 2009. In MikTeX 2.8, simply include the package `epstopdf` along with `graphicx`. (As noted in the comments below, even this step is not necessary in TeXLive 2009.) Then when you use pdflatex, the eps files will be automatically converted to pdf at compile time. (The conversion only happens the first time you process the file, and is skipped if there is already a pdf file with the same name.)

For example:

    
    
    \documentclass{article}
    \usepackage{graphicx,epstopdf}
    \begin{document}
    \includegraphics[width=\textwidth]{fig1}
    \end{document}
    


Then even though the only graphics file available is `fig1.eps`, this will still be processed ok using pdflatex or pdftexify. On the first pass, a new file called `fig1-eps-coverted-to.pdf` is created and inserted at the appropriate place. See the [documentation for more options and details](http://tug.ctan.org/tex-archive/macros/latex/contrib/oberdiek/epstopdf.pdf).

Thanks to [Joseph Wright](http://www.texdev.net/2009/09/28/eps-graphics-with-pdflatex/) for bringing this to my attention.

Dvi is dead. Long live pdf.
