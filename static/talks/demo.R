library(fpp)

plot(livestock)
plot(h02)

# ETS
fit <- ets(livestock)
fcast <- forecast(fit)
plot(fcast)

fit <- ets(h02)
fcast <- forecast(fit)
plot(fcast)

# ARIMA
fit <- auto.arima(livestock)
fcast <- forecast(fit)
plot(fcast)

fit <- auto.arima(h02)
fcast <- forecast(fit)
plot(fcast)

# TBATS
gasoline <- read.csv("https://robjhyndman.com/data/gasoline.csv")[,1]
gasoline <- ts(gasoline, start=1991+31/365.25, frequency = 365.25/7)
fit <- tbats(gasoline)
fcast <- forecast(fit)
plot(fcast)

