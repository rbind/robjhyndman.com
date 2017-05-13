---
author: robjhyndman
comments: true
date: 2014-07-21 03:24:09+00:00

link: https://robjhyndman.com/hyndsight/statistics-vs-econometrics/
slug: statistics-vs-econometrics
title: I am not an econometrician
wordpress_id: 2797
categories:
- econometrics
- Monash University
- statistics
---

I am a statistician, but I have worked in a department of predominantly econometricians for the past 17 years. It is a little like an Australian visiting the United States. Initially, it seems that we talk the same language, do the same sorts of things, and have a very similar culture. But the longer you stay there, the more you realise there are differences that run deep and affect the way you see the world.

Last week at my research group meeting, I spoke about some of the differences I have noticed. Coincidentally, Andrew Gelman [blogged about the same issue](http://andrewgelman.com/2014/07/18/differences-econometrics-statistics-varying-treatment-effects-utilities-economists-seem-like-models-fixed-stone-statisticians-tend-comfortable-w/) a day later.<!-- more -->



### Theory-driven or data-driven



Econometrics is often “theory driven” while statistics tends to be “data driven”. I discovered this in the interview for my current job when someone criticized my research for being “data driven” and asked me to respond. I was confused because I thought statistical research _should_ be driven by data analytic issues, not by some pre-conceived theory, but that was not the perspective of the people interviewing me. (Fortunately, I was hired anyway.) Typically, econometricians test theory using data, but often do little if any exploratory data analysis. On the other hand, I tend to build models after looking at data sets. I think this distinction also extends to many other areas where statistics is applied.

As a result of this distinction, econometricians do a lot of hypothesis testing but produce few graphics. Many research seminars in our department involve someone describing a model, applying it to some data, and showing the estimated parameters, standard errors, results of various hypothesis tests, etc. They do all that without ever plotting the data to start with! This seems bizarre to me, and I still get annoyed about it even though I’ve seen it at least a hundred times. I teach my students to first spend time getting to know their data through plots and other data visualization methods before even thinking about fitting a model or doing a hypothesis test.

Probably because of the emphasis that econometricians place on their theoretical models, they tend to fall in love with them and even seem to believe they are true. This is evident by the phrase “data generating process” (or its acronym DGP) that econometricians commonly use to describe a statistical model. I never think of my models as data generating processes. The data come from some real world, complicated, messy, nonlinear, nonstationary, nonGaussian process. At best, my model is a crude approximation. I often cite Box’s maxim that “All models are wrong, but some are useful”, and while my colleagues would agree in principle, they still behave as if their models are the true data generating processes.



### Expertise and ignorance



When I first joined an econometrics department, I was struck by how much everyone knew about time series and regression, and how little they knew about a lot of other topics. There are vast areas of statistics that econometricians typically know little about including survey sampling, discriminant analysis, clustering, and the design of experiments. My training was much broader but in some ways shallower. There were standard undergraduate topics in econometrics that I knew nothing about — cointegration, endogeneity, ARCH/GARCH models, seemingly unrelated regression, the generalized methods of moments, and so on.

Because of the nature of economic data, econometricians have developed some specific techniques for handling time series and regression problems. In particular, econometricians have thought very carefully about causality, because it is usually not possible to conduct experiments within economics and finance, and so they have developed several methods to help identify potentially causal relationships. These developments do not always filter back to the general statistical community, although they can be very useful. For example, the method of instrumental variables (which allows consistent estimation when the explanatory variables are correlated with the error term of a regression model) can be used to help identify potentially causal relationships. Tests for “Granger causality”are another useful econometric development.

For some reason, econometricians have never really taken on the benefits of the generalized linear modelling framework. So you are more likely to see an econometrician use a probit model than a logistic regression, for example. Probit models tended to go out of fashion in statistics after the GLM revolution prompted by [Nelder and Wedderburn (1972)](http://dx.doi.org/10.2307%2F2344614).



### Confusing terminology



The two communities have developed their own sets of terminology that can be confusing. Sometimes they have different terms for the same concept; for example, “longitudinal data” in statistics is “panel data” in econometrics; “survival analysis” in statistics is “duration modelling” in microeconometrics.

In other areas, they use the same term for different concepts. For example, a “robust” estimator in statistics is one that is insensitive to outliers, whereas a “robust” estimator in econometrics is insensitive to heteroskedasticity and autocorrelation. A “fixed effect” in statistics is a non-random regression term, while a “fixed effect” in econometrics means that the coefficients in a regression model are time-invariant. This obviously has the potential for great confusion, which is evident in the Wikipedia articles on [fixed effects](http://en.wikipedia.org/wiki/Fixed_effects) and [robust regression](http://en.wikipedia.org/wiki/Robust_regression).



### Avoid silos



I’ve stayed in a (mostly) econometrics department for so long because it is a great place to work, full of very nice people, and is much better funded than most statistics departments. I’ve also learned a lot, and I think the department has benefited from having a broader statistical influence than if they had only employed econometricians.

I would encourage econometricians to read outside the econometrics literature so they are aware of what is going on in the broader statistical community. These days, most research econometricians do pay some attention to [_JASA_](http://www.tandfonline.com/toc/uasa20/current) and [_JRSSB_](http://onlinelibrary.wiley.com/journal/10.1111/(ISSN)1467-9868), so the gap between the research communities is shrinking. However, I would suggest that econometricians add [_Statistical Science_](http://www.imstat.org/sts/) and [_JCGS_](http://www.tandfonline.com/toc/ucgs20/current) to their reading list, to get a wider perspective.

I would encourage statisticians to keep abreast of methodological developments in econometrics. A good place to start is [Hayashi's graduate textbook _Econometrics_](http://amzn.com/0691010188/?tag=otexts-20) which we use at Monash for our PhD students.



### The gap is closing



One thing I have noticed in the last seventeen years is that the two communities are not so far apart as they once were. Nonparametric methods were once hardly mentioned in econometrics (too “data-driven”), and now the main econometrics journals are full of nonparametric asymptotics. There are special issues of statistical journals dedicated to econometrics (e.g., CSDA has regular special issues dedicated to computational econometrics).

Just as US television has made the Australian culture rather less distinctive than it once was, statistical ideas are infiltrating econometrics, and vice-versa. But until I hear a research seminar on Visualization of Macroeconomic Data, I don't think I will ever feel entirely at home.



* * *



Some of these thoughts were prompted by [this discussion on crossvalidated.com](http://stats.stackexchange.com/q/27662/159).

The article has been updated to reflect some of the comments made below. Thanks for the feedback.
