require(addb)

# AUSTRALIAN MORTALITY
aus <- extract.years(australia,years=1921:2000)
aus.sm <- smooth.demogdata(aus)

plot(aus,year=2000,series="male",type="p",pch=1)
lines(aus.sm,year=2000,series="male",col=2)

plot(aus)
plot(aus.sm)

ausmort.fit <- fdm(aus.sm,order=2,series="male",method="classical")
ausmort.fcast <- forecast(ausmort.fit)
plot(ausmort.fcast,'c')

plot(ausmort.fcast)
plot(ausmort.fcast,transform=FALSE)
plot(residuals(ausmort.fit))

# AUSTRALIAN FERTILITY
ausfert <- extract.years(aus.fert,years=1921:2000)

plot(ausfert,plot.type="time")

ausf.sm <- smooth.demogdata(ausfert)

years <- c(1921,1940,1960,1980,2000)
plot(ausf.sm,years=years,lwd=2,transform=TRUE)
points(ausfert,years=years,pch=18,transform=TRUE)
legend("topright",legend=paste(years),col=rainbow(6),lty=1,lwd=2)

par(mfrow=c(1,2))
plot(ausf.sm,transform=TRUE)
plot(ausf.sm,transform=FALSE)

ausf.fit <- fdm(ausf.sm,order=3,method="classical")
ausf.fcast <- forecast(ausf.fit,h=50)

plot(ausf.fcast,'c')

par(mfrow=c(1,2))
plot(ausf.fcast,transform=TRUE)
plot(ausf.fcast)

par(mfrow=c(1,1))
plot(residuals(ausf.fit))
