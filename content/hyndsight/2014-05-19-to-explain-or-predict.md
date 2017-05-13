---
author: robjhyndman
comments: true
date: 2014-05-19 05:35:33+00:00

link: https://robjhyndman.com/hyndsight/to-explain-or-predict/
slug: to-explain-or-predict
title: To explain or predict?
wordpress_id: 2746
categories:
- econometrics
- forecasting
- references
- research team
- statistics
---

Last week, my research group discussed Galit Shmueli's paper ["To explain or to predict?", _Statistical Science_, **25**(3), 289-310.](http://dx.doi.org/10.1214/10-STS330) (See [her website for further materials](http://www.galitshmueli.com/content/explain-or-predict).) This is a paper everyone doing statistics and econometrics should read as it helps to clarify a distinction that is often blurred. In the discussion, the following issues were covered amongst other things.




    
  1. The AIC is better suited to model selection for prediction as it is asymptotically equivalent to leave-one-out cross-validation in regression, or one-step-cross-validation in time series. On the other hand, it might be argued that the BIC is better suited to model selection for explanation, as it is consistent.

    
  2. P-values are associated with explanation, not prediction. It makes little sense to use p-values to determine the variables in a model that is being used for prediction. (There are problems in using p-values for variable selection in any context, but that is a different issue.)

    
  3. Multicollinearity has a very different impact if your goal is prediction from when your goal is estimation. When predicting, multicollinearity is not really a problem provided the values of your predictors lie within the hyper-region of the predictors used when estimating the model.

    
  4. An ARIMA model has no explanatory use, but is great at short-term prediction.

    
  5. How to handle missing values in regression is different in a predictive context compared to an explanatory context. For example, when building an explanatory model, we could just use all the data for which we have complete observations (assuming there is no systematic nature to the missingness). But when predicting, you need to be able to predict using whatever data you have. So you might have to build several models, with different numbers of predictors, to allow for different variables being missing.

    
  6. Many statistics and econometrics textbooks fail to observe these distinctions. In fact, a lot of statisticians and econometricians are trained only in the explanation paradigm, with prediction an afterthought. That is unfortunate as most applied work these days requires predictive modelling, rather than explanatory modelling.






