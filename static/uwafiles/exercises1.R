library(fpp)

# Question 1

plot(dowjones)
fc <- rwf(dowjones, drift=TRUE)
plot(fc)
# Add line between first and last observations:
slope <- (dowjones[78] - dowjones[1]) / (78-1)
abline(dowjones[1]-slope,slope,col="red")

# Question 2

plot(naive(bicoal))
plot(naive(chicken)) # Note that the lower limits of the prediction interval are negative
                     # which makes no sense. But the point forecasts are ok.
plot(rwf(dole, drift=TRUE))
plot(snaive(usdeaths))
plot(snaive(bricksq))
plot(naive(lynx)) # Bad forecasts, but we don't have a better method yet. 
                  # Wait until later in the course!
