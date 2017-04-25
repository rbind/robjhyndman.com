library(fpp)

(fit <- StructTS(oil, type="level"))
ets(oil, "ANN")
fc <- forecast(fit,h=3)
plot(fc)

(fit2 <- StructTS(ausair, type="trend"))
ets(oil, 'AAN')
fc <- forecast(fit2, h=5)
plot(fc)

(fit3 <- StructTS(austourists, type="BSM"))
ets(austourists,'AAA')
fc <- forecast(fit3, h=8)
plot(fc)
summary(fit3)


## Decomposition
fit <- StructTS(austourists, type = "BSM")
decomp <- cbind(austourists,fitted(fit))
colnames(decomp) <- c("data","level","slope","seasonal")
plot(decomp,main="Decomposition of International visitor nights")

fit2 <- ets(austourists,"AAA")
plot(fit2)

# Smoothing
fit <- StructTS(austourists, type = "BSM")
plot(austourists)
lines(tsSmooth(fit)[,1],col='blue')
lines(fitted(fit)[,1],col='red')
legend("topleft",col=c('blue','red'),lty=1,
       legend=c("Filtered level","Smoothed level"))

# Seasonal adjustment
fit <- StructTS(austourists, type = "BSM")
sm <- tsSmooth(fit)
plot(austourists)
aus.sa <- austourists - sm[,3]
lines(aus.sa,col='blue')

x <- austourists
x[sample(1:length(x), 5)] <- NA
fit <- StructTS(x, type = "BSM")
sm <- tsSmooth(fit)
estim <- sm[,1]+sm[,3]

plot(x,ylim=range(austourists))
points(time(x)[is.na(x)],estim[is.na(x)],col='red',pch=1)
points(time(x)[is.na(x)],austourists[is.na(x)],col='black',pch=1)
legend("topleft",pch=1,col=c(2,1),legend=c("Estimate","Actual"))

