require(fpp)

# US consumption and income
plot(usconsumption,main="Quarterly changes in US consumption and personal income",xlab="Year", oma.multi=c(4,0,1.5,0))
mtext("Quarterly changes in US consumption and personal income",side=3,outer=TRUE,line=-1,font=2)

plot(usconsumption[,1] ~ usconsumption[,2],xlab="income",ylab="consumption",main="Quarterly changes in US consumption and personal income")

plot(consumption ~ c(NA,income[-nrow(usconsumption)]), data=usconsumption)

# OLS
fit <- tslm(consumption ~ income, data=usconsumption)
tsdisplay(residuals(fit))

# Try with AR(2) proxy
fit <- Arima(usconsumption[,1], xreg=usconsumption[,2],
          order=c(2,0,0))
tsdisplay(arima.errors(fit))

auto.arima(arima.errors(fit)) # ARIMA(1,0,2)

# Refit with ARIMA(1,0,2) errors
(fit2 <- Arima(usconsumption[,1], xreg=usconsumption[,2],
             order=c(1,0,2)))
#summary(fit2)
# Check residuals
#tsdisplay(residuals(fit2))
Box.test(residuals(fit2),fitdf=5,lag=10,type="Ljung")

# Do it all automatically
fit3 <- auto.arima(usconsumption[,1],xreg=usconsumption[,2])


fcast <- forecast(fit2,xreg=rep(mean(usconsumption[,2]),8),h=8)

plot(fcast,main="Forecasts from regression with ARIMA(1,0,2) errors")


# Stochastic and deterministic trends

plot(austa,xlab="Year",ylab="millions of people",main="Total annual international visitors to Australia")


auto.arima(austa,d=0,xreg=1:length(austa))
auto.arima(austa,d=1)


fit1 <- Arima(austa,order=c(0,1,0),include.drift=TRUE)
fit2 <- Arima(austa,order=c(2,0,0),include.drift=TRUE)

par(mfrow=c(2,1))
plot(forecast(fit2),main="Forecasts from linear trend + AR(2) error",ylim=c(1,8))
plot(forecast(fit1),ylim=c(1,8))


# Fourier terms

fit <- auto.arima(USAccDeaths, xreg=fourier(USAccDeaths, 5), seasonal=FALSE)
fc <- forecast(fit, xreg=fourierf(USAccDeaths, 5, 24))
plot(fc)


## Allstate TV-advertising example
#The data began in jan 2002 . It is national advertising expenditures to promote an insurance company (Allstate). The output series is the number of quotes that the company provided per month.


plot(insurance, main="Insurance advertising and quotations", xlab="Year")

# Lagged predictors. Test 0, 1, 2 or 3 lags.
Advert <- cbind(insurance[,2],
 c(NA,insurance[1:39,2]),
 c(NA,NA,insurance[1:38,2]),
 c(NA,NA,NA,insurance[1:37,2]))
colnames(Advert)  <- paste("AdLag",0:3,sep="")

# Choose optimal lag length for advertising based on AIC
# Restrict data so models use same fitting period
fit1 <- auto.arima(insurance[4:40,1], xreg=Advert[4:40,1], d=0)
fit2 <- auto.arima(insurance[4:40,1], xreg=Advert[4:40,1:2], d=0)
fit3 <- auto.arima(insurance[4:40,1], xreg=Advert[4:40,1:3], d=0)
fit4 <- auto.arima(insurance[4:40,1], xreg=Advert[4:40,1:4], d=0)

# Best model fitted to all data (based on AICc)
# Refit using all data
fit <- auto.arima(insurance[,1], xreg=Advert[,1:2], d=0)


fc10 <- forecast(fit,xreg=cbind(c(Advert[40,1],rep(10,19)),rep(10,20)),h=20)
fc8 <- forecast(fit,xreg=cbind(c(Advert[40,1],rep(8,19)),rep(8,20)),h=20)
fc6 <- forecast(fit,xreg=cbind(c(Advert[40,1],rep(6,19)),rep(6,20)),h=20)


plot(fc10,main="Forecast quotes with advertising set to 10",ylab="Quotes")

plot(fc8,main="Forecast quotes with advertising set to 8",ylab="Quotes")

plot(fc6,main="Forecast quotes with advertising set to 6",ylab="Quotes")


fit <- arimax(insurance[,1],xtransf=insurance[,2],transfer=list(c(1,0)),order=c(3,0,0),method="ML")

## NO FORECASTING METHOD AVAILABLE!!!

