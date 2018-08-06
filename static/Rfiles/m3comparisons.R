require(Mcomp)
nseries <- length(M3)

theta <- as.matrix(M3Forecast$THETA)
fpro <- as.matrix(M3Forecast$ForecastPro)
fcx <- as.matrix(M3Forecast$ForcX)
bjauto <- as.matrix(M3Forecast$`B-J auto`)
ab1 <- as.matrix(M3Forecast$AutoBox1)
ab2 <- as.matrix(M3Forecast$AutoBox2)
ab3 <- as.matrix(M3Forecast$AutoBox3)

ets1 <- aarima <- hybrid <- matrix(NA,nrow=nseries,ncol=18)

for(i in 1:nseries)
{
  print(i)
  ets1[i,] <- forecast(ets(M3[[i]]$x),h=18,PI=FALSE)$mean
  aarima[i,] <- forecast(auto.arima(M3[[i]]$x),h=18)$mean
  hybrid[i,] <- 0.5*(aarima[i,] + ets1[i,])
}

# Compute accuracy
mase <- mape <- smape <- matrix(NA,nrow=10,ncol=nseries)
f <- matrix(NA, nrow=10, ncol=18)
for(i in 1:nseries)
{
  x <- M3[[i]]$xx
  n <- length(x)
  f[1,1:n] <- theta[i,1:n]
  f[2,1:n] <- fpro[i,1:n]
  f[3,1:n] <- fcx[i,1:n]
  f[4,1:n] <- bjauto[i,1:n]
  f[5,1:n] <- ab1[i,1:n]
  f[6,1:n] <- ab2[i,1:n]
  f[7,1:n] <- ab3[i,1:n]
  f[8,1:n] <- ets1[i,1:n]
  f[9,1:n] <- aarima[i,1:n]
  f[10,1:n] <- hybrid[i,1:n]
  scale <- mean(abs(diff(M3[[i]]$x, lag=frequency(x))))
  for(j in 1:10)
  {
    mape[j,i] <- mean(abs((x-f[j,1:n])/x))*100
    smape[j,i] <- mean(abs(x-f[j,1:n])/(abs(x)+abs(f[j,1:n])))*200
    mase[j,i] <- mean(abs(x-f[j,1:n])/scale)
  }
}

# All series
m3table <- matrix(NA, nrow=10, ncol=3)
m3table[,1] <- rowMeans(mape,na.rm=TRUE)
m3table[,2] <- rowMeans(smape)
m3table[,3] <- rowMeans(mase)
rownames(m3table) <- c("Theta","ForecastPro","ForecastX","BJauto",
                       "Autobox1","Autobox2","Autobox3",
                       "ETS","AutoARIMA","Hybrid")
colnames(m3table) <- c("MAPE","sMAPE","MASE")
j <- order(m3table[,3])
round(m3table[j,],2)
