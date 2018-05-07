library(hts)

# Simple example
bts <- htseg2$bts
bts
y <- hts(bts, nodes=list(2,c(2,2),c(3,2,3,2)))
y
plot(y,level=0:2)
plot(y)
fc <- forecast(y, h=12)
plot(fc)

####################################################
# big example
ns <- 20000
nobs <- 36
nodes <- list(4,rep(5,4),rep(10,20),
              rep(100,200))
bts <- matrix(rnorm(nobs*ns),ncol=ns,nrow=nobs)
y <- hts(bts, nodes=nodes)
y
plot(y,level=0:2)
#fc <- forecast(y, h=12)

h = 12
fc <- matrix(rnorm(h * sum(unlist(nodes),1)), nrow=h)
dim(fc)
rfc <- combinef(fc, nodes=nodes)

######################################################
# very big example

ns <- 100000
nobs <- 50
h = 12
nodes <- list(4, rep(5,4), rep(5, 20), rep(10,100), rep(100,1000))
fc <- matrix(rnorm(h * sum(unlist(nodes),1)), nrow=h)
dim(fc)
rfc <- combinef(fc, nodes=nodes)



