library(fpp)

# Question 1

# Download retail.xls file and convert to csv
retail <- ts(read.table("../Session7/retail.csv", skip=1,
                        sep = ";", dec = ",", header = TRUE,
                        stringsAsFactors = FALSE)[,-1], frequency=12, start=c(1982,4))
# Choose one of the columns at random
col <- sample(1:ncol(retail),1)
# Select series
x <- retail[,col]


plot(x)
plot(log(x))

aic <- numeric(5)
for(i in 1:5)
  aic[i] <- auto.arima(x, xreg=fourier(x,i), seasonal=FALSE, lambda=0)$aic

plot(aic)
k <- which.min(aic) #5

fit <- auto.arima(x, xreg=fourier(x,k), seasonal=FALSE, lambda=0)

summary(fit)

res <- residuals(fit)
tsdisplay(res) 

# Big seasonality problem in residuals.
# Try adding seasonal ARIMA terms

aic <- numeric(5)
for(i in 1:5)
  aic[i] <- auto.arima(x, xreg=fourier(x,i), lambda=0)$aic

plot(aic)
k <- which.min(aic) #5

fit <- auto.arima(x, xreg=fourier(x,k), lambda=0)

summary(fit)

res <- residuals(fit)
tsdisplay(res) 

# Much better, but not perfect.

Box.test(res, lag=24, fitdf=length(fit$coef))
# For some of the retail series, the residuals might fail this test.

fc <- forecast(fit, xreg=fourierf(x,k,h=36))
plot(fc)


# Question 2

fit2 <- tbats(x)
res <- residuals(fit2)
tsdisplay(res)
# Ugly
Box.test(res, lag=24, fitdf=18)

fc <- forecast(fit2)
plot(fc)


# Question 3
# I had trouble with the ARIMA+Fourier method, so dropped it
# from this comparison

k <- 48
n <- length(x)
mae1 <- mae2 <- mae3 <- mae4 <- matrix(NA,n-k-12,12)
for(i in 1:(n-k-12))
{
  print(i)
  xshort <- window(x,end=tsp(x)[1]+(k+i-2)/12)
  xnext <- window(x,start=tsp(x)[1]+(k+i-1)/12,end=tsp(x)[1]+(k+i+10)/12)
  # ARIMA
  fit1 <- try(auto.arima(xshort, D=1, lambda=0), silent=TRUE)
  fcast1 <- forecast(fit1,h=12)
  mae1[i,] <- abs(fcast1[['mean']]-xnext)
  # ETS
  fit2 <- ets(xshort)
  fcast2 <- forecast(fit2,h=12)
  mae2[i,] <- abs(fcast2[['mean']]-xnext)
  # STLF
  fit3 <- stlf(xshort, lambda=0)
  fcast3 <- forecast(fit3, h=12)
  mae3[i,] <- abs(fcast3[['mean']]-xnext)
  # TBATS
  fit5 <- tbats(xshort)
  fcast5 <- forecast(fit5, h=12)
  mae5[i,] <- abs(fcast5[['mean']]-xnext)
}

plot(1:12,colMeans(mae1),type="l",col=2,xlab="horizon",ylab="MAE",
     ylim=c(20,40))
lines(1:12,colMeans(mae2),type="l",col=3)
lines(1:12,colMeans(mae3),type="l",col=4)
lines(1:12,colMeans(mae5),type="l",col=5)
legend("topleft",legend=c("ARIMA","ETS","STLF","TBATS"),col=2:5,lty=1)

