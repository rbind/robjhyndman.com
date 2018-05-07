library(fpp)
library(dlm)

# Local level model
mod <- dlmModPoly(1, dV=.8, dW=.1)
names(mod)
FF(mod)
GG(mod)
class(mod)

loclevel <- function(p) {
  dlmModPoly(1, dV=exp(p[1]), dW=exp(p[2]))
}
fit <- dlmMLE(oil, parm=c(0,0), build=loclevel)
oil.fit <- loclevel(fit$par)
V(oil.fit)
W(oil.fit)

StructTS(oil, type="level")

# Local trend model

dlm(FF=matrix(c(1,0),nrow=1), GG=matrix(c(1,0,1,1),ncol=2), 
    V=0.8, W=diag(c(0.2,0.1)), m0=c(0,0), C0=diag(c(1e7,1e7)))
dlmModPoly(order=2, dV=0.8, dW=c(0.2,0.1))

mod <- dlmModPoly(2)
FF(mod)
GG(mod)
V(mod)
W(mod) # Default is to set level variance to zero

loctrend <- function(p) {
  dlmModPoly(2, dV=exp(p[1]), dW=exp(p[2:3]))
}
fit <- dlmMLE(ausair, parm=c(0,0,0), build=loctrend)
ausair.fit <- loctrend(fit$par)
V(ausair.fit)
W(ausair.fit)

StructTS(ausair, type="trend")


# Time varying regression
tvr <- function(p) {
  dlmModReg(X=usconsumption[,1], dV=exp(p[1]), dW=exp(p[2:3])) 
}
fit <- dlmMLE(usconsumption[,2], parm=c(0,0,0), 
              build=tvr)
tvr.fit <- tvr(fit$par)
JFF(tvr.fit)
GG(tvr.fit)
V(tvr.fit)
W(tvr.fit)

# Linear regression with AR(2) errors

regar2 <- function(p) {
  dlmModReg(z, dV=.0001, dW=c(0,0)) + 
    dlmModARMA(ar=c(p[1],p[2]), sigma=exp(p[3]))
}
z <- usconsumption[,1]
fit <- dlmMLE(usconsumption[,2], parm=c(0,0,0), build=regar2)
mod <- regar2(fit$par)


# BSM model
bsm <- function(p) {
  mod <- dlmModPoly() + dlmModSeas(4)
  V(mod) <- exp(p[1])
  diag(W(mod))[1:3] <- exp(p[2:4])
  return(mod)
}
fit <- dlmMLE(austourists, parm=c(0,0,0,0), 
              build=bsm)
ausbsm <- bsm(fit$par)
FF(ausbsm)
GG(ausbsm)
V(ausbsm)
W(ausbsm)

ausSmooth <- dlmSmooth(austourists, mod = ausbsm)
x <- cbind(austourists, dropFirst(ausSmooth$s[,c(1,3)]))
colnames(x) <- c("Aus tourists", "Trend", "Seasonal")
plot(x, type = 'o', main = "Australian tourist numbers")

Filt <- dlmFilter(austourists, mod = ausbsm)
Fore <- dlmForecast(Filt, nAhead = 20)
fsd <- sqrt(unlist(Fore$Q))
pl <- Fore$f + qnorm(0.05, sd = fsd)
pu <- Fore$f + qnorm(0.95, sd = fsd)
fc <- list(mean=Fore$f, lower=pl, upper=pu, 
           x=austourists, level=90)
plot.forecast(fc,  main="Australian tourists")

