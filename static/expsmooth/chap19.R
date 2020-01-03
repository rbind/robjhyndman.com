require(expsmooth)

par(mfrow=c(2,1))
plot(log(dji[,4]),main="Log closing price",xlab="Year",ylab="")
plot(diff(log(dji[,4])),main="First differences of log closing prices",xlab="Year",ylab="Return")
