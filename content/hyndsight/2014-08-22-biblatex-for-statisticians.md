---
author: robjhyndman
comments: true
date: 2014-08-22 03:37:16+00:00

link: https://robjhyndman.com/hyndsight/biblatex-for-statisticians/
slug: biblatex-for-statisticians
title: biblatex for statisticians
wordpress_id: 2863
categories:
- LaTeX
- references
- writing
---

I am now using [biblatex](http://www.ctan.org/pkg/biblatex) for all my bibliographic work as it seems to have developed enough to be stable and reliable. The big advantage of biblatex is that it is easy to format the bibliography to conform to specific journal or publisher styles. It is also possible to have structured bibliographies (e.g., divided into sections: books, papers, R packages, etc.) <!-- more -->

Here is my default setting which should be suitable for almost all statistics and econometrics journals.


    
    
    % Load the package
    \usepackage{url}
    \usepackage[style=authoryear, bibencoding=utf8, minnames=1, maxnames=3,
    maxbibnames=99, natbib=true, dashed=false, terseinits=true, 
    firstinits=true, uniquename=false, uniquelist=true, labeldate=true, 
    doi=false, isbn=false, natbib=true, backend=biber]{biblatex}
    % Change the default formatting to be more "statistical"
    \DeclareFieldFormat{url}{\url{#1}}
    \DeclareFieldFormat[article]{pages}{#1}
    \DeclareFieldFormat[inproceedings]{pages}{\lowercase{pp.}#1}
    \DeclareFieldFormat[incollection]{pages}{\lowercase{pp.}#1}
    \DeclareFieldFormat[article]{volume}{\mkbibbold{#1}}
    \DeclareFieldFormat[article]{number}{\mkbibparens{#1}}
    \DeclareFieldFormat[article]{title}{\MakeCapital{#1}}
    \DeclareFieldFormat[article]{url}{}
    \DeclareFieldFormat[book]{url}{}
    \DeclareFieldFormat[inbook]{url}{}
    \DeclareFieldFormat[incollection]{url}{}
    \DeclareFieldFormat[inproceedings]{url}{}
    \DeclareFieldFormat[inproceedings]{title}{#1}
    \DeclareFieldFormat{shorthandwidth}{#1}
    % No dot before number of articles
    \usepackage{xpatch}
    \xpatchbibmacro{volume+number+eid}{\setunit*{\adddot}}{}{}{}
    % Remove In: for an article.
    \renewbibmacro{in:}{%
      \ifentrytype{article}{}{%
      \printtext{\bibstring{in}\intitlepunct}}}
    % Get rid of months in citations
    \AtEveryBibitem{\clearfield{month}}
    \AtEveryCitekey{\clearfield{month}}
    



If you already use natbib, then all you have to do is replace


    
    
    \usepackage{natbib}
    



with the above code in your preamble, remove any `\bibliographystyle` commands, move `\bibliography{bibfile}` to the preamble, and add `\printbibliography` where you want the bibliography to appear. All the `\citet` and `\citep` commands should still work without modification.

It is important to have a recent version of biblatex as some features have been changing, and the above may not work correctly with older versions. The current version is 2.9a. You must also have biber v1.0 or later. Any up-to-date installation of texlive or MikTeX should be fine.
