library(fpp)

#Q1.

plot(bricksq)
seasonplot(bricksq, year.labels=TRUE, year.labels.left=TRUE, col=rainbow(40))
monthplot(bricksq)
# Strong cycles and seasonal patterns
# Fairly simple seasonality with a Q3 peak and not much change from year to year
# A couple of unusual years, the most notable being 1982 where there was a big
# drop from Q2 to Q4 -- also seen in the time plot -- probably the recession in the early 1980s.

plot(writing)
seasonplot(writing, year.labels=TRUE, year.labels.left=TRUE, col=rainbow(10))
monthplot(writing)
# Linear trend with strong seasonality.
# One low month each year (August) and the remaining months relatively constant
# Probably due to holiday period in France
# No unusual years

plot(fancy)
seasonplot(fancy, year.labels=TRUE, year.labels.left=TRUE, col=rainbow(10))
monthplot(fancy)
# Exponential trend and increasing seasonal variation
# Large peak in December each year, much lower in January/February
# Perhaps related to Australian summer holidays, but why so low in Jan/Feb??
# No unusual years

#Q2
tsdisplay(bicoal, plot.type="scatter")
tsdisplay(bricksq, plot.type="scatter")
tsdisplay(hsales, plot.type="scatter")
tsdisplay(ibmclose, plot.type="scatter")
tsdisplay(internet, plot.type="scatter")
tsdisplay(writing, plot.type="scatter")

#Q3
fc <- snaive(bricksq)
plot(fc)
tsdisplay(residuals(fc))
# Strong autocorrelation in the residuals although no seasonality.
# The forecasting method has missed the cyclic behaviour, especially in the last 20 years.

fc <- rwf(ibmclose, drift=TRUE)
plot(fc)
tsdisplay(residuals(fc))
# Residuals look quite good. Some larger autocorrelations at lags 6, 16 and 17, but not too bad.

fc <- snaive(hsales)
plot(fc)
tsdisplay(residuals(fc))
# Very poor residuals with significant correlations for the first 10 lags.
# Time plot shows some cyclic or wandering behaviour in the residuals