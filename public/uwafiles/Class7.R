library(fpp)

require(fpp)


## AR

plot(10+arima.sim(list(ar=-.8),n=100),ylab="",main="AR(1)")
plot(20+arima.sim(list(ar=c(1.3,-0.7)),n=100),ylab="",main="AR(2)")

plot(5+arima.sim(list(ar=.7),n=100),ylab="",main="MA(1)")
plot(arima.sim(list(ma=c(-1,+0.8)),n=100),ylab="",main="MA(2)")

# US consumption example
plot(usconsumption[,1],xlab="Year",ylab="Quarterly percentage change",main="US consumption")

fit <- auto.arima(usconsumption[,1],max.P=0,max.Q=0,D=0)

plot(forecast(fit,h=10),include=80)

Acf(usconsumption[,1])
Pacf(usconsumption[,1])

tsdisplay(mink)

# Internet example
tsdisplay(internet)
adf.test(internet)
kpss.test(internet)
kpss.test(diff(internet))
tsdisplay(diff(internet))
fit <- Arima(internet,order=c(3,1,0))
fit2 <- auto.arima(internet)
fit2 <- auto.arima(internet,stepwise=FALSE)
Acf(residuals(fit))
Box.test(residuals(fit), fitdf=3, lag=10, type="Ljung")
forecast(fit)
plot(forecast(fit))

## elec equipment

eeadj <- seasadj(stl(elecequip, s.window="periodic"))

plot(eeadj,ylab="Seasonally adjusted new orders index",xlab="Year")

tsdisplay(diff(eeadj),main="")

# Try some models
Arima(eeadj,c(3,1,0))
Arima(eeadj,c(3,1,1))
Arima(eeadj,c(4,1,0))
Arima(eeadj,c(2,1,0))

auto.arima(eeadj,D=0,max.P=0,max.Q=0,stepwise=FALSE,approximation=FALSE,trace=TRUE)

fit <- Arima(eeadj,c(3,1,1))

Acf(residuals(fit))
Box.test(residuals(fit), lag=24, fitdf=4, type="Ljung")

plot(forecast(fit))

