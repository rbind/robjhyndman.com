---
author: robjhyndman
comments: true
date: 2012-10-31 02:49:48+00:00

link: https://robjhyndman.com/hyndsight/makefiles/
slug: makefiles
title: Makefiles for R/LaTeX projects
wordpress_id: 1997
categories:
- computing
- LaTeX
- organization
- productivity
- R
- reproducible research
---

**Updated:** 21 November 2012

[`Make`](http://www.gnu.org/software/make/) is a marvellous tool used by programmers to build software, but it can be used for much more than that. I use `make` whenever I have a large project involving R files and LaTeX files, which means I use it for almost all of the papers I write, and almost of the consulting reports I produce.<!-- more -->

If you are using a Mac or Linux, you will already have `make` installed. If you are using Windows and have [Rtools](http://cran.r-project.org/bin/windows/Rtools/) installed, then you will also have `make`. Otherwise, Windows users will need to install it. One implementation is in [GnuWin](http://gnuwin32.sourceforge.net/).

A typical project of mine will include several R files containing code that fit some models, and generate tables and graphs. I try to set things up so I can re-create all the results by simply running the R files. Then I will have a LaTeX file which contains the paper or report I am writing. The tables and graphs produced by R are pulled in to the LaTeX file. Consequently, all I need to do is run all the R files, and then process the tex file, and the paper/report is generated.

`Make` relies on a `Makefile` to determine what it must do. Essentially, a `Makefile` specifies what files must be generated first, and how to generate them. So I need a `Makefile` that specifies that all the R files must be processed first, and then the LaTeX file.

The beauty of a `Makefile` is that it will only process the files that have been updated. It is smart enough not to re-run code if it has already been run. So if nothing has changed, running make does nothing. If only the tex file changes, running make will re-compile the tex document. If the R code has changed, running make will re-run the R code to generate the new tables and graphs, and then re-compile the tex document. All I do is type `make` and it figures out what is required.


### A Makefile for LaTeX


It is easy to tell if the latex document needs compiling --- `make` simply has to check that the pdf version of the document is older than the tex version of the document. Here is a simple `Makefile` that will just handle a LaTeX document.

    
    TEXFILE= paper
    $(TEXFILE).pdf: $(TEXFILE).tex
    	latexmk -pdf -quiet $(TEXFILE)
    


The first line specifies the name of my file, in this case `paper.tex`. The second line specifies that the pdf file must be created from the tex file, and the last line explains how to do that.  MikTeX users might prefer `pdftexify` instead of `latexmk`.

To use the above `Makefile`, copy the code into a plain text file called `Makefile` and store it in the same directory as your tex file. Change the first line so the name of your tex file (without the extension) is used. Then type `make` from a command prompt within the same directory as the tex file, and it should do whatever is necessary to convert your tex to pdf.

Of course, you wouldn't normally bother with a `Makefile` if that is all it did. But throw in a whole lot of R files, and it becomes very worthwhile.



### A Makefile for R and LaTeX


We need a way to allow `make` to be able to tell if an R file has been run. If the R files are run using

    
    
    R CMD BATCH file.R
    


then the output is saved as `file.Rout`. Then `make` only has to check if `file.Rout` is older than `file.R`.

I also like to strip out all the white space from the pdf figures created in R before I put them in a LaTeX document. There is a nice command `pdfcrop` which does that. (You should already have it on a Mac or Linux, and also on Windows provided you are using MikTeX.) So I also want my `Makefile` to crop all images if they have not already been done. Once an image is cropped, an empty file of the form `file.pdfcrop` is created to indicate that `file.pdf` has already been cropped.

OK, now we are ready for my marvellous [`Makefile`](https://robjhyndman.com/data/Makefile).

    
    # Usually, only these lines need changing
    TEXFILE= paper
    RDIR= .
    FIGDIR= ./figs
    
    # list R files
    RFILES := $(wildcard $(RDIR)/*.R)
    # pdf figures created by R
    PDFFIGS := $(wildcard $(FIGDIR)/*.pdf)
    # Indicator files to show R file has run
    OUT_FILES:= $(RFILES:.R=.Rout)
    # Indicator files to show pdfcrop has run
    CROP_FILES:= $(PDFFIGS:.pdf=.pdfcrop)
    
    all: $(TEXFILE).pdf $(OUT_FILES) $(CROP_FILES)
    
    # May need to add something here if some R files depend on others.
    
    # RUN EVERY R FILE
    $(RDIR)/%.Rout: $(RDIR)/%.R $(RDIR)/functions.R
    	R CMD BATCH $<
    
    # CROP EVERY PDF FIG FILE
    $(FIGDIR)/%.pdfcrop: $(FIGDIR)/%.pdf
    	pdfcrop $< $< && touch $@
    
    # Compile main tex file and show errors
    $(TEXFILE).pdf: $(TEXFILE).tex $(OUT_FILES) $(CROP_FILES)
    	latexmk -pdf -quiet $(TEXFILE)
    
    # Run R files
    R: $(OUT_FILES)
    
    # View main tex file
    view: $(TEXFILE).pdf
    	evince $(TEXFILE).pdf &
    
    # Clean up stray files
    clean:
    	rm -fv $(OUT_FILES) 
    	rm -fv $(CROP_FILES)
    	rm -fv *.aux *.log *.toc *.blg *.bbl *.synctex.gz
    	rm -fv *.out *.bcf *blx.bib *.run.xml
    	rm -fv *.fdb_latexmk *.fls
    	rm -fv $(TEXFILE).pdf
    
    .PHONY: all clean
    


[Download the file here.](https://robjhyndman.com/data/Makefile) For most projects I copy this file into the main directory of my project, then all I have to do is modify the first few lines. `RDIR` specifies where the R files are kept and `FIGDIR` specifies where the figures are kept. Normally I keep these together, but sometimes they might be in separate directories.

Now `make` will do everything necessary --- run the R files, crop the pdf graphics, and process the latex document. But it won't do any steps that don't need doing.

`make R` will only process the R files.

`make view` will run the pdf viewer, after updating the pdf file if necessary.

`make clean` will delete all the files generated by latex or by make, so that the entire process must be run again at the next `make` command.

Notice that my R files all depend on `functions.R`. This is a file that contains project-specific functions. If this file is updated, all the other R files will need updating also.

For many projects, some R files will depend on some others having already run. For example, `read.R` may read in the data and reformat it for analysis, while `plot.R` might produce some graphs assuming that `read.R` has already run. To ensure `make` knows about this dependency, we need to add a line

    
    $(RDIR)/plot.Rout: $(RDIR)/plot.R $(RDIR)/functions.R $(RDIR)/read.R
    	R CMD BATCH $<
    


This should be inserted where I have the comment `# May need to add something here if some R files depend on others.`

This `Makefile` works on Linux. Mac and Windows users will need to replace `evince` by whatever pdf viewer they prefer.
