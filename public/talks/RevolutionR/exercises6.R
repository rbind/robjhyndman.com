library(fpp)

##### Question 1 #####

plot(visitors)
seasonplot(visitors)
monthplot(visitors)
plot(stl(log(visitors),s.window="periodic",robust=TRUE))

# Seasonal data, with increasing trend, and increasing seasonal fluctuations
# Peak in December, with smaller peak in July. Lowest numbers of visitors in May.
# Each month has had similar increases over time
# Seasonality looks stable. Trend relatively flat in recent years.
# Big negative outliers in 2003

fc <- hw(visitors,seasonal="mult")
plot(fc)
# Multiplicative seasonality because of the increasing size of the fluctuations
# and increasing variation with the trend.
# Seasonality looks like it behaves proportionally, therefore multiplicatively.

fc1 <- hw(visitors,seasonal="mult",exponential=TRUE)
fc2 <- hw(visitors,seasonal="mult",exponential=TRUE, damped=TRUE)
fc3 <- hw(visitors,seasonal="mult",damped=TRUE)

accuracy(fc)
accuracy(fc1)
accuracy(fc2)
accuracy(fc3)

# Additive damped trend (fc3) does best amongst these models.
# However, it has one more parameter (the damping parameter) than the non-damped version.
# Need to use AIC to see if the improvement is worth the extra parameter.

fit <- ets(visitors)
fit
# ETS(M,A,M) model
# That is equivalent to the first one -- multiplicative seasonality, additive trend, no damping.
plot(forecast(fit))

##### Question 2 #####
fit <- ets(ukcars)
accuracy(fit)

fit2 <- stlf(ukcars, s.window=9, robust=TRUE, method="ets", etsmodel="AAN")
accuracy(fit2)

# STL-Holt's method looks better, and has no more parameters than the ETS model

plot(forecast(fit))
lines(fit2$mean, col="red")

# Very little difference


##### Question 3 #####

# Some bad results:
plot(forecast(ets(lynx)))
plot(forecast(ets(taylor)))
