library(expsmooth)
library(fma)


par(mfrow=c(2,2))
par(mar=c(3.3,3.6,2.6,1.1))
plot(bonds,xlab="Year",ylab="Percentage per annum",main="(a) US 10-year bonds yield")
plot(uselec,xlab="Year",ylab="Billion kwh",main="(b) US net electricity generation")
plot(ukcars,xlab="Year",ylab="Thousands of cars",main="(c) UK passenger vehicle production")
plot(visitors,xlab="Year",ylab="Thousands of people",main="(d) Overseas visitors to Australia")
