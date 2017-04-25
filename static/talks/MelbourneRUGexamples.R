require(fpp)
# Please make sure at least v3.10 of the forecast is loaded
# before running these examples.

# Three examples
beer <- aggregate(ausbeer)
plot(beer)
plot(a10)
plot(taylor)

# Fully automated forecasting
plot(forecast(beer))
plot(forecast(a10))
plot(forecast(taylor))

# Test methods on a test set
beertrain <- window(beer,end=1999.99)
beertest <- window(beer,start=2000)
a10train <- window(a10,end=2005.99)
a10test <- window(a10,start=2006)

# Simple methods for the BEER data
f1 <- meanf(beertrain,h=8)
f2 <- rwf(beertrain,h=8)
f3 <- rwf(beertrain,drift=TRUE,h=8)

plot(f2)

# In-sample accuracy
accuracy(f1)
accuracy(f2)
accuracy(f3)

# Out-of-sample accuracy
accuracy(f1,beertest)
accuracy(f2,beertest)
accuracy(f3,beertest)

# Exponential smoothing
fit1 <- ets(beertrain, model="ANN", damped=FALSE)
fit2 <- ets(beertrain)

fcast1 <- forecast(fit1, h=8)
fcast2 <- forecast(fit2, h=8)

plot(fcast2)

accuracy(fcast1,beertest)
accuracy(fcast2,beertest)


# Transformations

lam <- BoxCox.lambda(a10)
fit <- ets(a10, additive=TRUE, lambda=lam)
plot(forecast(fit))
plot(forecast(fit),include=60)

# ARIMA forecasting

tsdisplay(beertrain)
tsdisplay(diff(beertrain))
fit1 <- Arima(beertrain,order=c(3,1,0))
fit2 <- auto.arima(beertrain)
fcast1 <- forecast(fit1,h=8)
fcast2 <- forecast(fit2,h=8)
plot(fcast1)
plot(fcast2)
accuracy(fcast1,beertest)
accuracy(fcast2,beertest)

tsdisplay(BoxCox(a10,lam))

tsdisplay(diff(BoxCox(a10,lam),12))
fit1 <- Arima(a10train,lambda=lam, order=c(3,0,0),
          seasonal=list(order=c(0,1,2),period=12))
fit2 <- auto.arima(a10train,lambda=lam)
fcast1 <- forecast(fit1,h=30)
fcast2 <- forecast(fit2,h=30)
plot(fcast1)
plot(fcast2)
plot(fcast1,include=60)
lines(fcast2$mean,col="red")
lines(a10test)

accuracy(fcast1,a10test)
accuracy(fcast2,a10test)

# High frequency data
plot(taylor)
taylor.stl <- stl(taylor,s.window=7)
plot(taylor.stl)
plot(seasadj(taylor.stl))
fcast <- forecast(taylor.stl)
plot(fcast)

# Equivalent to:
fcast <- stlf(taylor)
plot(fcast)

# Double frequency data

fcast <- dshw(taylor,336,48)
plot(fcast)

# Time series cross-validation

k <- 48
n <- length(a10)
mae1 <- mae2 <- mae3 <- matrix(NA,n-k-1,12)
for(i in 1:(n-k-1))
{
  xshort <- window(a10,end=1995+5/12+i/12)
  xnext <- window(a10,start=1995+(6+i)/12,end=1996+(5+i)/12)
  fit1 <- tslm(xshort ~ trend + season, lambda=0)
  fcast1 <- forecast(fit1,h=12)
  fit2 <- auto.arima(xshort, lambda=0)
  fcast2 <- forecast(fit2,h=12)
  fit3 <- ets(xshort)
  fcast3 <- forecast(fit3,h=12)
  mae1[i,] <- c(abs(fcast1$mean-xnext),rep(NA,12-length(xnext)))
  mae2[i,] <- c(abs(fcast2$mean-xnext),rep(NA,12-length(xnext)))
  mae3[i,] <- c(abs(fcast3$mean-xnext),rep(NA,12-length(xnext)))
}
     
plot(1:12,colSums(mae3,na.rm=TRUE),type="l",col=4,xlab="horizon",ylab="MAE")
lines(1:12,colSums(mae2,na.rm=TRUE),type="l",col=3)
lines(1:12,colSums(mae1,na.rm=TRUE),type="l",col=2)
legend("topleft",legend=c("LM","ARIMA","ETS"),col=2:4,lty=1)
