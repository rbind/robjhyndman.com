library(fpp)

## Transformations

plot(BoxCox(elec,lambda=1/3))

fit <- snaive(elec, lambda=1/3)
plot(fit)
plot(fit, include=120)

BoxCox.lambda(elec)
plot(BoxCox(elec,lambda=BoxCox.lambda(elec)))


# STATIONARY?

plot(dj)
plot(diff(dj))
plot(strikes,main="Annual strikes in the US",xlab="Year",ylab="Number of strikes")
plot(hsales)
plot(eggs,main="Price of a dozen eggs in 1993 dollars",xlab="Year",ylab="$")
plot(window(pigs,start=1990))
plot(lynx,main="Annual Canadian Lynx trappings",ylab="Number trapped")
plot(window(ausbeer,start=1992))
plot(elec)

plot(dj)
Acf(dj)
plot(diff(dj))
Acf(diff(dj))

Box.test(diff(dj), lag=10, type="Lj")

# Random walks:
plot(ts(cumsum(rnorm(100))))

# Random walks with drift
plot(ts(cumsum(rnorm(100)+0.2)))

# Series needing two differences
plot(ts(cumsum(cumsum(rnorm(100)))))

# Seasonal differencing
plot(a10)
plot(log(a10))
plot(diff(log(a10),12))

plot(usmelec)
plot(log(usmelec))
plot(diff(log(usmelec),12))
plot(diff(diff(log(usmelec),12),1))


## ADF test
adf.test(dj)

kpss.test(dj)

# Automated differences:
ndiffs(dj)
ndiffs(strikes)
nsdiffs(log(usmelec))
ndiffs(log(usmelec))
plot(diff(log(usmelec)))


