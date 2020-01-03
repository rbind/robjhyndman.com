set.seed(1)
stock <- rev(cumsum(rpois(81,exp(arima.sim(list(order=c(1,0,0),ar=.7),n=81)))))
stock[42:82] <- stock[41:81]+100
tt <- seq(0,4,by=0.05)
tt[42:82] <- tt[41:81]

plot(tt,stock,type="l",yaxt="n",ylab="provision",xlab="time",xlim=c(0.14,3.85),xaxt="n")
abline(110,0,lty=2)
abline(200,0,lty=2)
axis(1,at=0:4)
axis(2,at=c(110,200),label=c("R","S"),las=1,cex.axis=1.2)
