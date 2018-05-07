library(fpp)


#Question 1

plot(plastics)
# Strong seasonality plus a linear trend

decomp <- stl(plastics, s.window="periodic")
plot(decomp)
# Seasonality unchanged over the five year period
# Dip in trend at end was not noticeable in first plot

sa <- seasadj(decomp)
plot(sa)

x <- plastics
x[20] <- x[20] + 500
sa2 <- seasadj(stl(x, s.window="periodic"))
sa3 <- seasadj(stl(x, s.window="periodic", robust=TRUE))
plot(sa, col="blue", ylim=range(sa,sa2,sa3))
lines(sa2,col="red")
lines(sa3, col="green")
# If robust=FALSE, the seasonal adjusted series changes across the whole data set
# If robust=TRUE, only the outlying point changes noticeably.

x <- plastics
x[59] <- x[59] + 500 # Second last observation
sa2 <- seasadj(stl(x, s.window="periodic"))
sa3 <- seasadj(stl(x, s.window="periodic", robust=TRUE))
plot(sa, col="blue", ylim=range(sa,sa2,sa3))
lines(sa2,col="red")
lines(sa3, col="green")
# If robust=FALSE, the seasonal adjusted series changes across the whole data set
# If robust=TRUE, the effect is less, but still noticeable changes across the whole series
# Having outlier near end gives it more impact

fc <- stlf(plastics, method="naive")
plot(fc)
# Forecasts look too low. Due to drop in seasonally adjusted data near end of series



# Question 2.

fit <- ets(visitors)

k <- 48 # minimum size for training set
n <- length(visitors) # Total number of observations
e <- visitors*NA # Vector to record one-step forecast errors
for(i in 48:(n-1))
{
  train <- ts(visitors[1:i],freq=12)
  fit <- ets(train, "MAM", damped=FALSE)
  fc <- forecast(fit,h=1)$mean
  e[i] <- visitors[i+1]-fc
}
sqrt(mean(e^2,na.rm=TRUE))

# Need to preserve time series characteristics in order for ets to fit a seasonal model.
# Error variances increase due to multiplicative errors.
# RMSE biased because ets on whole data set while cross-validation 
# on latter part of data set with larger errors

# Replace second line of loop with
  fit <- ets(train)
#for selecting a different model at each step

