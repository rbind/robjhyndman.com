require(demography)

##########################
#### FRENCH MORTALITY ####
##########################

# Plot data
plot(fr.mort,series="male")

# Figure 1 : B&W version for paper with only a few years
plot(fr.mort,series="male",
    years=c(1899,1918,1957,1977,1997),type="p",cex=0.6,col=1,pch=c(1,15,22,2,16),
    main="France: Male death rates")
legend(5,1.5,legend=paste(c(1899,1918,1957,1977,1997)),col=1,pch=c(1,15,22,2,16),cex=0.8)

# Smoothing
france.sm <- smooth.demogdata(fr.mort,obs.var="theoretical")
i=c(1901,1973);plot(fr.mort,years=i,type="p",pch=1);lines(france.sm,years=i)

# Fit model to data up to 2001.
france.short <- extract.years(france.sm,1899:2001)
frmort.fit <- fdm(france.short,series="Male",order=4,lambda=3,max.age=110,method="M")
frmort.fcast <- forecast(frmort.fit,h=50,method="arima",level=80,adjust=FALSE)

# Figure 6: fitted basis functions and forecast coefficients
plot(frmort.fcast,"c",ylab1="B",ylab2="C",mean.lab="mux",main.title="",
    interaction.title="",shadecol=gray(0.9),fcol="black",outlier.col=1,outlier.pch=18)

# Forecasts with prediction intervals
years <- 2001+c(1,20)
plot(frmort.fcast,series="Male",years=years,ylim=c(-9.7,0),lty=1:2,col=1,max.age=109)
lines(frmort.fcast,series="upper",years=years,lty=1:2,col=1,max.age=109)
lines(frmort.fcast,series="lower",years=years,lty=1:2,col=1,max.age=109)
legend(0,0,legend=paste(years),lty=1:2,cex=0.7)

plot(frmort.fcast,series="Male",years=years,lty=1:2,col=1,max.age=100,transform=FALSE)
lines(frmort.fcast,series="upper",years=years,transform=FALSE,lty=1:2,col=1,max.age=100)
lines(frmort.fcast,series="lower",years=years,transform=FALSE,lty=1:2,col=1,max.age=100)
legend(0,0.43,legend=paste(years),lty=1:2,cex=0.7)
rm(years)


##############################
#### AUSTRALIAN FERTILITY ####
##############################

# Use data up to 2000
aus.fert$lambda <- 0 # Use logs for transformation
ausfert <- extract.years(aus.fert,1921:2000)
ausfert$rate$female <- rbind(rep(0.005,80),ausfert$rate$female,rep(0.005,80))
ausfert$pop$female <- rbind(ausfert$pop$female[1,],ausfert$pop$female,ausfert$pop$female[7,])
rownames(ausfert$rate$female) <- rownames(ausfert$pop$female) <- c("<15","15-19","20-24","25-29","30-34","35-39","40-44","45-49",">49")
ausfert$age <- c(13,17,22,27,32,37,42,47,52)

# Figure 2: plot separate time series for each age group
plot(aus.fert,plot.type="time",xlim=c(1920,2005),lty=1:7,show.labels=FALSE,transform=TRUE)
text(rep(2004,7)-c(0,0,8,8,0,0,0),log(aus.fert$rate[[1]])[,80]+c(0,.1,.4,-.2,-.1,0,0),
    rownames(aus.fert$rate$female),cex=0.7)

# Figure 2. published version
plot(aus.fert,years=1921:2000,plot.type="time",xlim=c(1920,2005),lty=1:7,show.labels=FALSE,col=1,transform=TRUE,main="",xlab="Year")
text(rep(2004,7)-c(0,0,8,8,0,0,0),log(aus.fert$rate[[1]])[,80]+c(0,.1,.4,-.2,-.1,0,0),
    rownames(aus.fert$rate$female),cex=0.7)

# Smooth data
fert.sm <- smooth.demogdata(ausfert,age.grid=13:52,obs.var="theoretical")
plot(fert.sm,transform=TRUE);points(ausfert,transform=TRUE)

# Plot of smoothed data
years=c(1921,1940,1960,1980,2000)
plot(fert.sm,years=years,col=1:5,main="")
points(ausfert,years=years,pch=1,col=1:5,cex=0.6)
legend("topright",legend=paste(years),lty=1,col=1:5,cex=0.9)

plot(fert.sm,years=years,col=1:5,main="",transform=TRUE)
points(ausfert,years=years,pch=1,col=1:5,cex=0.6,transform=TRUE)
legend("topright",legend=paste(years),lty=1,col=1:5,cex=0.9)

# Figure 3:
plot(fert.sm,years=years,lty=1:5,col=1,main="",transform=TRUE)
points(ausfert,years=years,pch=1,col=1,cex=0.6,transform=TRUE)
legend(20,-1,legend=paste(years),lty=1:5,cex=0.9)
rm(years)

# Fit model and forecasting using ARIMA
ausfert.fit <- fdm(fert.sm,order=3,method="classical")
fert.fcast <- forecast(ausfert.fit,h=20,level=80,method="arima",adjust=FALSE)

# Figure 4: Plot of forecast coefficients
plot(fert.fcast,plot.type="c",ylab2="C",ylab1="B",mean.lab="mux",main.title="",interaction.title="",shadecols=gray(0.9),fcol=1)

# Figure 5: Plot of forecast curves
years=2000+c(1,20)
plot(fert.fcast,years=years,lty=1:2,col=1,ylim=c(0,160),yaxs="i",main="")
lines(fert.fcast,series="upper",years=years,lty=1:2,col=1)
lines(fert.fcast,series="lower",years=years,lty=1:2,col=1)
legend(15,145,legend=paste(years),lty=1:2,cex=0.7)
rm(years)
