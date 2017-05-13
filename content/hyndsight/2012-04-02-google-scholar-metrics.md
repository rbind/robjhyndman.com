---
author: robjhyndman
comments: true
date: 2012-04-02 02:45:30+00:00

link: https://robjhyndman.com/hyndsight/google-scholar-metrics/
slug: google-scholar-metrics
title: Google scholar metrics
wordpress_id: 1786
categories:
- journals
---

Google has produced another great tool for researchers, this time providing some metrics on journal citations. [Google Scholar Metrics](http://scholar.google.com/citations?view_op=top_venues) allows you to search on journals rather than articles, and to see the average or median h-index for each journal.

For example, a [search on "forecasting"](http://scholar.google.com/citations?hl=en&view_op=search_venues&vq=forecasting) yields the following results:


[![](/files/googlescholarmetrics.png)](/files/googlescholarmetrics.png)


<!-- more -->The h-index is the largest number $h$ such that at least $h$ articles in that publication were cited at least $h$ times each. The h5-index is the h-index calculated using only articles published in the last five complete calendar years (2007-2011 in this example). So there were 29 articles published in the IJF between 2007 and 2011 that have each been cited at least 29 times.

The h5-median is the median number of citations of the articles making up the h5-index. That is, for the IJF the 29 articles have received a median 43 citations. By clicking on the number in the h5-index column, you can see [which articles have been included](http://scholar.google.com/citations?hl=en&view_op=list_hcore&venue=EJnkELQAL2YJ.20120401).

Currently, any discussion of journal metrics is dominated by the ISI 2-year impact factor, equal to the average number of citations received per paper published in that journal during the two preceding years. In my view the h5-index is a far better measure than the 2-year IF. Here are some reasons why.



	
  1. I like the fact that a 5-year index has been used, rather than the 2-year impact factor favoured by the ISI. Two years is much too short, and leads to a lot of year-to-year variation, at least in the fields I'm interested in. Five years provides a smoother measure that will not change so much from year to year, yet will still represent recent quality rather than what the journal might have been like many years ago.

	
  2. The h5-index cannot be dominated by one star paper. If there is only one great paper in the journal, and everything else is not cited at all, the h5-index will be 1. On the other hand, the ISI 2-year impact factor will be greatly increased by that single paper due to the non-robustness of the mean.

	
  3. It is harder to game the h5-index than the ISI impact factor. One of the games that some journals play is to force authors wanting their article published in the journal to cite other articles published in the journal, thus artificially increasing the number of citations. This has a direct and immediate impact on the ISI impact factor as it is based on average citations per article. But it will be harder to use this game on the journal h5-index.To see this, imagine that the _Journal of Forecasting_ wanted to improve their h5-index to 30 and so beat the _IJF_. They currently only have 5 papers with 30 or more citations, so they would need to get another 25 papers up to that level, 14 of which currently have fewer than 16 citations. So that's more than 14 extra _JF_ citations for each of those 14 papers -- even with bogus citations that's not going to happen. (I am not suggesting that _JF_ ever plays such games, only pointing out that it will be much harder for journals to game the h5-index than the ISI 2-year impact factor.)


In summary, the h5-index is simple to understand, hard to manipulate, and provides a reasonable if crude measure of the respect accorded to a journal by scholars within its field. While journal metrics are no guarantee of the quality of a journal, if they are going to be used we should use the best available, and Google's h5-index is a big improvement on the ISI impact factor.


