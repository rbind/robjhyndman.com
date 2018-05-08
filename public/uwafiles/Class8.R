library(fpp)


### SEASONAL MODELS

# European retail

plot(euretail,ylab="Retail index",xlab="Year")

tsdisplay(diff(euretail,4))

tsdisplay(diff(diff(euretail,4)))

fit <- Arima(euretail,order=c(0,1,1),seasonal=c(0,1,1))
tsdisplay(residuals(fit))

fit2 <- Arima(euretail,order=c(0,1,2),seasonal=c(0,1,1))
fit3 <- Arima(euretail,order=c(0,1,3),seasonal=c(0,1,1))
# fit3 the best
res <- residuals(fit3)
tsdisplay(res)
Box.test(res,lag=16,fitdf=4,type="Lj")
plot(forecast(fit3,h=12))


(fit4 <- auto.arima(euretail))
(fit5 <- auto.arima(euretail,stepwise=FALSE,approximation=FALSE))


#### H02 example -- more complicated

lh02 <- log(h02)

plot(h02, ylab="H02 sales (million scripts)",xlab="Year")
plot(lh02, ylab="Log H02 sales",xlab="Year")

tsdisplay(diff(lh02,12), main="Seasonally differenced H02 scripts", xlab="Year")

tsdisplay(diff(diff(lh02,12)), main="Double differenced H02 scripts", xlab="Year")

Arima(h02,order=c(3,0,0),seasonal=c(2,1,0),lambda=0)
Arima(h02,order=c(3,0,1),seasonal=c(2,1,0),lambda=0)
Arima(h02,order=c(3,0,2),seasonal=c(2,1,0),lambda=0)
Arima(h02,order=c(3,0,1),seasonal=c(1,1,0),lambda=0)
Arima(h02,order=c(3,0,1),seasonal=c(0,1,1),lambda=0)
Arima(h02,order=c(3,0,1),seasonal=c(0,1,2),lambda=0)
Arima(h02,order=c(3,0,1),seasonal=c(1,1,1),lambda=0)

# Try (3,0,1)(0,1,2)
fit <- Arima(h02,order=c(3,0,1),seasonal=c(0,1,2),lambda=0)


tsdisplay(residuals(fit))
Box.test(residuals(fit),lag=36,fitdf=6,type="Ljung")

# Try automatic search

fit2 <- auto.arima(h02,lambda=0) # No good

# Suggested models

Arima(h02,order=c(2,1,3),seasonal=c(0,1,1),lambda=0)
Arima(h02,order=c(2,1,4),seasonal=c(0,1,1),lambda=0)
Arima(h02,order=c(2,1,5),seasonal=c(0,1,1),lambda=0)


# Using test set

getrmse <- function(x,h,...)
{
  train.end <- time(x)[length(x)-h]
  test.start <- time(x)[length(x)-h+1]
  train <- window(x,end=train.end)
  test <- window(x,start=test.start)
  fit <- Arima(train,...)
  fc <- forecast(fit,h=h)
  return(accuracy(fc,test)[2,"RMSE"])
}

getrmse(h02,h=24,order=c(3,0,0),seasonal=c(2,1,0),lambda=0)
getrmse(h02,h=24,order=c(3,0,1),seasonal=c(2,1,0),lambda=0)
getrmse(h02,h=24,order=c(3,0,2),seasonal=c(2,1,0),lambda=0)
getrmse(h02,h=24,order=c(3,0,1),seasonal=c(1,1,0),lambda=0)
getrmse(h02,h=24,order=c(3,0,1),seasonal=c(0,1,1),lambda=0)
getrmse(h02,h=24,order=c(3,0,1),seasonal=c(0,1,2),lambda=0)
getrmse(h02,h=24,order=c(3,0,1),seasonal=c(1,1,1),lambda=0)
getrmse(h02,h=24,order=c(4,0,3),seasonal=c(0,1,1),lambda=0)
getrmse(h02,h=24,order=c(3,0,3),seasonal=c(0,1,1),lambda=0)
getrmse(h02,h=24,order=c(4,0,2),seasonal=c(0,1,1),lambda=0)
getrmse(h02,h=24,order=c(3,0,2),seasonal=c(0,1,1),lambda=0)
getrmse(h02,h=24,order=c(2,1,3),seasonal=c(0,1,1),lambda=0)
getrmse(h02,h=24,order=c(2,1,4),seasonal=c(0,1,1),lambda=0)
getrmse(h02,h=24,order=c(2,1,5),seasonal=c(0,1,1),lambda=0)



fit <- Arima(h02,order=c(3,0,1),seasonal=c(0,1,2),lambda=0)

plot(forecast(fit), ylab="H02 sales (million scripts)",xlab="Year")
