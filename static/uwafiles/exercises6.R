library(fpp)


# Question 1

plot(usnetelec)
tsdisplay(diff(usnetelec)) # Looks stationary

plot(usgdp)
tsdisplay(diff(usgdp)) # Looks stationary

plot(mcopper)
plot(log(mcopper))
tsdisplay(diff(log(mcopper))) # Looks stationary

plot(enplanements)
plot(log(enplanements))
tsdisplay(diff(log(enplanements),12))
tsdisplay(diff(diff(log(enplanements),12))) # Looks stationary

plot(visitors)
plot(log(visitors))
bc <- BoxCox.lambda(visitors)
plot(BoxCox(visitors, bc))
tsdisplay(diff(BoxCox(visitors, bc),12))
tsdisplay(diff(diff(BoxCox(visitors, bc),12))) # Looks stationary


# Question 2.

plot(cangas)
# Variation does not increase with level, so Box-Cox ineffective

# Question 3

# Download retail.xls file and convert to csv
retail <- ts(read.table("retail.csv", skip=1,
                        sep = ",", header = TRUE,
                        stringsAsFactors = FALSE)[,-1], frequency=12, start=c(1982,4))
# Choose one of the columns at random
col <- sample(1:ncol(retail),1)
# Select series
x <- retail[,col] 

# Question 4

x1 <- window(x, end=c(2005,12))
x2 <- window(x, start=2006)
fc1 <- forecast(ets(x1))
lambda <- BoxCox.lambda(x1) # May need to change this.
fc2 <- forecast(ets(x1, additive=TRUE, lambda=lambda))
fc3 <- stlf(x1, lambda=lambda, method="ets")
fc4 <- snaive(x1, lambda=lambda)

Acf(residuals(fc1))
Acf(residuals(fc2))
Acf(residuals(fc3))
Acf(residuals(fc4))

accuracy(fc1, x2)
accuracy(fc2, x2)
accuracy(fc3, x2)
accuracy(fc4, x2)

# For my example, STL + ETS worked the best.
# However, the residuals were still highly seasonal.
# I could try changing the seasonal window



# Question 5

k <- 48 # minimum size for training set
n <- length(x) # Total number of observations
e1 <- matrix(0, ncol=4, nrow=n)
lambda <- BoxCox.lambda(x) # Keep the same lambda throughout.
for(i in 48:(n-1))
{
  train <- ts(x[1:i],freq=12)
  fc1 <- forecast(ets(train),h=1)$mean
  fc2 <- forecast(ets(train, additive=TRUE, lambda=lambda),h=1)$mean
  fc3 <- stlf(train, lambda=lambda, method="ets", h=1)$mean
  fc4 <- snaive(train, lambda=lambda, h=1)$mean
  e[i,1] <- x[i+1]-fc1
  e[i,2] <- x[i+1]-fc2
  e[i,3] <- x[i+1]-fc3
  e[i,4] <- x[i+1]-fc4
}
sqrt(colMeans(e^2,na.rm=TRUE))
