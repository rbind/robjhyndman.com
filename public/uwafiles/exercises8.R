library(fpp)

# Questions 1&2 hsales

plot(condmilk) # No transformation needed.
tsdisplay(diff(condmilk,12)) # Still looks non-stationary
tsdisplay(diff(diff(condmilk,12))) # Looks stationary
fit1 <- auto.arima(condmilk) # No differences! That looks odd.
fit2 <- auto.arima(condmilk, D=1, d=1) # Use first and seasonal differences

res1 <- residuals(fit1)
res2 <- residuals(fit2)
tsdisplay(res1)
tsdisplay(res2)
Box.test(res1, fitdf=5, lag=24, type="Lj")
Box.test(res2, fitdf=6, lag=24, type="Lj")
# Both models have residuals that look ok.
plot(forecast(fit1))
plot(forecast(fit2))
# Forecasts from model2 look like they have captured the seasonal fluctuations better
# as you would expect given model 1 has no seasonal differencing.
lines(forecast(ets(condmilk))$mean, col="red", lwd=2)
# I think the ARIMA model looks more likely. Note the top of the peaks of
# the ets forecasts are lower than any historical peaks.
fit3 <- stlf(condmilk, method="arima")
lines(fit3$mean, col="green", lwd=2)
# Not far off the ARIMA forecasts
Acf(residuals(fit3))
# Strong seasonal correlations remaining.
# So I'd go with the ARIMA forecasts here.


# Questions 1&2. hsales

plot(hsales) # No transformation needed.
tsdisplay(diff(hsales,12)) # Still looks non-stationary
tsdisplay(diff(diff(hsales,12))) # Looks stationary
fit1 <- auto.arima(hsales) # No differences! That looks odd.
fit2 <- auto.arima(hsales, D=1, d=1) # Use first and seasonal differences

res1 <- residuals(fit1)
res2 <- residuals(fit2)
tsdisplay(res1)
tsdisplay(res2)
Box.test(res1, fitdf=5, lag=24, type="Lj")
Box.test(res2, fitdf=2, lag=24, type="Lj")
# Both models have residuals that look ok.
plot(forecast(fit1))
plot(forecast(fit2))
# Hard to pick between these.
# I don't believe the data are stationary, so I'll go with model 2
lines(forecast(ets(hsales))$mean, col="red", lwd=2)
# Almost no difference between the ARIMA(0,1,0)(0,1,2)[12] and ets models.
# However, the ets model has poor residuals:
Box.test(residuals(ets(hsales)), lag=24, fitdf=17, type="Lj")
# So I would use the ARIMA model as the prediction intervals will be more reliable.
fit3 <- stlf(hsales, method="arima")
lines(fit3$mean, col="green", lwd=2)
# Very close to the ARIMA forecasts
Acf(residuals(fit3))
# Strong seasonal correlations remaining.
# So I'd go with the ARIMA forecasts here.



# Questions 1&2. uselec

plot(uselec) # No transformation needed.
tsdisplay(diff(uselec,12)) # Looks roughly stationary
fit1 <- auto.arima(uselec) # One seasonal difference chosen. Looks ok
fit2 <- auto.arima(uselec, approximation=FALSE, stepwise=FALSE) 

res1 <- residuals(fit1)
res2 <- residuals(fit2)
tsdisplay(res1)
tsdisplay(res2)
Box.test(res1, fitdf=4, lag=24, type="Lj")
Box.test(res2, fitdf=5, lag=24, type="Lj")
# Both models have residuals that look ok.
# But AIC much better for model 2.
plot(forecast(fit1))
plot(forecast(fit2))
# Hard to pick between these.
# But I'll go with model 2 on the basis of the AIC value
lines(forecast(ets(uselec))$mean, col="red")
# Little difference between the ARIMA(1,0,2)(0,1,1)[12] and ets models.
res <- residuals(ets(uselec))
tsdisplay(res)
Box.test(res, lag=24, fitdf=14, type="Lj")
# Ugly. Go with the ARIMA model here.
fit3 <- stlf(uselec, method="arima")
lines(fit3$mean, col="green", lwd=2)
# Close to the ARIMA forecasts
Acf(residuals(fit3))
# Strong seasonal correlations remaining.
# So I'd go with the either the ARIMA forecasts here.


# Question 3


# Download retail.xls file and convert to csv
retail <- ts(read.table("retail.csv", skip=1,
                        sep = ",", header = TRUE,
                        stringsAsFactors = FALSE)[,-1], frequency=12, start=c(1982,4))
# Choose one of the columns at random
col <- sample(1:ncol(retail),1)
# Select series
x <- retail[,col] 

plot(x)
plot(log(x))
tsdisplay(diff(log(x),12))
tsdisplay(diff(diff(log(x),12)))

fit <- auto.arima(x, lambda=0)
res <- residuals(fit)
tsdisplay(res) 
Box.test(res, lag=24, fitdf=length(fit$coef))
# For some of the retail series, the residuals might fail this test.

fc <- forecast(fit)
plot(fc)

# Previous models:
fc1 <- forecast(ets(x))
fc2 <- stlf(x, lambda=0)
lines(fc1$mean, col="red")
lines(fc2$mean, col="green")
