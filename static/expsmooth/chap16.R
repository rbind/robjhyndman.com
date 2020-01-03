library(expsmooth)

alpha = 0.5
lambda <- numeric(51)
y <- numeric(50)
lambda[1] <- 2
set.seed(1)
for(i in 1:50)
{
    y[i] <- rpois(1,lambda[i])
    lambda[i+1] <- (1-alpha)*lambda[i] + alpha*y[i]
}
y <- ts(y,s=1)

plot(y)


## SIMULATE FROM CROSTON'S METHOD

lambda = 5
alpha = 0.2
y <- numeric(1000)
for(i in 1:1000)
{
    y[i] <- rpois(1,lambda-1)+1
    lambda <- (1-alpha)*lambda + alpha*y[i]
}
plot(ts(y))


lambda = 50
alpha = 0.2
y <- numeric(1000)
for(i in 1:1000)
{
    y[i] <- rgeom(1,1/lambda)  +1
    lambda <- (1-alpha)*lambda + alpha*y[i]
}
plot(ts(y))

## CAR PARTS

plot(rowMeans(carparts,na.rm=TRUE),type="l",xlab="Age (months)",ylab="Average demand per month")
