library(fpp)

# VAR models

ar(usconsumption, order=3)

library(vars)
VARselect(usconsumption, lag.max=8, type="const")$selection

var <- VAR(usconsumption, p=3, type="const")
serial.test(var, lags.pt=10, type="PT.asymptotic")

summary(var)

fcst <- forecast(var)
plot(fcst, xlab="Year")


# NNAR models

fit <- nnetar(sunspotarea)
plot(forecast(fit,h=20))

# Restrict to positive values:
fit <- nnetar(sunspotarea,lambda=0)
plot(forecast(fit,h=20))

# TBATS models

fit <- tbats(gasoline)
fcast <- forecast(fit)
plot(fcast)

fit <- tbats(callcentre)
fcast <- forecast(fit)
plot(fcast)

fit <- tbats(turk)
fcast <- forecast(fit)
plot(fcast)
