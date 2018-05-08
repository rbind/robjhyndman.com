library(fpp)

## Question 1.

vis1 <- window(visitors, end=tail(time(visitors),25)[1])
vis2 <- window(visitors, start=tail(time(visitors),24)[1])

bc <- BoxCox.lambda(vis1)
fc1 <- forecast(ets(vis1),h=24)
fc2 <- forecast(ets(vis1, lambda=bc, additive=TRUE), h=24)
fc3 <- snaive(vis1, lambda=bc)
fc4 <- stlf(vis1, lambda=bc, method="ets")

tsdisplay(residuals(fc1))
# ACF looks good
tsdisplay(residuals(fc2))
# Some correlation at lag 4, otherwise not bad
tsdisplay(residuals(fc3))
# Strong autocorrelations up to lag 9
tsdisplay(residuals(fc4))
# Big spike at lag 12 in ACF

Box.test(residuals(fc1),lag=24,fitdf=16, type="Lj")
# Fail, but not by much
Box.test(residuals(fc2),lag=24,fitdf=16, type="Lj")
# Fail
Box.test(residuals(fc3),lag=24,fitdf=0, type="Lj")
# Fail
Box.test(residuals(fc4),lag=24,fitdf=5, type="Lj")
# Fail

par(mfrow=c(2,2))
plot(fc1);lines(vis2,col='red')
plot(fc2);lines(vis2,col='red')
plot(fc3);lines(vis2,col='red')
plot(fc4);lines(vis2,col='red')

accuracy(fc1,vis2)
accuracy(fc2,vis2)
accuracy(fc3,vis2)
accuracy(fc4,vis2)

# Method 2 gives the best insample forecasts and close to best out-of sample forecasts
# Method 3 gives the best out-of-sample forecasts.

## Question 2
plot(cangas)
# The variation does not change with the level. Instead, the seasonal shape changes over time 
# with the largest fluctuations occurring in the 1980s.
# No Box-Cox transformation will allow the variation to be made roughly constant over time.
# But let's try:
bc <- BoxCox.lambda(cangas)
plot(BoxCox(cangas, lambda=bc))


## Question 3

# Download retail.xls file and convert to csv
retail <- ts(read.table("retail.csv", skip=1,
                   sep = ";", dec = ",", header = TRUE,
                   stringsAsFactors = FALSE)[,-1], frequency=12, start=c(1982,4))
# Choose one of the columns at random
col <- sample(1:ncol(retail),1)
# Select series
x <- retail[,col]

# Plot series
plot(x)
plot(log(x))
plot(stl(log(x), s.window="periodic"))

# Try ets model
fit1 <- ets(x)
# ETS model to logged data
fit2 <- ets(x, lambda=0, additive=TRUE)
# STL + ETS model
fit3 <- stlf(x, lambda=0, method="ets", h=48)

tsdisplay(residuals(fit1))
tsdisplay(residuals(fit2))
# Almost no difference between these two because fit1 is ETS(M,Md,M)
# and fit2 is ETS(A,Ad,A) which is equivalent to fit1 on log scale.
# Two many large autocorrelations to be white noise.
Box.test(residuals(fit1),lag=24,fitdf=17, type="Lj")
# Bad fail

tsdisplay(residuals(fit3))
Box.test(residuals(fit3),lag=24,fitdf=4, type="Lj")
# Even worse

# The best we have so far is the ETS(M,Md,M) model
fc <- forecast(fit1,h=48)
plot(fc)
# Wide prediction intervals shows the uncertainty
