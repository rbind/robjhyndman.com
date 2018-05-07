---
author: robjhyndman
comments: true
date: 2014-01-24 03:54:34+00:00
mathjax: true
link: https://robjhyndman.com/hyndsight/ljung-box-test/
slug: ljung-box-test
title: Thoughts on the Ljung-Box test
wordpress_id: 2364
categories:
- forecasting
- fpp
- R
- statistics
---

It is common to use a Ljung-Box test to check that the residuals from a time series model resemble white noise. However, there is very little practical advice around about how to choose the number of lags for the test.<!--more-->

The Ljung-Box test was proposed by <a href="http://dx.doi.org/10.1093/biomet/65.2.297" target="_blank">Ljung and Box (Biometrika, 1978)</a>
and is based on the statistic
$$
Q^* = T(T+2)\sum_{k=}^h (T-k)^{-1}r_k^2
$$
where $T$ is the length of the time series, $r_k$ is the $k$th autocorrelation coefficient of the residuals, and $h$ is the number of lags to test. Large values of $Q^*$ indicate that there are significant autocorrelations in the residual series. It can be tested against a $\chi^2$ distribution with $h-K$ degrees of freedom where $K$ is the number of parameters estimated in the model.

In [my forecasting textbook](https://www.otexts.org/fpp/2/6) with George Athanasopoulos, we recommended using $h=10$ for non-seasonal data and $h=2m$ for seasonal data, where $m$ is the period of seasonality. These suggestions were based on power considerations. We want to ensure that $h$ is large enough to capture any meaningful and troublesome correlations. For seasonal data, it is common to have correlations at multiples of the seasonal lag remaining in the residuals, so we wanted to include at least two seasonal lags.

I have not seen similar advice in other time series textbooks; most authors seem to ignore such practical considerations. Patrick Burns in a short [online paper](http://lib.stat.cmu.edu/S/Spoetry/Working/ljungbox.pdf) suggests the rule $h\le 0.05T$ based on a simulation study in which he tests the uniform distribution of $p$-values from the test under the null hypothesis of Gaussian white noise.

I think the latter test is unnecessarily restrictive. In practice, we don't really need the $p$-values to be uniform. What we want is the probability of a p-value being less than the chosen level (say 5%) being equal to that level. That is, the distribution needs to be uniform around the chosen level, but it does not need to be uniform elsewhere.

I have done some simulations to see the effect of different values of $h$. For sample sizes of $T=20, 50,100$ and $1000$, I generated Gaussian white noise series, and computed the p-value from a Ljung-Box test for each generated time series. Then I tested the uniformity of the p-values using a Kolmogorov-Smirnov test (following the approach used by Patrick Burns). Here are the resulting KS p-values based on 10000 simulations for each sample size.

<img class="aligncenter size-large wp-image-2370" alt="kspvalues" src="/files/kspvalues1.png" width="1024" />

Clearly, the p-values fail the uniformity test for all values of $h$ when $T=20$, and for all but a few values of $h$ when $T=50$ and $T=100$. Only when $T=1000$ do the p-values look uniform up to about $h=35$.

However, when we look at the actual size of the test, a different story emerges.

<img class="aligncenter size-full wp-image-2369" alt="actualsize" src="/files/actualsize1.png" width="1024" />

The above figure shows the proportion of Ljung-Box p-values less than 0.05 (top line) and less than 0.01 (bottom line). This demonstrates that the actual size of the test tends to be larger than the nominal size except for small values of $h$. For $h=10$, the actual size is about 0.015 larger than the nominal size when $T=50$ and about 0.01 larger when $T=100$, which is not too bad. For $T=20$, values of $h$ up to about 5 give reasonably good results. For $T=1000$, even using $h=100$ gives results that are not too far away from the nominal size of the test.

This analysis suggests that my rule-of-thumb could be modified a little as follows:

  * For non-seasonal time series, use $h=\min(10, T/5)$.
  * For seasonal time series, use $h=\min(2m, T/5)$.

It also shows that you should not be too fussy about the boundary. Because the actual size is a little larger than the nominal size for these values of $h$, you should expect a few more failures of the test than 5%. Further, it is always worth remembering Box's own advice that "All models are wrong, but some are useful." So we expect the residuals to fail this test when we have sufficient data. That just shows that the model has not perfectly captured the information in the data. The only question is whether you can come up with a better model. Sometimes that just isn't possible.</span>

# R code
In case any reader wants to play with some more simulations, here is my R code.

```{r echo=TRUE, eval=FALSE}
lj <- array(NA, c(4,10000,100))
size <- c(20,50,100,1000)

for(i in 1:10000)
{
  for(k in 1:4)
  {
    x <- rnorm(size[k])
    for(j in 1:min(100,size[k]))
      lj[k,i,j] <- Box.test(x, type="Ljung-Box", lag=j)$p.value
  }
}

ks.pvalue <- function(x)
{
  x <- na.omit(x)
  if(length(x)>1)
    return(ks.test(x, punif)$p.value)
  else
    return(NA)
}

testsize <- apply(lj, c(1,3), FUN=ks.pvalue)

par(mfrow=c(2,2))
plot(1:20,testsize[1,1:20],type="l", xlab="Number of lags", main="T=20", ylab="KS p-value", ylim=c(0,1))
abline(h=0.05,col="gray")

plot(1:50,testsize[2,1:50], type="l", xlab="Number of lags", main="T=50", ylab="KS p-value", ylim=c(0,1))
abline(h=0.05,col="gray")

plot(1:100,testsize[3,1:100], type="l", xlab="Number of lags", main="T=100", ylab="KS p-value", ylim=c(0,1))
abline(h=0.05,col="gray")

plot(1:100,testsize[4,1:100], type="l", xlab="Number of lags", main="T=1000", ylab="KS p-value", ylim=c(0,1))
abline(h=0.05,col="gray")

pv<- function(x, threshold=0.05)
{
  mean(x < threshold, na.rm=TRUE)
}

testsize <- apply(lj, c(1,3), FUN=pv)
testsize1 <- apply(lj, c(1,3), FUN=pv, threshold=0.01)

par(mfrow=c(2,2))
plot(1:20,testsize[1,1:20],type="n", main="T=20", xlab="Number of lags", ylab="Actual size", ylim=c(0,0.12))
axis(2, at=seq(0,0.1,by=0.01))
abline(h=c(0.01,0.05),col=gray(0.6))
lines(1:20, testsize[1,1:20])
lines(1:20, testsize1[1,1:20])

plot(1:50,testsize[2,1:50], type="n", main="T=50", xlab="Number of lags", ylab="Actual size", ylim=c(0,0.12))
axis(2, at=seq(0,0.1,by=0.01))
abline(h=c(0.01,0.05),col=gray(0.6))
lines(1:50, testsize[2,1:50])
lines(1:50, testsize1[2,1:50])

plot(1:100,testsize[3,1:100], type="n", main="T=100", xlab="Number of lags", ylab="Actual size", ylim=c(0,0.12))
axis(2, at=seq(0,0.1,by=0.01))
abline(h=c(0.01,0.05),col=gray(0.6))
lines(1:100, testsize[3,1:100])
lines(1:100, testsize1[3,1:100])

plot(1:100,testsize[4,1:100], type="n", main="T=1000", xlab="Number of lags", ylab="Actual size", ylim=c(0,0.12))
axis(2, at=seq(0,0.1,by=0.01))
abline(h=c(0.01,0.05),col=gray(0.6))
lines(1:100, testsize[4,1:100])
lines(1:100, testsize1[4,1:100])
```

# Reference:

[G. M. Ljung; G. E. P. Box (1978). "On a Measure of a Lack of Fit in Time Series Models". *Biometrika*, **65**(2), 297–303.](http://dx.doi.org/10.1093/biomet/65.2.297)
