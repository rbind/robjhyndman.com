# Looking for functions to fit neural networks
help.search("neural")
??neural

library(sos)
findFn("neural")
RSiteSearch("neural")

# Updating all core packages in the TimeSeries task view
library(ctv)
update.views("TimeSeries", coreOnly = TRUE)

# Digging into the forecast function for ets models
library(forecast)
forecast
forecast.ets
forecast:::pegelsfcast.C

# Tidy code
library(formatR)
tidy.dir(reindent.spaces = 2)

# Debugging
library(forecast)
rwf(gold, drift = TRUE)
debug(rwf)
rwf(gold, drift = TRUE)
# Doesn't handle missing values properly.  Need to fix in the next version!
undebug(rwf)


 
