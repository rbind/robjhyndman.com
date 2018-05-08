######################################
## X ~ N(0,1).  Y ~ N(1,1)          ##
######################################

m <- n <- 50
x <- rnorm(m,0,1)
y <- rnorm(n,1,1)
hopt <- h.norm2(0,1,1,1,n,n)

ROCa1 <- ROC.est(x,y,hx=hopt$hx,hy=hopt$hy)
ROCb1 <- ROC.est(x,y,method="norm")
ROCc1 <- ROC.est(x,y,method="lloyd")
ROCd1 <- ROC.est(x,y,method="ratio")

plot(ROC.rawest(x,y),type="s",xlab="False positive",ylab="True positive")
lines(ROCa1,col=2)
lines(ROCb1,col=3)
lines(ROCc1,col=4)
lines(ROCd1,col=5)
