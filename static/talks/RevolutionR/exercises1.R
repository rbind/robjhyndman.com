library(fpp)

# Question 1

import <- read.csv("https://robjhyndman.com/data/tute1.csv")
tute1 <- ts(import[,-1], start=1981, frequency=4)
# First column removed because it contained dates. We don't need these as 
# R handles dates within the ts class.
plot(tute1)
# All three series are seasonal but have no trend.
# GDP is "noisier" (i.e., more irregular) than the other two
# Seasonality for AdBuget and Sales is very similar with peaks and troughs coinciding.
# Peaks in GDP coincide with troughs in the ADBudget and Sales


# Question 2

plot(dowjones)
fc <- rwf(dowjones, drift=TRUE)
plot(fc)
# Add line between first and last observations:
slope <- (dowjones[78] - dowjones[1]) / (78-1)
abline(dowjones[1]-slope,slope,col="red")

# Question 3

plot(naive(bicoal))
plot(naive(chicken)) # Note that the lower limits of the prediction interval are negative
                     # which makes no sense. But the point forecasts are ok.
plot(rwf(dole, drift=TRUE))
plot(snaive(usdeaths))
plot(snaive(bricksq))
plot(naive(lynx)) # Bad forecasts, but we don't have a better method yet. 
                  # Wait until later in the course!
