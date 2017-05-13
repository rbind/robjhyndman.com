---
author: robjhyndman
comments: true
date: 2016-08-28 10:21:58+00:00

link: https://robjhyndman.com/hyndsight/rmarkdown-template/
slug: rmarkdown-template
title: Rmarkdown template for a Monash working paper
wordpress_id: 3827
categories:
- LaTeX
- Monash University
- R
- reproducible research
- research team
- writing
---

This is only directly relevant to my Monash students and colleagues, but the same idea might be useful for adapting to other institutions.

Some recent changes in the rmarkdown and bookdown packages mean that it is now possible to produce working papers in exactly the same format as we previously used with LaTeX.<!-- more -->

The following template will do the trick. Notice the figure labeling and referencing, and the citations using @key.


    
    
    ---
    title: "Our great idea"
    author: "Helen of Troy and Genghis Khan"
    fontsize: 11pt
    papersize: a4
    fontfamily: kpfonts
    bibliography: references.bib
    biblio-style: authoryear-comp
    subparagraph: true
    toc: false
    output: 
      bookdown::pdf_document2:
        fig_caption: yes
        fig_height: 5
        fig_width: 8
        includes:
          in_header: preamble.tex
        keep_tex: yes
        number_sections: yes
        citation_package: biblatex
    ---
    
    ```{r setup, include=FALSE}
    knitr::opts_chunk$set(echo = FALSE, cache=TRUE, messages=FALSE, warning=FALSE)
    # Make sure you have the latest version of rmarkdown and bookdown
    #devtools::install_github("rstudio/rmarkdown")
    #devtools::install_github("rstudio/bookdown")
    library(ggplot2)
    ```
    
    \begin{abstract}
     A brief summary of our ideas
    \end{abstract}
    
    \begin{keywords}
      blah, blah
    \end{keywords}
    
    \newpage
    
    #Introduction
    
    In a famous paper, @BC64 introduced a family of transformations \dots
    
    ```{r histogram, fig.cap="Nice histogram", message=FALSE, warning=FALSE}
    qplot(exp(rnorm(200)))
    ```
    
    Consider the logNormal data plotted in Figure \ref{fig:histogram}.
    



You do need to install [rmarkdown from github](https://github.com/rstudio/rmarkdown) (the template will cause an error with the current CRAN version). You also need a recent version of LaTeX.

The relevant files are in [this zip archive](https://robjhyndman.com/research/MonashWPtemplate.zip).  Use "Monashwp-rmd-template.Rmd" if you want to use Rmarkdown. Use "monashwp-template.tex" if you want to use LaTeX directly.
