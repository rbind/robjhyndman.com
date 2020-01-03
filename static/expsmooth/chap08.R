require(expsmooth)

# Canadian Gas Production

fit <- ets(cangas,"MNM",gamma=0.6,alpha=0.2)
plot(fit)

R <- rowMeans(fit$state[,-1])
l <- fit$state[,1] * R
s <- sweep(fit$state[,-1],1,R,"/")

par(mfrow=c(2,1))
plot(cangas,ylab="billion cubic metres",xlab="Year",main="Original data")
plot(cangas/s[,1],ylab="billion cubic metres",xlab="Year",main="Seasonally adjusted data")

par(mfrow=c(2,1))
plot(fit$state[,1],ylim=range(fit$state[,1],l),ylab="Level",xlab="Year",lty=2)
lines(l,lty=1)
legend("topleft",lty=c(2,1),legend=c("Original component","Normalized component"))
plot(fit$state[,3],ylab="Season",xlab="Year",lty=2)
abline(1,0,col="gray")
lines(s[,1],lty=1)
legend("topleft",lty=c(2,1),legend=c("Original component","Normalized component"))
