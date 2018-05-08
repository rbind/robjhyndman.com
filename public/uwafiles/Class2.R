require(fpp)

####### 1. Time series graphics

plot(melsyd[,"Economy.Class"])

plot(a10)

plot(a10,ylab="$ million",xlab="Year",main="Antidiabetic drug sales")

seasonplot(a10)
seasonplot(a10, year.labels=TRUE)
seasonplot(a10,year.labels=TRUE,
           main="Seasonal plot: antidiabetic drug sales",
           ylab="$million", col=1:20,year.labels.left=TRUE)
seasonplot(a10,year.labels=TRUE,
           main="Seasonal plot: antidiabetic drug sales",
           ylab="$million", col=1:20,year.labels.left=TRUE,pch=19)
seasonplot(a10,year.labels=TRUE,
           main="Seasonal plot: antidiabetic drug sales",
           ylab="$million",col=rainbow(20),year.labels.left=TRUE,pch=19)

monthplot(a10)
monthplot(a10,ylab="$ million",xlab="Month",
          main="Seasonal subseries plot: antidiabetic drug sales")
monthplot(a10,ylab="$ million",xlab="Month",
          main="Seasonal subseries plot: antidiabetic drug sales",
          type="h")


beer <- window(ausbeer,start=1992)
plot(beer,xlab="",ylab="megaliters",main="Australian quarterly beer production",)
seasonplot(beer,year.labels=TRUE,ylab="megaliters",
           main="Seasonal plot: quarterly beer production", 
           col=rainbow(20), pch=19)

monthplot(beer,ylab="Megalitres",xlab="Quarter",
          main="Seasonal subseries plot: quarterly beer production")

####### 2. Seasonal or cyclic?

plot(window(elec,start=1980),ylab="GWh",xlab="Year",main="Australian electricity production")

plot(bricksq,ylab="million units",xlab="Year",main="Australian clay brick production")

plot(hsales,main="Sales of new one-family houses, USA",ylab="Total sales",xlab="Year")

plot(ustreas,main="US Treasury bill contracts",ylab="price",xlab="Day")

plot(lynx, main="Annual Canadian Lynx trappings", ylab="Number trapped", xlab="Year")



####### 3. Autocorrelation

lag.plot(beer,lags=9)
lag.plot(beer,lags=9, do.lines=FALSE)

Acf(beer,main="ACF of quarterly beer production")

plot(window(elec,start=1980),ylab="GWh")
Acf(window(elec,start=1980),main="Australian monthly electricity production",lag.max=40)

###### 4. Forecasting residuals

fc <- naive(dj)
plot(dj)
lines(fitted(fc), col='red')
res <- residuals(fc)
plot(res)
hist(res, breaks="FD")
Acf(res)

#### 5. White noise


plot(wnoise)
Acf(wnoise)
Acf(wnoise,lag.max=10)
Acf(wnoise,plot=FALSE)

acf(wnoise)

plot(window(pigs/1e3,start=1990),
     ylab="thousands",xlab="",main="Number of pigs slaughtered in Victoria")
Acf(window(pigs,start=1990),
    main="Number of pigs slaughtered in Victoria",lag.max=40)
tsdisplay(window(pigs/1e3,start=1990), plot.type='scatter')

# Dow Jones again

res <- residuals(naive(dj))
Acf(res)
tsdisplay(res, plot.type="scatter")
# lag=h and fitdf=K
Box.test(res, lag=10, fitdf=0)
Box.test(res, lag=10, fitdf=0, type="Lj")


# Test residuals from seasonal naive forecast for beer

beer <- window(ausbeer,start=1992)
fc <- snaive(beer)
res <- residuals(fc)
Acf(res)
tsdisplay(res, plot.type="scatter")
Box.test(res, lag=8, fitdf=0, type="Lj")


####### 6. Evaluating forecast accuracy 

## QUARTERLY BEER
plot(ausbeer)
beer3 <- window(ausbeer,start=1992, end=c(2005,4))
beer4 <- window(ausbeer, start=2006)
plot(beer)

fc1 <- meanf(beer3, h=12)
fc2 <- naive(beer3, h=12)
fc3 <- snaive(beer3, h=12)

plot(fc1,xlab="Year",ylab="megaliters",
     main="Forecasts for quarterly beer production", plot.conf=FALSE)
lines(fc2$mean, col="red")
lines(fc3$mean, col="green")
lines(beer4)

accuracy(fc1, beer4)
accuracy(fc2, beer4)
accuracy(fc3, beer4)

# Compare
accuracy(fc1)
accuracy(fc2)
accuracy(fc3)

