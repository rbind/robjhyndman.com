---
date: 2010-11-27 05:00:45+00:00
slug: cv
title: A LaTeX template for a CV
categories:
- jobs
- LaTeX
---

Every researcher needs a Curriculum Vitae (Latin for "course of life") or CV. You will need it for job applications, for annual performance appraisal, and just for keeping track of your publications. A CV typically contains lists of achievements including qualifications, publications, presentations, awards, plus teaching experience.

I've created a [LaTeX style for a CV](/research/cv.sty) to make it easy to produce something that looks good and is easy to maintain. You will need an up-to-date implementation of LaTeX because I'm using the wonderful [biblatex package](http://www.ctan.org/tex-archive/macros/latex/contrib/biblatex/) (more on that in another post) which has only just become available as part of MikTeX and TeXLive.

The preamble of your CV should look something like this:



    \documentclass[a4paper,11pt]{article}
    \usepackage{cv}
    \name{Rob J Hyndman}
    \info{Address: & Department of Econometrics \& Business Statistics, Monash University, VIC 3800, Australia.\\
          Phone: & +61 3 9905 2358\\
          Email: & Rob.Hyndman@monash.edu\\
          WWW: & robjhyndman.com}

    \bibliography{rjhpubs}

    \addtocategory{books}{MWH3,ITSM91,ITSM94,expsmooth08}
    \addtocategory{papers}{BHG91,BH92,YW93,Hyndman94,HDRF95}
    \addtocategory{papers}{HDR96,HBG96,HF96,GHH97,HW97,LFSH97,GH98}







  * Include your name in the `\name` command.


  * The `\info` command contains information to go in the header box on the first page. This is structured as for a tabular environment. You can include any information you like in the `\info` command including additional rows. Some people include their date of birth, citizenship, family details, etc.


  * All your publications should be in a bib file (mine is called `rjhpubs.bib`) loaded with the `\bibliography` command.


  * The final three lines allocate items from the bib file to categories. These will appear in separate sections in the CV. My real CV has several more lines like these so that all my publications are added to categories. Each of the codes is the key for a bib item.


  * The style file has the following pre-defined categories:
<table >
<tbody >
<tr >

<td >books
</td>

<td >Books
</td>
</tr>
<tr >

<td >papers
</td>

<td >Refereed research papers
</td>
</tr>
<tr >

<td >chapters
</td>

<td >Book chapters
</td>
</tr>
<tr >

<td >conferences
</td>

<td >Papers in conference proceedings
</td>
</tr>
<tr >

<td >techreports
</td>

<td >Unpublished working papers
</td>
</tr>
<tr >

<td >bookreviews
</td>

<td >Book reviews
</td>
</tr>
<tr >

<td >editorials
</td>

<td >Editorials
</td>
</tr>
<tr >

<td >phd
</td>

<td >PhD thesis
</td>
</tr>
<tr >

<td >subpapers
</td>

<td >Submitted papers
</td>
</tr>
<tr >

<td >curpapers
</td>

<td >Current projects
</td>
</tr>
</tbody>
</table>
It is easy to add your own categories and titles if these are not suitable. For example, if you want to include posters in your CV, put the following in the preamble:


    \makebibcategory{posters}{Conference posters}





  * After the preamble, my CV looks like this:


    \begin{document}
    \maketitle

    \section{Education and Qualifications}
    \begin{tabular}{lll}
    1988 & B.Sc.(Hons) & University of Melbourne\\
    1992 & Ph.D. & University of Melbourne\\
    2000 & A.Stat. & Statistical Society of Australia.
    \end{tabular}


The `\maketitle` puts in the header box. After that it is a normal LaTeX document with `\section` commands for each section.


  * It is common to have sections listing qualifications, employment history, awards, research grants, teaching experience and publications. The order of these varies depending on what you want to emphasise. Have a look at several CVs to see what other people do. Here are some examples from some well-known statisticians: [Andrew Gelman](http://www.stat.columbia.edu/~gelman/vitae.pdf), [Rob Tibshirani](http://www-stat.stanford.edu/~tibs/cv.pdf), [Matt Wand](http://matt-wand.utsacademics.info/webmiscl/WandCV.pdf).


  * To add my publications, I have the following lines:


    \begin{publications}
    \printbib{books}
    \printbib{papers}
    \printbib{chapters}
    \printbib{conferences}
    \printbib{techreports}
    \printbib{bookreviews}
    \printbib{editorials}
    \end{publications}


Each `\printbib` command will add a section with all the publications in that category, listed in chronological order and sorted by name within each year.


  * The total number of publications listed inside the `publications` environment is calculated and the page numbers for the publications sections are stored. So I have the following line in the Research section of my CV:


    I have authored \ref{sumpapers} papers, chapters or books on statistical topics. A list of these appears on pages \pageref{papersstart}--\pageref{papersend}.


You can have additional `\printbib` commands outside the publications environment, but the associated bib items will not be counted in the `sumpapers` value.



Here is [my CV](https://github.com/robjhyndman/CV/raw/master/RobHyndmanCV.pdf) using this style file (although I use different fonts from those loaded in the style file).

[Download the style file](/research/cv.sty) and use it yourself. Feel free to modify it as you want.


**Update: 3 May 2017**: I've put my [CV on github](https://github.com/robjhyndman/CV), so you can fork and edit it as required.
