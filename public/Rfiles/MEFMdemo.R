library(MEFM)

# Number of days in each "season"
seasondays

# Historical economic data
sa.econ
plot(sa.econ)

# Historical temperature and calendar data
head(sa)
tail(sa)
dim(sa)


plot(ts(sa[,"temp1"], start=c(2000,7*48), freq=seasondays*48),
     xlab="Year",ylab="degrees C")
plot(ts(sa[,"temp2"], start=c(2000,7*48), freq=seasondays*48),
     xlab="Year",ylab="degrees C")

# create lagged temperature variables
salags <- maketemps(sa,2,48)
dim(salags)
head(salags)

# formula for annual model
formula.a <- as.formula(anndemand ~ gsp + ddays + resiprice)

# formulas for half-hourly model
# These can be different for each half-hour
formula.hh <- list()
for(i in 1:48)
  formula.hh[[i]] <- as.formula(log(ddemand) ~ ns(temp, df=2)
                       + day + holiday
                       + ns(timeofyear, df=9) + ns(avetemp, df=3)
                       + ns(dtemp, df=3) + ns(lastmin, df=3)
                       + ns(prevtemp1, df=2) + ns(prevtemp2, df=2)
                       + ns(prevtemp3, df=2) + ns(prevtemp4, df=2)
                       + ns(day1temp, df=2) + ns(day2temp, df=2)
                       + ns(day3temp, df=2) + ns(prevdtemp1, df=3)
                       + ns(prevdtemp2, df=3) + ns(prevdtemp3, df=3)
                       + ns(day1dtemp, df=3))

# Fit all models
sa.model <- demand_model(salags, sa.econ, formula.hh, formula.a)

# Summary of annual model
summary(sa.model$a)

# Summary of half-hourly model at 4pm
summary(sa.model$hh[[33]])

# Simulate future normalized half-hourly data
simdemand <- simulate_ddemand(sa.model, sa, simyears=10)

# economic forecasts, to be given by user
afcast <- data.frame(pop=1694, gsp=22573, resiprice=34.65, ddays=642)

# Simulate half-hourly data
demand <- simulate_demand(simdemand, afcast)

# Illustrate the results
plot.ts(ts(demand$demand[,sample(1:10, 4)], freq=48, start=0), xlab="Days",
     main="Simulated demand futures" )

plot(demand$annmax, main="Simulated seasonal maximums",ylab="GW")

boxplot(demand$annmax, main="Simulated seasonal maximums",xlab="GW",
        horizontal=TRUE)
rug(demand$annmax)

plot(density(demand$annmax, bw="SJ"),
     main="Density of seasonal maximum demand", xlab="Demand (GW)")
rug(demand$annmax)
