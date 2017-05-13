---
author: robjhyndman
comments: true
date: 2009-10-14 05:52:01+00:00

link: https://robjhyndman.com/hyndsight/squeezing-space-with-latex/
slug: squeezing-space-with-latex
title: Squeezing space with LaTeX
wordpress_id: 605
categories:
- LaTeX
- writing
---

I've been writing a grant application with a 10-page limit, and as usual it is difficult to squeeze everything in. No, I can't just change the font as it has to be 12 point with at least 2 cm margins on an A4 page. Fortunately, LaTeX is packed full of powerful features that help in squeezing it all in. Here are some of the tips I've used over the years.

Make your text block as big as possible. The simplest way to do that is using the geometry package:

```latex    
    \usepackage[text={16cm,24cm}]{geometry}
```

Use a compact font such as Times Roman:

```latex    
    \usepackage{mathptmx}
```

Remove the spacing between paragraphs and have a small paragraph indentation

```latex    
    \setlength{\parskip}{0cm}
    \setlength{\parindent}{1em}
```

Remove space around section headings.

```latex    
    \usepackage[compact]{titlesec}
    \titlespacing{\section}{0pt}{2ex}{1ex}
    \titlespacing{\subsection}{0pt}{1ex}{0ex}
    \titlespacing{\subsubsection}{0pt}{0.5ex}{0ex}
```

Beware of enumerated and itemized lists. Instead, replace them with compact lists.

```latex    
    \usepackage{paralist}
    
    \begin{compactitem}
    \item ...
    \end{compactitem}
    \begin{compactenum}
    \item ...
    \end{compactenum}
```

If you are allowed, switching to double column can save heaps of space.

```latex    
    \usepackage{multicols}
    
    \begin{multicols}{2}
    ...
    \end{multicols}
```

If the rules say 12pt, you can usually get away with 11.5pt without anyone noticing:

```latex    
    \begin{document}\fontsize{11.5}{14}\rm
```

When you get desperate, you can squeeze the inter-line spacing using

```latex    
    \linespread{0.9}
```

There is also a [`savetrees`](http://www.ctan.org/tex-archive/macros/latex/contrib/savetrees/) package which does a lot of squeezing, but the results don't always look nice, so it is better to try one or more of the above tricks instead.

A few more tricks are explained [here](http://www-h.eng.cam.ac.uk/help/tpl/textprocessing/squeeze.html) and [here](http://www.terminally-incoherent.com/blog/2007/09/19/latex-squeezing-the-vertical-white-space).
