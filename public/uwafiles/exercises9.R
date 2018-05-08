library(fpp)

# Exercise 1

fit <- StructTS(eggs)
plot(forecast(fit,h=10))

fit2 <- ets(eggs)
plot(forecast(fit2,h=10))

Acf(residuals(fit))
Acf(residuals(fit2))


# Exercise 2
# Updating regression using Kalman filter

z = usconsumption[,1]
y = usconsumption[,2]
yhat = v = e = numeric(165)
xtt = matrix(0,nrow=2,ncol=164)
xtt1 = matrix(0,nrow=2,ncol=165)
Ptt = Ptt1 = matrix(0,2,2)
n <- nrow(usconsumption)
s2 <- 1
Ptt1[1,1] = Ptt1[2,2] = 1e9
for(i in 1:n)
{
  f <- matrix(c(1,z[i]),ncol=1)
  yhat[i] = t(f) %*% xtt1[,i]
  v[i] = t(f) %*% Ptt1 %*% f + s2
  e[i] = y[i] - yhat[i]
  xtt[,i] = xtt1[,i] + Ptt1 %*% f * e[i] / v[i]
  Ptt = Ptt1 - Ptt1 %*% f %*% t(f) %*% Ptt1 / v[i]
  xtt1[,i+1] = xtt[,i]
  Ptt1 = Ptt
}

# (c) Value of sigma2 is cancelled as it is a nuisance parameter
# So set to 1 above arbitrarily

# (d)
coefficients(lm(y ~ z))
xtt[,n]

# (e)
#These are stored in xtt

# (f)
par(mfrow=c(1,1))
plot.ts(xtt[1,],ylab="a")
plot.ts(xtt[2,],ylab="b")
# No evidence of much change over time from plots

#(g)
# It can be estimated using the variance of the residuals

