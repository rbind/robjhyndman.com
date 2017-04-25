library(fpp)

# Exercise 1

pb <- books[,1]
plot(pb)

fit1 <- ses(pb, h=4)
summary(fit1)

fit2 <- holt(pb, h=4)
summary(fit2)

fit3 <- holt(pb, h=4, exponential=TRUE)
summary(fit3)
fit4 <- holt(pb, h=4, damped=TRUE)
summary(fit4)

(fit5 <- ets(pb))
plot(forecast(fit5, h=4))
# Ignores the obvious trend. Probably not so good
# I prefer Holt's method despite the higher AICc value

Acf(residuals(fit2))
# Some correlation at lag 3 remaining.

# Exercise 2

fit1 <- hw(visitors, h=24, seasonal='mult')
summary(fit1)
plot(fit1)
# Multiplicative necessary because the variation increases with the level.

fit2 <- hw(visitors, h=24, seasonal='mult', exponential=TRUE)
summary(fit2)
plot(fit2)
# fit1 has much smaller AICc value
# Also exponential trends are a little dangerous for forecasting

fit3 <- hw(visitors, h=24, seasonal='mult', damped=TRUE)
summary(fit3)
plot(fit3)
# fit1 has slightly smaller AICc value
# but either probably ok

(fit4 <- ets(visitors))
plot(forecast(fit4, h=24))
# Actually the same as multiplicative Holt-Winters but estimated
# using likelihood rather than least squares.
# A better fit (and smaller AICc)

Acf(residuals(fit4))
# Looks ok. Not much correlation remaining.

# Exercise 4

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

# If train = visitors[1:i], then time series attribute lost and
# seasonality would be unavailable.

# Variances increase due to multiplicative nature of data
# heteroskedastic errors

# RMSE biased because the errors in the early period are missing, and they 
# would have been smaller on average than later errors


k <- 48 # minimum size for training set
n <- length(visitors) # Total number of observations
e <- visitors*NA # Vector to record one-step forecast errors
for(i in 48:(n-1))
{
  train <- ts(visitors[1:i],freq=12)
  fit <- ets(train)
  fc <- forecast(fit,h=1)$mean
  e[i] <- visitors[i+1]-fc  
}
sqrt(mean(e^2,na.rm=TRUE))


