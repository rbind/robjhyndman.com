---
author: robjhyndman
comments: true
date: 2016-02-24 22:55:11+00:00

link: https://robjhyndman.com/hyndsight/omitting-outliers/
slug: omitting-outliers
title: Omitting outliers
wordpress_id: 3672
categories:
- data science
- statistics
---

Someone sent me this email today:



>One of my colleagues said that you once said/wrote that you had encountered very few real outliers in your work, and that normally the "outlier-looking" data points were proper data points that should not have been treated as outliers. Have you discussed this in writing? If so, I would love to read it.



I don't think I've ever said or written anything quite like that, and I see lots of outliers in real data. But I have counselled against omitting apparent outliers.

Often the most interesting part of a data set is in the unusual or unexpected observations, so I'm strongly opposed to automatic omission of outliers. The most famous case of that is the non-detection of the hole in the ozone layer by NASA. The way I was told the story was that outliers had been automatically filtered from the data obtained from Nimbus-7. It was only when the British Antarctic Survey observed the phenomenon in the mid 1980s that scientists went back and found the problem could have been detected a decade earlier if automated outlier filtering had not been applied by NASA. In fact, that is also how the story was told on the NASA website for a few years. But in a letter to the editor of the IMS bulletin, [Pukelsheim (1990)](https://www.math.uni-augsburg.de/htdocs/emeriti/pukelsheim/1990c.pdf) explains that the reality was more complicated. In the corrected story, scientists _were_ investigating the unusual observations to see if they were genuine, or the result of instrumental error, but still didn't detect the problem until quite late.

Whatever actually happened, outliers need to be investigated not omitted. Try to understand what caused some observations to be different from the bulk of the observations. If you understand the reasons, you are then in a better position to judge whether the points can legitimately removed from the data set, or whether you've just discovered something new and interesting. Never remove a point just because it is weird.
