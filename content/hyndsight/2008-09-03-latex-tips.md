---
author: robjhyndman
comments: true
date: 2008-09-03 08:18:19+00:00

link: https://robjhyndman.com/hyndsight/latex-tips/
slug: latex-tips
title: LaTeX tips
wordpress_id: 85
categories:
- LaTeX
---

While  reading students' theses and papers recently, I came across various  examples of poor latex-ing that I thought would be useful to catalogue.



	
  * Don't set both width and height when using \includegraphics. It distorts the figure.  Instead, I suggest using \includegraphics[width=\textwidth]{..}

	
  * Be consistent in capitalizing section and subsection  headings, and titles in the bibliography. My preferences is to use  sentence case throughout.

	
  * When using functions such as max, min, log, exp, sin, cos,  etc., use the backlash version. e.g., \max rather than max. This puts  the function name in roman font rather than math italics.

	
  * For anything else which should appear as text rather than in  math italics, use \text{...}. This is part of  the **amsmath** package.

	
  * Don't use eqnarray. Use the align environment instead. The spacing is better.

	
  * Don't put blank lines around equations. This creates  paragraph breaks. If you really want an extra line in the tex file, use  a % sign so there is no inserted paragraph break.

	
  * For bold symbols, use \bm{..} with the **bm** package. It works better than the alternatives.

	
  * Only make the symbol bold, not everything else. e.g., \bm{x_t} is wrong. \bm{x}_t is correct.

	
  * Use \dots whenever you want a series of dots. Never type ...


