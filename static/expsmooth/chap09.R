require(expsmooth)

plot(fmsales,xlab="Week",ylab="Sales (thousands)",main="Weekly FM Sales",xlim=c(1,64))
polygon(c(63,63.5,63.5,63),c(26.75,26.75,38.43,38.43),col=gray(0.7),border=FALSE)
polygon(c(63,63.5,63.5,63),c(27.33,27.33,35.19,35.19),col=gray(0.2),border=FALSE)

colnames(gasprice) <- c("US retail gas price ($)", "Cushing, OK WTI spot price FOB")
plot(gasprice,main="",xlab="Year",oma.multi=c(3,0,3,0))
mtext(side=3,outer=TRUE,text="U.S. Gasoline and Spot Market Prices",line=-2,cex=1.5,font=2)

dlgas <- diff(log(gasprice))
Ccf(c(dlgas[,1]),c(dlgas[,2]),
    main="Cross correlations for gas and spot prices")

