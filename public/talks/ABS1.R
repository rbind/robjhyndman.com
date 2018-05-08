library(fpp)

fit <- ses(oil, h=3)
plot(fit)
summary(fit)

fit2 <- holt(ausair, h=5)
plot(fit2)
summary(fit2)

fit3 <- holt(ausair, h=25, exponential=TRUE)
plot(fit3)
summary(fit3)

fit4 <- holt(ausair, h=5, damped=TRUE)
plot(fit4)
summary(fit4)


aus1 <- hw(austourists)
aus2 <- hw(austourists, seasonal="mult")

plot(aus1)
plot(aus2)

summary(aus1)
summary(aus2)

aus3 <- hw(austourists, seasonal="mult",
           damped=TRUE)
summary(aus3)
plot(aus3)


ets1 <- ets(oil)
plot(forecast(ets1))
summary(ets1)

ets2 <- ets(ausair)
plot(forecast(ets2))
summary(ets2)

ets3 <- ets(austourists)
plot(forecast(ets3))
summary(ets3)


fit <- ets(h02)
plot(fit)
summary(fit)

fcast <- forecast(fit)
plot(fcast)
fcast
summary(fcast)

fit <- ets(USAccDeaths)
plot(forecast(fit))
summary(fit)
