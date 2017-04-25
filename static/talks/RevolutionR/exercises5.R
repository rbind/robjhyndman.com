library(fpp)

# Question 1

h1 <- holt(eggs, h=100)
h2 <- holt(eggs, h=100, damped=TRUE)
h3 <- holt(eggs, h=100, exponential=TRUE)
h4 <- holt(eggs, h=100, exponential=TRUE, damped=TRUE)
plot(forecast(h1), plot.conf=FALSE, ylim=c(0,350)) # Negative prices?
lines(h2$mean, col=2)
lines(h3$mean, col=3)
lines(h4$mean, col=5) # Almost the same as h2
# h3 looks the most reasonable

accuracy(h1) # Best MAE, MAPE and MASE
accuracy(h2)
accuracy(h3) # Best RMSE
accuracy(h4)

# There is a bug in holt() which prevents you specifying both alpha and beta simultaneously
# I will fix it in the next version.
# So in the following, I've just varied one at a time
plot(holt(eggs, h=100, exponential=TRUE, alpha=0.8, damped=FALSE))
lines(holt(eggs, h=100, exponential=TRUE, alpha=0.7, damped=FALSE)$mean, col=2)
lines(holt(eggs, h=100, exponential=TRUE, alpha=0.6, damped=FALSE)$mean, col=3)
lines(holt(eggs, h=100, exponential=TRUE, alpha=0.5, damped=FALSE)$mean, col=4)
lines(holt(eggs, h=100, exponential=TRUE, alpha=0.4, damped=FALSE)$mean, col=5)
lines(holt(eggs, h=100, exponential=TRUE, alpha=0.3, damped=FALSE)$mean, col=6)
lines(holt(eggs, h=100, exponential=TRUE, alpha=0.2, damped=FALSE)$mean, col=7)
lines(holt(eggs, h=100, exponential=TRUE, alpha=0.1, damped=FALSE)$mean, col=8)
lines(holt(eggs, h=100, exponential=TRUE, alpha=0.05, damped=FALSE)$mean, col=9,lwd=2)

# Made very little difference except when alpha was very small.
# For the increasing trend (when alpha=0.1), this occurred because beta was much larger than 
# for the others

# In the following, choosing beta > 0.1 caused errors, so we start with 0.1 and go smaller
plot(holt(eggs, h=100, exponential=TRUE, beta=0.1, damped=FALSE), ylim=c(0,350))
lines(holt(eggs, h=100, exponential=TRUE, beta=0.05, damped=FALSE)$mean, col=2)
lines(holt(eggs, h=100, exponential=TRUE, beta=0.01, damped=FALSE)$mean, col=3)
lines(holt(eggs, h=100, exponential=TRUE, beta=0.001, damped=FALSE)$mean, col=4)
lines(holt(eggs, h=100, exponential=TRUE, beta=0.0001, damped=FALSE)$mean, col=5)

# The prediction intervals when beta=0.1 (and alpha = 0.86) are clearly crazy
# For beta <= 0.01, there isn't much difference

# Summary: beta has a big effect, and we generally need smaller values of beta to get decent
# looking forecasts, at least for this example with exponential trend.

# Question 2

plot(ukcars)
seasonplot(ukcars,year.labels=TRUE, year.labels.left=TRUE, col=rainbow(30))
monthplot(ukcars)

# Make s.window as large as possible while keeping trend smooth
decomp <- stl(ukcars, s.window=9, robust=TRUE)
plot(decomp)

# Seasonally adjusted data with damped trend
sa <- seasadj(decomp)
fit <- holt(sa, h=8)
plot(fit)

# RMSE
accuracy(fit)

# Method parameters
fit$model
# Small beta means the slope isn't changing much over time
# Large alpha means the level (intercept) is changing quickly.

# Reseasonalize forecasts:
lastyear <- rep(decomp$time.series[110:113,"seasonal"],2)
fc <- fit$mean + lastyear
plot(ukcars,xlim=c(1980,2007))
lines(fc, col="blue")

# They look fine to me.
