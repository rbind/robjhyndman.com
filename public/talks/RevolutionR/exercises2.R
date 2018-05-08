library(fpp)

# Question 1

bricks1 <- window(bricksq, end=1987.99)
bricks2 <- window(bricksq, start=1988)
plot(bricksq)
lines(bricks1, col="red")
lines(bricks2, col="blue")
h <- length(bricks2)

f1 <- meanf(bricks1, h=h)
f2 <- rwf(bricks1, h=h)
f3 <- rwf(bricks1, drift=TRUE, h=h)
f4 <- snaive(bricks1, h=h)

accuracy(f1,bricks2)
accuracy(f2,bricks2)
accuracy(f3,bricks2)
accuracy(f4,bricks2)

# Sasonal naive does better on test set
# Only method to allow for seasonality

plot(f4)
lines(bricks2)

res <- residuals(f4)
plot(res)
hist(res, breaks="FD")
# Residuals are not uncorrelated. Some cyclic behaviour, especially in second half
# Long left tail suggests they are not normal.



# Question 2

plot(ibmclose)

ibm1 <- window(ibmclose, end=300)
ibm2 <- window(ibmclose, start=301)
h <- length(ibm2)

f1 <- meanf(ibm1, h=h)
f2 <- rwf(ibm1, h=h)
f3 <- rwf(ibm1, drift=TRUE, h=h)

accuracy(f1,ibm2)
accuracy(f2,ibm2)
accuracy(f3,ibm2)

# Drift does best
# Wandering behaviour makes mean unsuitable.
# Slight downward drift continues in test period

plot(f3)
lines(ibm2)

res <- residuals(f3)
plot(res)
hist(res, breaks="FD")
# Residuals look relatively uncorrelated, but the distribution is not normal (tails too long)

# Question 3

hsales1 <- window(hsales, end=end(hsales)-c(2,0))
hsales2 <- window(hsales, start=end(hsales)-c(1,11))
plot(hsales)
lines(hsales1, col="red")
lines(hsales2, col="blue")
h <- length(hsales2)

f1 <- meanf(hsales1, h=h)
f2 <- rwf(hsales1, h=h)
f3 <- rwf(hsales1, drift=TRUE, h=h)
f4 <- snaive(hsales1, h=h)

accuracy(f1,hsales2)
accuracy(f2,hsales2)
accuracy(f3,hsales2)
accuracy(f4,hsales2)

# Seasonal naive best
# Only method that is seasonal

plot(f4)
lines(hsales2)

res <- residuals(f4)
plot(res)
hist(res, breaks="FD")
# Residuals are not uncorrelated. They show some cyclic behaviour

