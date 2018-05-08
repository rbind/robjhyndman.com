library(fpp)

#Q1
fc <- snaive(bricksq)
plot(fc)
tsdisplay(residuals(fc), plot.type="scatter")
Box.test(residuals(fc), type="L", lag=8)
# Strong autocorrelation in the residuals although no seasonality.
# The forecasting method has missed the cyclic behaviour, especially in the last 20 years.
# Ljung-Box test shows strong rejection of white noise hypothesis for residuals

fc <- rwf(ibmclose, drift=TRUE)
plot(fc)
tsdisplay(residuals(fc), plot.type="scatter")
Box.test(residuals(fc), type="L", lag=10)
# Residuals look quite good. Some larger autocorrelations at lags 6, 16 and 17, but not too bad.
# Ljung-Box test cannot distinguish residuals from white noise

fc <- snaive(hsales)
plot(fc)
tsdisplay(residuals(fc), plot.type="scatter")
Box.test(residuals(fc), type="L", lag=10)
# Very poor residuals with significant correlations for the first 10 lags.
# Time plot shows some cyclic or wandering behaviour in the residuals
# Ljung-Box test shows strong rejection of white noise hypothesis for residuals


#Q2

plot(plastics)
# Strong seasonality plus a linear trend

decomp <- stl(plastics, s.window="periodic")
plot(decomp)
# Seasonality unchanged over the five year period
# Dip in trend at end was not noticeable in first plot

sa <- seasadj(decomp)
plot(sa)

x <- plastics
x[20] <- x[20] + 500
sa2 <- seasadj(stl(x, s.window="periodic"))
sa3 <- seasadj(stl(x, s.window="periodic", robust=TRUE))
plot(sa, col="blue", ylim=range(sa,sa2,sa3))
lines(sa2,col="red")
lines(sa3, col="green")
# If robust=FALSE, the seasonal adjusted series changes across the whole data set
# If robust=TRUE, only the outlying point changes noticeably.

x <- plastics
x[59] <- x[59] + 500 # Second last observation
sa2 <- seasadj(stl(x, s.window="periodic"))
sa3 <- seasadj(stl(x, s.window="periodic", robust=TRUE))
plot(sa, col="blue", ylim=range(sa,sa2,sa3))
lines(sa2,col="red")
lines(sa3, col="green")
# If robust=FALSE, the seasonal adjusted series changes across the whole data set
# If robust=TRUE, the effect is less, but still noticeable changes across the whole series
# Having outlier near end gives it more impact

fc <- stlf(plastics, method="naive")
plot(fc)
# Forecasts look too low. Due to drop in seasonally adjusted data near end of series


