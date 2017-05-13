---
author: robjhyndman
comments: true
date: 2012-10-23 01:48:47+00:00

link: https://robjhyndman.com/hyndsight/latex-loops/
slug: latex-loops
title: LaTeX loops
wordpress_id: 1984
categories:
- computing
- graphics
- LaTeX
- productivity
---

Today I was writing a report which included 20 figures, with the names `demandplot1.pdf`, `demandplot2.pdf`, ..., `demandplot20.pdf`, and all with similar captions. Clearly a loop was required. After all, LaTeX is a programming language, so we should be able to take advantage of its capabilities.<!-- more -->

I found the [forloop package](http://ctan.org/tex-archive/macros/latex/contrib/forloop) which handled the problem perfectly. My first attempt looked like this:


    
    
    \newcommand{\demandplot}[1]{\begin{figure}\centering
    \includegraphics[width=\textwidth]{./figs/demandplot#1.pdf}
    \caption{Hourly demand (GW) for zone #1.}
    \end{figure}}
    
    \newcounter{loop}
    \forloop{loop}{1}{\value{loop}<21}{\demandplot{\arabic{loop}}}
    


The magic happens in the last line providing a loop from 1 to 20, generating the commands `\demandplot{1}`, `\demandplot{2}`, ..., `\demandplot{20}`.

However, that didn't work. After examining the log file, it seems that LaTeX can't handle 20 figures in a row as it has to store them up while it looks for where to place them. So the following modified code was used:

    
    
    \newcommand{\demandplot}[1]{\begin{figure}\centering
    \includegraphics[width=\textwidth]{./figs/demandplot#1.pdf}
    \caption{Hourly demand (GW) for zone #1.}
    \end{figure}}
    
    \newcounter{loop}
    \forloop{loop}{1}{\value{loop}<11}{\demandplot{\arabic{loop}}}
    \clearpage
    \forloop{loop}{11}{\value{loop}<21}{\demandplot{\arabic{loop}}}
    


This loops from 1 to 10, then the `\clearpage` command processes all floats before proceeding with the loop from 11 to 20.

Any time you need some repetitive code in LaTeX, the [forloop package](http://ctan.org/tex-archive/macros/latex/contrib/forloop) should make your life easier (and make silly mistakes less likely).

