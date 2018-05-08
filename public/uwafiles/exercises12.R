library(fpp)

# Question 1
fit <- tbats(visitors)
res <- residuals(fit)
Acf(res)
plot(forecast(fit))

# Question 2

gas <- read.csv("https://robjhyndman.com/data/gasoline.csv")[,1]
gas <- ts(gas, start=1991+31/365.25, frequency = 365.25/7)
fit <- tbats(gas)
res <- residuals(fit)
Acf(res)
plot(forecast(fit))


# Question 3

plot(nnetar(visitors))


