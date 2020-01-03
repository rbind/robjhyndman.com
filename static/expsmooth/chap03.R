
## FIGURE 3.2

alpha <- 0.1
sigma <- 5
y <- l <- numeric(30)
l[1] <- 100
set.seed(9999)
e <- rnorm(30,0,sigma^2)
for(i in 1:30)
{
    y[i] <- l[i] + e[i]
    l[i+1] <- l[i] + alpha*e[i]
}
plot(ts(y[1:30]),type="o",ylab="y",xlab="Time period")
lines(ts(l[2:31]),lwd=2)


# FIGURE 3.3

sigma <- 5
y1 <- y2 <- y3 <- l <- numeric(40)
l[1] <- 100
e <- rnorm(40,0,sigma^2)
for(i in 1:40)
{
    y1[i] <- l[i] + e[i]
    l[i+1] <- l[i] + 0.1*e[i]
}
for(i in 1:40)
{
    y2[i] <- l[i] + e[i]
    l[i+1] <- l[i] + 0.5*e[i]
}
for(i in 1:40)
{
    y3[i] <- l[i] + e[i]
    l[i+1] <- l[i] + 1.5*e[i]
}

par(mfrow=c(3,1))
plot(ts(y1),xlab="Time period",ylab="y")
text(20,max(y1)-4,expression(alpha == 0.1))
plot(ts(y2),xlab="Time period",ylab="y")
text(20,max(y2)-5,expression(alpha == 0.5))
plot(ts(y3),xlab="Time period",ylab="y")
text(20,max(y3)-11,expression(alpha == 1.5))

# FIGURE 3.4

sigma <- 5
y1 <- y2 <- y3 <- l <- b <- numeric(40)
l[1] <- 100
b[1] <- 1
e <- rnorm(40,0,sigma^2)
for(i in 1:40)
{
    y1[i] <- l[i] + b[i] + e[i]
    l[i+1] <- l[i] + b[i] + 0*e[i]
    b[i+1] <- b[i] + 0*e[i]
}
for(i in 1:40)
{
    y2[i] <- l[i] + b[i] + e[i]
    l[i+1] <- l[i] + b[i] + 0.5*e[i]
    b[i+1] <- b[i] + 0.1*e[i]
}
for(i in 1:40)
{
    y3[i] <- l[i] + b[i] + e[i]
    l[i+1] <- l[i] + b[i] + 1.2*e[i]
    b[i+1] <- b[i] + 1*e[i]
}

par(mfrow=c(3,1))
plot(ts(y1),xlab="Time period",ylab="y")
text(20,max(y1)-3,expression(paste(alpha == 0," and ",beta==0)))
plot(ts(y2),xlab="Time period",ylab="y")
text(20,max(y2)-8,expression(paste(alpha == 0.5," and ",beta==0.1)))
plot(ts(y3),xlab="Time period",ylab="y")
text(20,max(y3)-35,expression(paste(alpha == 1.2," and ",beta==1.0)))

