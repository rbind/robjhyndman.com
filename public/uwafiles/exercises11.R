library(hts)

plot(infantgts)
smatrix(infantgts)

# Forecast 10-step-ahead and reconcile the forecasts
infantforecast <- forecast(infantgts, h=10)

# plot the forecasts including the last ten historical years
plot(infantforecast, include=10)

# Create a matrix of all aggregated time series
allts_infant <- aggts(infantgts)

# Forecast all series using ARIMA models
allf <- matrix(, nrow=10, ncol=ncol(allts_infant))
for(i in 1:ncol(allts_infant))
  allf[,i] <- forecast(auto.arima(allts_infant[,i]), h=10)$mean
allf <- ts(allf, start=2004)

# combine the forecasts with the group matrix to get a gts object
y.f <- combinef(allf, groups = infantgts$groups)

# set up the training sample and testing sample
data <- window(infantgts, start=1933, end=1993)
test <- window(infantgts, start=1994, end=2003)

# Compute forecasts on trainingdata
forecast <- forecast(data, h=10)

# calculate ME, RMSE, MAE, MAPE, MPE and MASE
accuracy.gts(forecast, test)

