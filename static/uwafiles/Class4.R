library(fpp)

# ETS models for BEER

fit <- ets(ausbeer)
fit2 <- ets(ausbeer,model="AAA",damped=FALSE)
fcast1 <- forecast(fit, h=20)
fcast2 <- forecast(fit2, h=20)

accuracy(fit)
accuracy(fit2)

plot(forecast(fit))
plot(forecast(fit, level=c(50,80,95)))
plot(forecast(fit,fan=TRUE))

# US Net Electricity

usfit <- ets(usnetelec[1:45])
test <- ets(usnetelec[46:55], model = usfit)

accuracy(test)
accuracy(forecast(usfit,10), usnetelec[46:55])
              


