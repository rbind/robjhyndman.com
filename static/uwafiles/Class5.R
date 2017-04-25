library(fpp)


##### Time series Decomposition

## Euro electrical equipment

plot(elecequip)

fit <- stl(elecequip, s.window=5)
plot(fit)
monthplot(fit$time.series[,'seasonal'], ylab='Seasonal')

fit <- stl(elecequip, t.window=15, s.window='periodic', robust=TRUE)
plot(fit)
monthplot(fit$time.series[,'seasonal'], ylab='Seasonal')

plot(naive(seasadj(fit)))
plot(forecast(fit,method='naive'))



## Housing sales

plot(decompose(hsales))
plot(stl(hsales, s.window="periodic"))
plot(stl(hsales, s.window=15))

fit <- stl(hsales,s.window=15)

plot(hsales,col="gray",main="Sales of new one-family houses, USA",ylab="Total sales",xlab="")
lines(fit$time.series[,2],col=2,ylab="Trend")

par(mfrow=c(2,1))
plot(hsales,ylab="Data")
plot(fit$time.series[,1],col=4,ylab="Seasonal",xlab="")

par(mfrow=c(2,1))
plot(hsales,ylab="Data",xlab="")
plot(fit$time.series[,3],col=3,ylab="Error")

par(mfrow=c(2,1))
plot(hsales,ylab="Data",xlab="")
plot(fit$time.series[,3],col=3,ylab="Error", type="h")

hsales.sa <- seasadj(fit)

plot(rwf(hsales.sa),ylim=c(23,90),xlim=c(1974,1997))
lines(hsales,col="gray")
plot(stlf(hsales,method="naive"),
     main="Reseasonalized forecasts",ylim=c(23,90),xlim=c(1974,1997))
lines(hsales.sa, col='gray')

#### Cross-validation

k <- 48
n <- length(a10)
mae1 <- mae2 <- mae3 <- matrix(NA,n-k-12,12)
for(i in 1:(n-k-12))
{
  xshort <- window(a10,end=1995+(5+i)/12)
  xnext <- window(a10,start=1995+(6+i)/12,end=1996+(5+i)/12)
  fit1 <- tslm(xshort ~ trend + season, lambda=0)
  fcast1 <- forecast(fit1,h=12)
  fit2 <- auto.arima(xshort,D=1, lambda=0)
  fcast2 <- forecast(fit2,h=12)
  fit3 <- ets(xshort)
  fcast3 <- forecast(fit3,h=12)
  mae1[i,] <- abs(fcast1[['mean']]-xnext)
  mae2[i,] <- abs(fcast2[['mean']]-xnext)
  mae3[i,] <- abs(fcast3[['mean']]-xnext)
}

plot(1:12,colMeans(mae1),type="l",col=2,xlab="horizon",ylab="MAE",
     ylim=c(0.58,1.0))
lines(1:12,colMeans(mae2),type="l",col=3)
lines(1:12,colMeans(mae3),type="l",col=4)
legend("topleft",legend=c("LM","ARIMA","ETS"),col=2:4,lty=1)


for(i in 1:(n-k))
{
  xshort <- window(a10,end=1995+(5+i)/12)
  xlong <- window(a10,start=1995+(6+i)/12)
  fit2 <- auto.arima(xshort,D=1, lambda=0)
  fit2a <- Arima(xlong,model=fit2)
  fit3 <- ets(xshort)
  fit3a <- ets(xlong,model=fit3)
  mae2a[i,] <- abs(residuals(fit3a))
  mae3a[i,] <- abs(residuals(fit2a))
}

plot(1:12,colMeans(mae2a),type="l",col=2,xlab="horizon",ylab="MAE",
     ylim=c(0.58,1.0))
lines(1:12,colMeans(mae3a),type="l",col=4)
legend("topleft",legend=c("ARIMA","ETS"),col=2:4,lty=1)
