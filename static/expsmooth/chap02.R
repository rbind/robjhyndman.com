library(expsmooth)
library(fma)

fit1 <- ets(bonds,model="ZZN")  # Ignore seasonal models
fit2 <- ets(uselec)
fit3 <- ets(ukcars)
fit4 <- ets(visitors)

par(mfrow=c(2,2))
par(mar=c(3.3,3.6,2.6,1.1))
plot(forecast(fit1,conf=80),xlab="Year",ylab="Percentage per annum",main="US 10-year bonds yield",
    shadecol="gray",fcol=1,lwd=.5)
plot(forecast(fit2,conf=80),xlab="Year",ylab="Billion kwh",main="US net electricity generation",
    shadecol="gray",fcol=1,lwd=.5)
plot(forecast(fit3,conf=80),xlab="Year",ylab="Thousands of cars",main="UK passenger motor vehicle production",
    shadecol="gray",fcol=1,lwd=.5)
plot(forecast(fit4,conf=80),xlab="Year",ylab="Thousands of people",main="Overseas visitors to Australia",
    shadecol="gray",fcol=1,lwd=.5)

