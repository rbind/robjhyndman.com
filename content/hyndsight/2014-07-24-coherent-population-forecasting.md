---
author: robjhyndman
comments: true
date: 2014-07-24 02:03:01+00:00

link: https://robjhyndman.com/hyndsight/coherent-population-forecasting/
slug: coherent-population-forecasting
title: Coherent population forecasting using R
wordpress_id: 2816
categories:
- demography
- forecasting
- R
- statistics
---

This is an example of how to use the demography package in R for stochastic population forecasting with coherent components. It is based on the papers by [Hyndman and Booth (IJF 2008)](/publications/stochastic-population-forecasts/) and [Hyndman, Booth and Yasmeen (Demography 2013)](/publications/coherentfdm/). I will use Australian data from 1950 to 2009 and forecast the next 50 years.

In demography, "coherent" forecasts are where male and females (or other sub-groups) do not diverge over time. (Essentially, we require the difference between the groups to be stationary.) When we wrote the 2008 paper, we did not know how to constrain the forecasts to be coherent in a functional data context and so this was not discussed. My later 2013 paper provided a way of imposing coherence. This blog post shows how to implement both ideas using R.<!-- more -->



### Download data



First we need to get the historical mortality rates and the fertility rates, and the population data for 1 January in the year after the final mortality and fertility rates. As there are mortality data up to 2009 easily available for Australia, I will use population data for 1 January 2010 for this example.

