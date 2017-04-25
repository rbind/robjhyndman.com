---
author: robjhyndman
comments: true
date: 2014-12-14 22:17:16+00:00
mathjax: true
link: http://robjhyndman.com/hyndsight/ts-classification-contest/
slug: ts-classification-contest
title: A time series classification contest
wordpress_id: 3105
categories:
- data science
- forecasting
- kaggle
- R
- time series
---

Amongst today's email was one from someone running a private competition to classify time series. Here are the essential details.



<blockquote>
The data are measurements from a medical diagnostic machine which takes 1 measurement every second, and after 32-1000 seconds, the time series must be classified into one of two classes. Some pre-classified training data is provided. It is not necessary to classify all the test data, but you do need to have relatively high accuracy on what is classified. So you could find a subset of more easily classifiable test time series, and leave the rest of the test data unclassified.<!-- more -->


<p>Accuracy is measured using 
$$
 0.5\left(\frac{p}{p+n'}+\frac{n}{n+p'}\right)
$$
where $p=$ true positive, $p'=$ false positive, $n=$ true negative and $n'=$ false negative.

<p>The prizes are:
<ol>
<li> $5000 if using at least 50% of the test samples and achieving 0.75 accuracy.</li>
<li> $15000 if using at least 50% of the test samples and achieving 0.85 or higher.</li>
<li> for any accuracy above 0.75, while using less than 50% of test samples (but at least 25% of test samples), any additional 0.05 increase in accuracy, grants an additional \$2K.  For example, if you use 30\% of test samples, and achieve accuracy of 0.85\%, the price will be \$5K+\$4K=\$9K. </li>
</ol>

The winner will be:
<ul>
<li>
The one with highest accuracy with highest amount of samples <br>
OR</li>
<li>
THE FIRST ONE that achieves 0.85 accuracy with at least 50% of data <br>
OR</li>
<li>
THE FIRST ONE that achieves 0.9 accuracy with at least 30% of data.</li>
</ul>

In the link below you will see a text file that explains the data and how to access it and a png image which explain how the time series to classify was built and how the classes were assigned. The link also includes the actual train and test samples to be used for the challenge and some plots of the time series.

<p><a href="https://drive.google.com/folderview?id=0BxmzB6Xm7Ga1MGxsdlMxbGllZnM&usp;=sharing">https://drive.google.com/folderview?id=0BxmzB6Xm7Ga1MGxsdlMxbGllZnM&usp=sharing</a>

<p>Entries should include:
<ol>
<li> Proof of accuracy</li>
<li> R code which grants the organizer full right to use</li>
<li> R code to support new additional test samples.</li>
</ol>
</blockquote>


The prizes create some strange discontinuities. Someone with accuracy of 0.75 using 50% of the data gets $5K, but someone with accuracy of 0.76 using only 25% of the data gets more. On the other hand, someone using 49% of the test with 0.85 accuracy gets \$9K, but if they use 50% of the test they get \$15K. Surely a continuous bivariate function of accuracy and percentage would have been better.

I also think this would have been better on [Kaggle](http://www.kaggle.com) or [CrowdAnalytix](https://www.crowdanalytix.com/), but instead it has been posted on the [R group on LinkedIn](https://www.linkedin.com/groups/CLASSIFICATION-CHALLENGE-RAISING-BAR-NOW-77616.S.5949829856811307012).

For all further questions, either ask via the comments on [LinkedIn](https://www.linkedin.com/groups/CLASSIFICATION-CHALLENGE-RAISING-BAR-NOW-77616.S.5949829856811307012), or email the organizer [Roni Kass](mailto:kassroni@gmail.com)
