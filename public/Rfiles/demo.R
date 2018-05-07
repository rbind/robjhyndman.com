# Plot data
data(france)
plot(france)
plot(france,series="Female",log=FALSE)

# Lifetable
lifetable(france,years=1990)

# Life expectancy
plot(life.expectancy(france))

# Smooth data
france.sm <- smooth.mortality(france)
plot(france.sm)
plot(france,years=c(1899,1918,1997),type="p",pch=1)
lines(france.sm,years=c(1899,1918,1997))

# Fit FDA model
france.fit <- fmm(france.sm,series="Male",order=2)
summary(france.fit)
plot(france.fit)
plot(residuals(france.fit))

# Forecast with FDA model
france.forecast <- forecast(france.fit,h=50)
plot(france.forecast)

# Forecast lifetables
france.lt <- lifetable(france.forecast)

# Forecast life expectancy
plot(life.expectancy(france.forecast),ylab="Forecast life expectancy",xlab="Year")

# Fit LC and BMS models
france.LC <- lca(france)
france.BMS <- bms(france)
summary(france.LC)
summary(france.BMS)

# Forecast with LC and BMS models
france.fcast.LC <- forecast(france.LC)
france.fcast.BMS <- forecast(france.BMS)
plot(france.fcast.LC)
plot(france.fcast.BMS)

## TEST ON YEARS 1978-1997
## Test order of fit
france.test <- extract.years(france.sm,years=1900:1977)
france.fit1 <- fmm(france.test,order=1)
france.fit2 <- fmm(france.test,order=2)
france.fit3 <- fmm(france.test,order=3)
france.fit4 <- fmm(france.test,order=4)
france.fit5 <- fmm(france.test,order=5)

france.e1 <- compare.mortality(france,forecast(france.fit1,20))
france.e2 <- compare.mortality(france,forecast(france.fit2,20))
france.e3 <- compare.mortality(france,forecast(france.fit3,20))
france.e4 <- compare.mortality(france,forecast(france.fit4,20))
france.e5 <- compare.mortality(france,forecast(france.fit5,20))

france.ISFE <- cbind(france.e1$int.error[,2],france.e2$int.error[,2],
france.e3$int.error[,2],france.e4$int.error[,2],france.e5$int.error[,2])

plot(ts(sqrt(france.ISFE),s=1978),plot.type="single",col=2:6,xlab="h",ylab="Root ISFE",
    main="Root ISFE for different K",xlim=1977+c(1,22),lwd=2,cex=0.7)
for(i in 1:5)
    text(1977+21,sqrt(france.ISFE[20,i]),paste("K=",i))
# Looks like K=2 is ok

plot(france.e2,ylab="Forecast Error",log=FALSE)
abline(0,0)

# Compare with LC and BMS on test set
france.LC1 <- lca(france.test)
france.fcast.LC1 <- forecast(france.LC1,h=20)
france.BMS1 <- bms(france.test)
france.fcast.BMS1 <- forecast(france.BMS1,h=20)

france.e.LC <- compare.mortality(france,france.fcast.LC1)
france.e.BMS <- compare.mortality(france,france.fcast.BMS1)

france.compare <- sqrt(cbind(france.e2$int.error[,2],france.e.LC$int.error[,2],france.e.BMS$int.error[,2]))

plot(ts(france.compare,s=1978),plot.type="single",col=2:6,xlab="h",ylab="Root ISFE",
    main="Root ISFE for different methods",lwd=2)
legend(1978,13,legend=c("FDA","LC","BMS"),col=2:4,lwd=2)
