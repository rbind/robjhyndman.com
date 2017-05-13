---
author: robjhyndman
comments: true
date: 2008-03-27 07:54:21+00:00

link: https://robjhyndman.com/hyndsight/creating-a-bibtex-file-from-a-google-library/
slug: creating-a-bibtex-file-from-a-google-library
title: Creating a BibTeX file from a Google Library
wordpress_id: 57
categories:
- references
---

As you will have seen if you poke around these pages, I have a [Google Library](http://books.google.com/books?as_list=BDbe3HukQt-_6yP735J3RARoUt7P86BEGsRz0-SRISeIwrkotMoA) of books in statistics and forecasting. This is intended to be a complete  copy of what is on the shelves in my office (about 400 books), plus books that I would like on my shelves if I had more space.

I find the library useful for keeping track of  books that my students and colleagues borrow (I just add a tag containing their name to the book). It is also useful when searching for a book on a particular topic, especially as Google provides content searches of many books.

Similar facilities are provided by [LibraryThing](http://www.librarything.com),  but I find the [Google Books](http://books.google.com/books?as_list=BDbe3HukQt-_6yP735J3RARoUt7P86BEGsRz0-SRISeIwrkotMoA) interface nicer to use and it also has the in-text searching which is amazing.

Recently I thought it would be useful to create a BibTeX file of these books. Unfortunately, Google does not provide a BibTeX export of books  (unlike [Google Scholar](http://scholar.google.com) where there is a very handy  BibTeX export facility). In the improbable event that anyone else attempts this, here is how I did it.



	
  1. I exported my Google library as an xml file.

	
  2. I signed up for a life-time [LibraryThing](http://www.librarything.com) account for US$25.  Not that I wanted to use LibraryThing, but there is a BibTeX export facility which I wanted to use.

	
  3. I imported my Google Library into LibraryThing simply by uploading the xml file saved earlier.

	
  4. I waited for a while for the library to be created. (I'm not sure how long it was because I had a tea-break, but it was less than 30 minutes.)

	
  5. I went to [/kevin.godby.org/lt2bib/](http://kevin.godby.org/lt2bib/) where I followed the prompts to save my LibraryThing as an xls file, then to convert it to a bib file.

	
  6. I loaded the bib file into JabRef to autogenerate the bibtex keys using the pattern I use (e.g., "Hyndman08" for a single author paper in 2008 and HKOS08 for the book by Hyndman, Koehler, Ord and Snyder in 2008.)

	
  7. Then there was a lot of editing of the bib file to remove duplicates, etc.




### Problems:





	
  * LibraryThing is hopeless at identifying all the authors. Often it just lists the first author. I couldn't find any way around that. So my bib file has lots of entries  with only the first author listed. I'll have to fix these by hand over time.

	
  * The titles often contain extraneous information such as edition numbers, series information, etc. Again, this will require some manual editing.

	
  * I can't see any way of updating my bib file as I add books to my Google Library. Does anyone have any bright ideas?


