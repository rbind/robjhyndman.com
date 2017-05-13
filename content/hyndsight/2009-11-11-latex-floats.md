---
author: robjhyndman
comments: true
date: 2009-11-11 00:01:21+00:00

link: https://robjhyndman.com/hyndsight/latex-floats/
slug: latex-floats
title: Controlling figure and table placement in LaTeX
wordpress_id: 652
categories:
- LaTeX
---

It can be frustrating trying to get your figures and tables to appear where you want them in a LaTeX document. Sometimes, they just seem to float off onto another page of their own accord. Here is a collection of tools and ideas that help you get control of those pesky floats.<!-- more -->

Use the placement options: h, t, b and p. For example

    
    \begin{figure}[htb]


causes LaTeX to try to fit the float "here", or at the "top" of the current page (or the next page), or at the "bottom" of the current page (or the next page). If "p" is specified, it will allow the float to take a whole page to itself. You can't specify only "h" as that is too restrictive, and LaTeX will automatically change it to "ht". The default setting is "tbp".

One of the reasons that the floats won't go where you want them is that there are a lot of constraints on where they can go. The main ones are
<table border="0" >
<tbody >
<tr >

<td >**Counter**
</td>

<td >
</td>

<td >**Default**
</td>
</tr>
<tr >

<td >`topnumber`
</td>

<td >maximum number of floats at top of page
</td>

<td >2
</td>
</tr>
<tr >

<td >`bottomnumber`
</td>

<td >maximum number of floats at bottom of page
</td>

<td >1
</td>
</tr>
<tr >

<td >`totalnumber`
</td>

<td >maximum number of floats on a page
</td>

<td >3
</td>
</tr>
<tr >

<td >**Command**
</td>

<td >
</td>

<td >
</td>
</tr>
<tr >

<td >`\topfraction`
</td>

<td >maximum fraction of page for floats at top
</td>

<td >0.7
</td>
</tr>
<tr >

<td >`\bottomfraction`
</td>

<td >maximum fraction of page for floats at bottom
</td>

<td >0.3
</td>
</tr>
<tr >

<td >`\textfraction`
</td>

<td >minimum fraction of page for text
</td>

<td >0.2
</td>
</tr>
<tr >

<td >`\floatpagefraction`
</td>

<td >minimum fraction of floatpage that should have floats
</td>

<td >0.5
</td>
</tr>
</tbody></table>
These can all be changed individually. But it is often easier to add ! before the placement options, thus forcing LaTeX to ignore most of these contraints. For example, I often use

    
    \begin{figure}[!htb]


If you want to change the defaults, the following values give reasonable results:

    
    \setcounter{topnumber}{2}
    \setcounter{bottomnumber}{2}
    \setcounter{totalnumber}{4}
    \renewcommand{\topfraction}{0.85}
    \renewcommand{\bottomfraction}{0.85}
    \renewcommand{\textfraction}{0.15}
    \renewcommand{\floatpagefraction}{0.7}


The `\clearpage` command starts a new page and inserts all floats that have not yet appeared before continuing. This can leave a bad page break, so a useful alternative is to use the `afterpage` package, and then insert

    
    \afterpage{\clearpage}


which will put all the floats at the end of the current page.

A very useful package is `placeins`. This provides the command `\FloatBarrier` which causes all unprocessed floats to be processed at that point, but does not start a new page unless it is necessary. To keep floats in the sections in which they were included, use

    
    \usepackage[section]{placeins}


This silently puts a `\FloatBarrier` command before each section. There are other options explained in the `placeins` documentation.

Another useful package is `flafter`. This causes floats to always appear _after_ their placement in the document.

If you really don't want LaTeX to move your float at all, then use the `float` package with the command `\restylefloat{figure}` in the preamble. This allows you to specify `[H]` as the position parameter which means "Here and only Here". However, this often gives bad page breaks.
