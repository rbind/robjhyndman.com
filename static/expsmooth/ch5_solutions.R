require(expsmooth)

# Exercise 5.1

plot(usgdp)

# Initial value for level
l0 <- coef(lm(usgdp[1:10] ~ I(1:10)))[1]

# Sum of squared errors function
S <- function(x) {
  a <- x[1]
  if(a < 0 | a > 1)
      return(Inf)
  n <- length(usgdp)
  l <- numeric(n+1)
  error <- numeric(n)
  l[1] <- x[2]
  for(i in 1:n) {
    error[i] <- usgdp[i]-l[i]
    l[i+1] <-  a*usgdp[i] + (1-a)*l[i]
  }
  return(sum(error^2))
}

optim(c(0.5,l0),S)

# $par
# 1.000    1570.596 

ets(usgdp,"ANN")

# Smoothing parameters:
#   alpha = 0.9999 
# Initial states:
#   l = 1570.5974 


# Exercise 5.2

ets(log(usgdp), model="AAN", damped=FALSE, lower=c(0,0,0,0.8),beta=0)

# ETS(A,A,N) 
# 
# Smoothing parameters:
#   alpha = 0.9999 
#   beta  = 0 
# 
# Initial states:
#   l = 7.3523 
#   b = 0.0083 
# 
# sigma:  0.0098
# 
# AIC      AICc       BIC 
# -888.2461 -888.1431 -877.8419 


# Exercise 5.3

# Sum of squared errors function
# Compute log augmented sum of squares to avoid numerical problems with large numbers
S <- function(x) {
  n <- length(usgdp)
  l <- numeric(n+1)
  error <- numeric(n)
  a <- x[1]
  l[1] <- x[2]
  b <- x[3]
  if(a < 0 | a > 1 | b < 0)
    return(Inf)
  for(i in 1:n) {
    error[i] <- usgdp[i]/(l[i]*b) - 1
    l[i+1] <-  a*usgdp[i] + (1-a)*l[i]*b
  }
  #browser()
  return(log(sum(error^2)) + 2*sum(log(abs(l[1:n]*b)))/n)
}

optim(c(0.5,l0,1),S)

# $par
# (Intercept)              
# 0.9999999 1572.7853342    1.0084419 
# 
# $value
# [1] 13.02352

# Compare ETS function:
fit1 <- ets(usgdp, model="MMN", damped=FALSE, lower=c(0,0,0,0.8),beta=0)

# Compare Ex 5.2
fit2 <- ets(usgdp, model="AAN", damped=FALSE, lower=c(0,0,0,0.8),beta=0,lambda=0)
plot(forecast(fit1,h=50))
lines(forecast(fit2,h=50)$mean,col="red")

