---
date: 2014-04-14 23:23:58+00:00
slug: generating-tables-in-latex
title: Generating tables in LaTeX
categories:
- computing
- LaTeX
- productivity
- tables
---

Typing tables in LaTeX can get messy, but there are some good tools to simplify the process. One I discovered this week is [tablesgenerator.com](http://www.tablesgenerator.com), a web-based tool for generating LaTeX tables. It also allows the table to saved in other formats including HTML and Markdown. The interface is simple, but it does most things. For complicated tables, some additional formatting may be necessary.<!-- more -->



[![Screenshot from 2014-04-15 08:57:38](/files/Screenshot-from-2014-04-15-085738.png)](/files/Screenshot-from-2014-04-15-085738.png)



Similar functionality is available via plugins in [Excel](http://www.ctan.org/pkg/excel2latex), [OpenOffice and Libreoffice](http://calc2latex.sourceforge.net/) --- useful if the data for the table is already stored in a spreadsheet.

Good LaTeX editors also have built-in table generators. For example, TeXstudio has the "Quick tabular wizard" and TeXmaker has the "Tabular wizard". The one in TeXstudio is too simple to be very useful, but the TeXmaker wizard has a few more features.

Another useful tool to avoid the mess is the "Align columns" function within TeXstudio (normally shown as a blue button at the top of the screen). Place the cursor within a table and click the button, and spaces are magically added until the columns are aligned. It also works for align, array and matrix environments. Here is a small example from a recent paper of mine showing what it does.

Before:
[![Screenshot from 2014-04-15 09:25:44](/files/Screenshot-from-2014-04-15-092544.png)](/files/Screenshot-from-2014-04-15-092544.png)

After:
[![Screenshot from 2014-04-15 09:17:22](/files/Screenshot-from-2014-04-15-091722.png)](/files/Screenshot-from-2014-04-15-091722.png)

It is much easier to spot problems if the columns are aligned.
