require(fpp)

# Australian GDP
ausgdp <- ts(scan("gdp.dat"),frequency=4,
             start=1971+2/4)
class(ausgdp)
ausgdp
plot(ausgdp)

# Electricity sales
elecsales

## QUARTERLY BEER
plot(ausbeer)
beer <- window(ausbeer,start=1992)
plot(beer)
plot(beer,xlab="Year",ylab="megaliters", 
     main="Australian quarterly beer production")
plot(forecast(beer),xlab="Year",ylab="megaliters",
     main="Australian quarterly beer production")

# Pigs slaughtered
plot(pigs)
plot(window(pigs, start=1990))
plot(window(pigs/1000,start=1990), ylab="thousands", 
     main="Number of pigs slaughted in Victoria")

# Dow Jones
plot(dj)

# Beer forecasts
beer2 <- window(beer, end=2005.99)
plot(meanf(beer2, h=20), plot.conf=FALSE)
lines(naive(beer2, h=20)$mean, col="red")
lines(snaive(beer2, h=20)$mean, col="green")
lines(window(beer,start=2006))


# Dow-Jones forecasts
dj2 <- window(dj, end=250)
plot(meanf(dj2, h=50), plot.conf=FALSE)
lines(naive(dj2, h=50)$mean, col="red")
lines(rwf(dj2, h=50, drift=TRUE)$mean, col="green")
lines(window(dj,start=251))

