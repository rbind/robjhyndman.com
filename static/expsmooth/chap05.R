library(expsmooth)

plot(ausgdp,xlab="Year",ylab="Quarterly GDP per capita")

fit <- ets(ausgdp,"AAN",damped=FALSE,upper=rep(1,4))
fit2 <- ets(ausgdp,"AAN",damped=FALSE,bounds="admiss")

summary(fit)
summary(fit2)

plot(fit$state[,2],xlab="Year",ylab="Growth rate")