The population and mortality data can be obtained from the [Human Mortality Database](http://www.mortality.org). You need a username and password, but registration is free.


    
    
    library(demography)
    
    # Get population data for 1 Jan 2010
    pop2010 <- hmd.pop("AUS",username,password,"Australia")
    pop2010 <- extract.ages(pop2010, age=0:100)
    
    # Get mortality data
    aus.mort <- hmd.mx("AUS",username,password,"Australia")
    aus.mort <- extract.years(extract.ages(aus.mort, 0:100, 
                  combine.upper=FALSE), year=1950:max(aus.mort$year))
    



The fertility data for some countries is available on the [Human Fertility Database](http://www.humanfertility.org), but not for Australia. Instead, I have obtained the data from the Australian Bureau of Statistics and made them available in an R workspace (along with `pop2010` and `aus.mort`). [Download it here](https://robjhyndman.com/Rfiles/ausdata.RData).

Now we can construct the net migration data as the differences between the populations in consecutive years, taking account of any deaths or births.


    
    
    ##### Compute net migration
    aus.mig <- netmigration(aus.mort, aus.fert, mfratio = 1.05)
    



Before continuing, it is important to plot the data to make sure everything looks in order.


    
    
    ## Population
    plot(pop2010,series="male")
    plot(pop2010,series="female")
    # Mortality
    plot(aus.mort,'male',ylim=c(-10.4,-0.5))
    plot(aus.mort,'female',ylim=c(-10.4,-0.5))
    # Fertility
    plot(aus.fert)
    # Net migration
    plot(aus.mig,'male',ylim=c(-4100,7800))
    plot(aus.mig,'female',ylim=c(-4100,7800))
    







### Smoothing step



Next we smooth all data using penalized regression splines.


    
    
    ausmort.sm <- smooth.demogdata(aus.mort, obs.var="theoretical")
    ausfert.sm <- smooth.demogdata(aus.fert, obs.var="theoretical")
    ausmig.sm <- smooth.demogdata(aus.mig)
    







### Modelling step



Now we are ready to fit some functional data models. This part is different from the approach in Hyndman and Booth (2008) as we can now fit coherent models to prevent forecasts of the two sexes from diverging.


    
    
    # MORTALITY
    mort.fit <- coherentfdm(ausmort.sm)
    
    plot(residuals(mort.fit$product))
    plot(residuals(mort.fit$ratio$male))
    
    # FERTILITY
    fert.fit <- fdm(ausfert.sm)
    plot(residuals(fert.fit))
    
    # MIGRATION
    mig.fit <- coherentfdm(ausmig.sm)
    plot(residuals(mig.fit$product))
    plot(residuals(mig.fit$ratio$male))
    



The residuals for each model are plotted to ensure things look ok. In fact, the fertility residuals show up some weird problems with the data, but I'll ignore that for now and proceed.

Although the components of migration are called "product" and "ratio", they are actually sums and differences as we do not use a log transformation for migration.



### Forecasting step



Next we fit forecasting models to the coefficients of each functional data model. Some plots are produced in each case to check that the results look reasonable.


    
    
    # Mortality
    mortf <- forecast(mort.fit, h=50, max.d=1)
    
    plot(mortf$product, 'c', comp=2)
    plot(mort.fit$product$y, col='gray', ylim=c(-11,-0.5),
      main="Mortality forecasts product: 2010-2059")
    lines(mortf$product)
    
    plot(mortf$ratio$male, 'c', comp=2)
    plot(mort.fit$ratio$male$y,col='gray',
      main="Mortality forecasts ratio (M/F): 2010-2059")
    lines(mortf$ratio$male)
    
    # Fertility
    fertf <- forecast(fert.fit, h=50,max.d=1)
    
    plot(fertf, 'c', comp=2)
    plot(ausfert.sm,col='gray', main="Fertility forecasts: 2010-2059")
    lines(fertf)
    
    # Migration
    migf <- forecast(mig.fit, h=50, stationary=TRUE)
    
    plot(migf$product, 'c', comp=2)
    plot(mig.fit$product$y, col='gray',
      main="Migration forecasts product: 2010-2059")
    lines(migf$product)
    
    plot(migf$ratio$male, 'c', comp=2)
    plot(mig.fit$ratio$male$y, col='gray',
      main="Migration forecasts ratio (M/F): 2010-2059")
    lines(migf$ratio$male)
    





### Simulation step



Finally we can simulate future populations


    
    
    aus.sim <- pop.sim(mortf, fertf, migf, firstyearpop=pop2010, N=1000)
    



The value of `N` determines the number of sample paths to simulate. I normally set to a very low number (e.g., 5) at first initially to ensure there are no bugs in the code and that the results look reasonable. Then I set it to at least 1000 and leave it to run while I make myself a coffee.

The object `aus.sim` is a list of two arrays of dimension 101 x 50 x `N`, one for males and one for females. The first dimension is age groups (0:100), the second dimension is the forecast horizon (2010:2059), while the third dimension gives simulated replicates.



### Using the results



The simulations can be used to compute any quantities that can be derived from populations numbers by sex and age. For example, the mean male population for each age for the next 50 years:


    
    
    popm.mean <- apply(aus.sim$male,c(1,2),mean)
    



We can also plot population pyramids with prediction intervals.


    
    
    ## Means and intervals
    popm.mean <- apply(aus.sim$male,c(1,2),mean)
    popm.lo <- apply(aus.sim$male,c(1,2),quantile,p=.1)
    popm.hi <- apply(aus.sim$male,c(1,2),quantile,p=.9)
    popf.mean <- apply(aus.sim$female,c(1,2),mean)
    popf.lo <- apply(aus.sim$female,c(1,2),quantile,p=.1)
    popf.hi <- apply(aus.sim$female,c(1,2),quantile,p=.9)
    
    ##plot of total population age structure in 2030
    par(mar=c(4.3,3.9,3.0,3.6))
    plot(c(0,100),c(0,100),type="n", main="Forecast population: 2030",
      yaxt="n", xlab="Population ('000)",ylab="Age",xaxt="n",
      xlim=c(-1,1)*max(abs(popm.hi[,20]),abs(popf.hi[,20]))/1e3)
    mtext("Male                       Female")
    abline(v=0)
    axis(1,at=seq(-300,0,by=50),labels=rev(seq(0,300,by=50)))
    axis(1,at=seq(50,300,by=50))
    axis(2,at=seq(0,100,by=10),labels=seq(0,100,by=10))
    axis(4,at=seq(0,100,by=10),labels=seq(0,100,by=10))
    axis(2,at=seq(0,100,by=20),labels=seq(0,100,by=20))
    axis(4,at=seq(0,100,by=20),labels=seq(0,100,by=20))
    axis(4,at=50,line=1.5,labels="Age",col=2,tick=FALSE)
    polygon(c(-popm.lo[,20],rev(-popm.hi[,20]))/1000,c(0:100,100:0),
            col=rgb(0,0,1,alpha=.4),border=FALSE)
    polygon(c(popf.lo[,20],rev(popf.hi[,20]))/1000,c(0:100,100:0),
            col=rgb(0,0,1,alpha=.4),border=FALSE)
    lines(-popm.mean[,20]/1000,0:100,col="blue",lwd=2)
    lines(popf.mean[,20]/1000,0:100,col="blue",lwd=2)
    



[![2030pyramid](/files/2030pyramid.png)](/files/2030pyramid.png)
The shaded blue regions denote 80% prediction intervals for each age. Notice how certain we can be of the elderly population even twenty years ahead (due to the predictability of mortality rates) but how uncertain we are of the future young population (due to the lack of predictability in fertility rates).
