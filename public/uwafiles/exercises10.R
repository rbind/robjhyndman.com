library(fpp)

#### QUESTION 1

# Download retail.xls file and convert to csv
retail <- ts(read.table("retail.csv", skip=1,
                        sep = ",", header = TRUE,
                        stringsAsFactors = FALSE)[,-1], frequency=12, start=c(1982,4))
# Choose one of the columns at random
col <- sample(1:ncol(retail),1)
# Select series
x <- retail[,col] 

plot(x)
plot(log(x))

four <- fourier(x, K=10)

(fit1 <- auto.arima(x, xreg=fourier(x,1), lambda=0))
(fit2 <- auto.arima(x, xreg=fourier(x,2), lambda=0))
(fit3 <- auto.arima(x, xreg=fourier(x,3), lambda=0))
(fit4 <- auto.arima(x, xreg=fourier(x,4), lambda=0))
(fit5 <- auto.arima(x, xreg=fourier(x,5), lambda=0))
(fit6 <- auto.arima(x, xreg=fourier(x,6), lambda=0))

# For my data (col=27), model 2 works best.

tsdisplay(residuals(fit2))
# Looks ok

fc <- forecast(fit2, xreg=fourierf(x,2,h=24))
plot(fc)


### QUESTION 2

cost <- motel[,2]/motel[,1]
cpi <- motel[,3]

plot(cpi,cost)
plot(cbind(cpi,cost))
# Variance increases with level

plot(log(cbind(cpi,cost)))

(fit <- auto.arima(cost, xreg=cpi, lambda=0))
tsdisplay(residuals(fit))

# Forecast cpi using naive
fcpi <- naive(cpi,h=24)$mean
fc <- forecast(fit, xreg=fcpi)
plot(fc)
