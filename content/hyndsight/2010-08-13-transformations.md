---
author: robjhyndman
comments: true
date: 2010-08-13 04:22:21+00:00
mathjax: true
link: https://robjhyndman.com/hyndsight/transformations/
slug: transformations
title: Transforming data with zeros
wordpress_id: 900
categories:
- statistics
---

I'm currently working with a hydrologist and he raised a question that occurs quite frequently with real data --- what do you do when the data look like they need a log transformation, but there are zero values?

I asked the question on [stats.stackexchange.com](http://stats.stackexchange.com/q/1444/159) and received some useful suggestions. What follows is a summary based on these answers, my own experience, plus a few papers I discovered that deal with the topic. In general, the most appropriate course of action depends on the model and the context. Zeros can arise for several different reasons each of which may have to be treated differently.



### Box-Cox (BC) transformations



There is a two-parameter version of the Box-Cox transformation that allows a shift before transformation:
$$
g(y;\lambda\_{1}, \lambda\_{2}) =
\begin{cases}
\frac {(y+\lambda\_{2})^{\lambda\_1} - 1} {\lambda\_{1}} & \mbox{when } \lambda\_{1} \neq 0 \\\\ \log (y + \lambda\_{2}) & \mbox{when } \lambda\_{1} = 0
\end{cases}.
$$
The usual Box-Cox transformation sets $\lambda\_2=0$. One common choice with the two-parameter version is $\lambda\_1=0$ and $\lambda\_2=1$ which has the neat property of mapping zero to zero. There is even an R function for this: `log1p()`.  More generally, both parameters can be estimated. In R, the `boxcox.fit()` function in package [`geoR`](http://cran.r-project.org/web/packages/geoR/) will fit the parameters.

Alternatively, when $\lambda\_1=0$, [it has been suggested](http://www.mail-archive.com/r-sig-ecology@r-project.org/msg00655.html) that $\lambda\_2$ should be approximately one half of the smallest, non-zero value. Another suggestion is that $\lambda\_2$ should be the square of the first quartile divided by the third quartile [(Stahel,  2002)](http://stat.ethz.ch/~stahel/stat-dat-ana/).

I've used functions like this several times including in [Hyndman & Grunwald (2000)](/publications/gam-rainfall/) where we used $\log(y+\lambda_2)$ applied to daily rainfall data.

One simple special case is the square root where $\lambda_2=0$ and $\lambda_1=0.5$. This works fine with zeros (although not with negative values). However, often the square root is not a strong enough transformation to deal with the high levels of skewness seen in real data.



### Inverse hyperbolic sine (IHS) transformation



An alternative transformation family was proposed by <a href="http://biomet.oxfordjournals.org/cgi/reprint/36/1-2/149">Johnson (1949)</a> and is defined by
$$f(y,\theta) = \text{sinh}^{-1}(\theta y)/\theta = \log\left(\theta y + (\theta^2   y^2 {+ 1})^{{1 / 2}}\right)/\theta,$$
where $\theta > 0$. For any value of $\theta$, zero maps to zero. There is also a two parameter version allowing a shift, just as with the two-parameter BC transformation. [Burbidge, Magee and Robb (1988)](http://www.jstor.org/pss/2288929) also discuss the IHS transformation including estimation of $\theta.$

The IHS transformation works with data defined on the whole real line including negative values and zeros. For large values of $y$ it behaves like a log transformation, regardless of the value of $\theta$ (except 0). As $\theta\rightarrow0$, $f(y,\theta)\rightarrow y$.



### Mixture models



For continuous data, there can be a discrete spike at zero which can be associated with the sensitivity of the measurements. For example in wind energy, wind below 2m/s is often recorded as zero and the distribution of wind energy produced is continuous with a spike at zero.

With rainfall data, there is a spike at zero for a different reason -- it didn't rain. These are genuine zeros (rather than indetectably small values).

With insurance data, a similar phenomenon occurs -- the distribution of claims is continuous with a large spike at zero.

A fourth example might be income data -- zero if someone is not in paid work, but a continuous positive value otherwise.

In each of these cases, a mixture model is probably the most appropriate where part of the model determines the probability of a zero, and the other part of the model determines the distribution of the data when it is positive. We also used something like this in [Hyndman and Grunwald (2000)](/publications/gam-rainfall/).
