---
author: robjhyndman
comments: true
date: 2014-05-26 02:42:44+00:00

link: https://robjhyndman.com/hyndsight/marketplaces/
slug: marketplaces
title: Data science market places
wordpress_id: 2754
categories:
- computing
- consulting
- data science
- forecasting
- jobs
- statistics
---

Some new websites are being established offering "market places" for data science. Two I've come across recently are Experfy and SnapAnalytx.<!-- more -->

**[Experfy](http://www.experfy.com)** provides a way for companies to find statisticians and other data scientists, either for short-term consultancies, or to fill full-time positions. They describe their "providers" as "Data Engineers, Data Scientists, Data Mining Experts, Data Analyst/Modelers, Big Data Solutions Architects, Visualization Designers, Statisticians, Applied Physicists, Mathematicians, Econometricians and Bioinformaticians." Data scientists can sign up as "Providers", companies can sign up as "Clients".

Experfy makes money by taking a cut of any transaction made on the site.

Providers are subject to a selection process, although it is not clear what the criteria are. I heard about Experfy because they invited me to be a provider. I have far too much work already without needing more, but it looks like an interesting and useful service.

Experfy is a more specialized version of [Zombal](http://zombal.com/) which covers science professionals generally, and not just data scientists.

**[SnapAnalytx](http://snapanalytx.com)** takes a different approach where data scientists can post their algorithms which are then hosted on the site. Then anyone wanting to use the algorithm can upload their own data, train the model and get predictions. The "model author" can interact with the users on the site. So essentially SnapAnalytx provides the cloud hosting and computing infrastructure, and a way for data scientists and their clients to interact online.

The "unit" for sale with SnapAnalytx is a model or algorithm, whereas the "unit" for sale with Experfy is a person.

I imagine that the SnapAnalytx approach would be more suited to some problems than others. My algorithm for [hierarchical forecasting](/publications/foresight-hts/) would probably work well on such a platform as it takes a lot of computing power (for large hierarchies) and is suited to parallel processing. (I assume SnapAnalytx allows multiple processes.) It also works out-of-the-box for a lot of problems.

On the other hand, my algorithm for [electricity demand forecasting](/publications/mefm/) would probably not work well on this platform as we have to tailor the model carefully to each particular region, so having a generic cloud-hosted algorithm is unlikely to give effective forecasts.

SnapAnalytx makes money from both model providers and model users. They charge $99 per month per model to providers to list models in the catalog (which seems to me like a huge cost, but perhaps there is a lot of manual work in setting up every model), and then each user is charged a fee for using the model. SnapAnalytx retains part of the user fees, and the rest goes to the model provider.

It will be interesting to see if these market places survive, and if any competition develops. Feel free to add links to competing services, or other data science market places in the comments below.
