library(fpp)

# 2. SES

plot(strikes)
fit <- ses(strikes)
fit$model
fit$model$states
fit
plot(fit, plot.conf=FALSE)
plot(fit$model, plot.type="single", col=1:2)

# Oil data
fit <- ses(oil,  h=3)
fit$model
fit$model$states
fit
plot(fit)
plot(fit$model, plot.type="single", col=1:2)

accuracy(fit1,oil)


# 3. Trend methods

fit1 <- holt(strikes)
plot(fit1$model)
plot(fit1, plot.conf=FALSE)
lines(fitted(fit1), col="red")
fit1$model

fit2 <- ses(strikes)
plot(fit1, plot.conf=FALSE, main="Forecasts of US strikes")
lines(fit2$mean, col="red", lwd=2)
legend("bottomleft", lty=1, col=c("blue","red"), 
       legend=c("Holt","SES"))

accuracy(fit1)
accuracy(fit2)


# Exponential trend method

air <- window(ausair, end=2004)
fit1 <- ses(air)
fit2 <- holt(air)
fit3 <- holt(air, exponential=TRUE)
plot(fit3, plot.conf=FALSE)
lines(fit2$mean, col="green", lwd=2)
lines(fit1$mean, col="red", lwd=2)
lines(window(ausair, start=2005), lwd=2)
legend("topleft", lty=1, col=c("red","green","blue"),
       legend=c("SES","Holt","Exponential"))

accuracy(fit1, ausair)
accuracy(fit2, ausair)
accuracy(fit3, ausair)


# DAMPED TREND METHODS

fit1 <- holt(air, h=50)
fit2 <- holt(air, exponential=TRUE, h=50)
fit3 <- holt(air, damped=TRUE, h=50)
fit4 <- holt(air, damped=TRUE, exponential=TRUE, h=50)

plot(fit4, plot.conf=FALSE)
lines(fit1$mean, col="green", lwd=2)
lines(fit2$mean, col="red", lwd=2)
lines(fit3$mean, col="purple", lwd=2)
lines(window(ausair, start=2005), lwd=2)
legend("topleft", lty=1, col=c("green","red","purple","blue"),
       legend=c("Holt","Exponential","Damped","Damped exponential"))

accuracy(fit1, ausair)
accuracy(fit2, ausair)
accuracy(fit3, ausair)
accuracy(fit4, ausair)



# 4. Seasonal methods

plot(austourists)
vis <- window(austourists, end=2008.99)
vis2 <- window(austourists, start=2009)
lines(vis, col="red", lwd=2)
lines(vis2, col="blue", lwd=2)

fit1 <- hw(vis)
fit2 <- hw(vis, seasonal="multiplicative")
fit3 <- hw(vis, damped=TRUE)
fit4 <- hw(vis, seasonal="multiplicative", damped=TRUE)
fit5 <- hw(vis, exponential=TRUE)
fit6 <- hw(vis, seasonal="multiplicative", exponential=TRUE)
fit7 <- hw(vis, damped=TRUE, exponential=TRUE)
fit8 <- hw(vis, seasonal="multiplicative", damped=TRUE, exponential=TRUE)

plot(fit1, plot.conf=FALSE, ylim=c(20,60))
lines(fit2$mean, col=2, lwd=2)
lines(fit3$mean, col=3, lwd=2)
lines(fit4$mean, col=5, lwd=2)
lines(fit6$mean, col=6, lwd=2)
lines(fit8$mean, col=7, lwd=2)
lines(vis2, lwd=2)

plot(fit1, plot.conf=FALSE, ylim=c(30,60), include=8) # blue
lines(fit2$mean, col=2, lwd=2) # red
lines(fit3$mean, col=3, lwd=2) # green
lines(fit4$mean, col=5, lwd=2) # cyan
lines(fit6$mean, col=6, lwd=2) # magenta
lines(fit8$mean, col=7, lwd=2) # yellow
lines(vis2, lwd=2) # black

accuracy(fit1, vis2)
accuracy(fit2, vis2)
accuracy(fit3, vis2)
accuracy(fit4, vis2)
accuracy(fit6, vis2)
accuracy(fit8, vis2)

fit6$model
plot(fit6$model)
plot(fit6)
