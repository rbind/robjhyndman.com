library(fpp)

# Question 1

plot(wmurders) 
# No obvious need for a transformation, but we want the forecasts to be positive
# and the downward trend at the end could lead to negative forecasts.
# So I'll try a log
plot(log(wmurders))
tsdisplay(diff(log(wmurders)))
# Looks ok
fit <- auto.arima(wmurders, lambda=0)
summary(fit)
# Over-ride choice of differencing, and only use one difference
fit2 <- auto.arima(wmurders, lambda=0, d=1)
summary(fit2)
fit3 <- Arima(wmurders, order=c(1,1,0), lambda=0)
summary(fit3)
fit4 <- Arima(wmurders, order=c(0,1,1), lambda=0)
summary(fit4)

#Best models seem to be either ARIMA(1,2,1) or ARIMA(0,1,0).
tsdisplay(residuals(fit))
tsdisplay(residuals(fit2))
Box.test(residuals(fit), lag=10, fitdf=2, type="L")
Box.test(residuals(fit2), lag=10, fitdf=0, type="L")
# Both ok, but ARIMA(1,2,1) model slightly better.

fc1 <- forecast(fit)
plot(fc1)
# Looks ok to me.

etsfit <- ets(wmurders)

lines(forecast(etsfit)$mean, col="red")
# That looks closer to the ARIMA(0,1,0) model


# Question 2
plot(usgdp) 
# No obvious need for a transformation
tsdisplay(diff(usgdp))
# Looks ok
fit <- auto.arima(usgdp)
summary(fit)
# Over-ride choice of differencing, and only use one difference
fit2 <- auto.arima(usgdp, d=1)
summary(fit2)
fit3 <- Arima(usgdp,  order=c(2,1,0))
summary(fit3)

#Best models seem to be either ARIMA(2,2,2) or ARIMA(1,1,1).
tsdisplay(residuals(fit))
tsdisplay(residuals(fit2))
Box.test(residuals(fit), lag=15, fitdf=4, type="L")
Box.test(residuals(fit2), lag=15, fitdf=2, type="L")
# Second model marginally better, but still fails residual test.
# I used lag 15 becfause I was concerned about a couple of the large spikes in
# the residual ACF plots

fc <- forecast(fit2,h=20)
plot(fc)
# Looks a little unrealistic with a change of trend. 
# That's probably due to the single differencing. 
# OK. Let's go back to the other model
fc <- forecast(fit,h=20)
plot(fc)
# That's probably better

etsfit <- ets(usgdp)
lines(forecast(etsfit, h=20)$mean, col="red")
# Almost identical forecasts



# Question 3
plot(mcopper) 
# Looks like it needs some kind of transformation. 
bc <- BoxCox.lambda(mcopper) # 0.19
# A log would do ok as well
plot(BoxCox(mcopper,bc))
tsdisplay(BoxCox(mcopper,bc))
tsdisplay(diff(BoxCox(mcopper,bc)))
# Looks ok
fit <- auto.arima(mcopper,lambda=bc)
summary(fit)
# That's going to be hard to beat. 
# The differencing looks correct and the single spike in the ACF of the differenced data
# suggests an MA(1) model. You could try others, but I doubt you will find anything better.

tsdisplay(residuals(fit))
Box.test(residuals(fit), lag=15, fitdf=1, type="L")
# No problem

fc <- forecast(fit,h=20)
plot(fc)
# Boring forecasts, but given the historical fluctuations, probably reasonable.

etsfit <- ets(mcopper)
lines(forecast(etsfit, h=20)$mean, col="red")
# ETS allows for some local trend near the end



