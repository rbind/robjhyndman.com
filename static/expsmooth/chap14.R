require(expsmooth)

plot(vehicles,xlab="Day",ylab="Number of vehicles",main="")

plot(ts(vehicles[817+(1:(14*24))],f=24),xlab="Day",ylab="Number of vehicles",xaxt="n")
axis(side=1,at=1:14 + 0.5,labels=rep(c("Fri","Sat","Sun","Mon","Tue","Wed","Thu"),2),tick=FALSE,cex=0.9)
axis(side=1,at=c(4,7,11,14)+0.5,labels=rep(c("Mon","Thu"),2),tick=FALSE,cex=0.9)
axis(side=1,at=1:20,labels=FALSE)

plot(utility,main="",ylab="MW",xlab="Day")

plot.ts(utility[1:(2*24*7)],ylab="MW",xlab="Day",xaxt="n")
axis(1,at=seq(0,400,by=24),labels=FALSE)
axis(1,at=seq(0,320,by=24)+12,labels=rep(c("Wed","Thu","Fri","Sat","Sun","Mon","Tue"),2),tick=FALSE,cex=0.9)
axis(1,at=seq(24,350,by=7*24)+12,labels=rep("Thu",2),tick=FALSE,cex=0.9)
axis(1,at=seq(5*24,350,by=7*24)+12,labels=rep("Mon",2),tick=FALSE,cex=0.9)

