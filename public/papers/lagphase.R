# Main function. Give it a set of data where the columns include
#  year
#  frequency
#  specimens
# It will find appropriate knots if not specified
# It will choose an appropriate order if not specified
# Just don't give it knots but no order
# If gam=TRUE, it will return a gam model instead.

lagphase <- function(data, knots=NULL, order=1, gam=FALSE,zeros=TRUE)
{
  # Set zeros to missing
  if(!zeros)
    data$frequency[data$frequency==0] <- NA
  else
    data$frequency[data$specimens==0] <- NA
  
  # Fit gam
  if(gam)
  {
    gamfit <- gam(frequency ~ s(year), offset=log(specimens), data=data, family=poisson)
    gamfit$year <- data$year
    gamfit$name <- paste(data$island,"island:",data$species)
    return(gamfit)
  }
  
  # Otherwise fit a glm
  # Check if knots==0 meaning no knots to be included
  if(!is.null(knots))
  {
    if(length(knots)==1)
    {
      if(knots==0) # i.e., no knots to be included
      {
        # Fit model with no knots
        suppressWarnings(fit <- glm(frequency ~ 1, offset=log(specimens), data=data, family=poisson, na.action=na.omit))
        fit$year <- data$year
        if(!is.null(data$island))
          fit$name <- paste(data$island,"island:",data$species)
        else
          fit$name <- deparse(substitute(data))
        fit$data <- data
        fit$lengthlag <- NA
        fit$lagphase <- FALSE        
        class(fit) <- c("lagphase","glm","lm")
        return(fit)
      }
    }
  }
  
  # Otherwise proceed 
  # Choose order if not provided
  if(is.null(order))
  {
    if(!is.null(knots))
      stop("Not implemented. If you specify the knots, you need to specify the order.")
    fit1 <- lagphase(data, order=1)
    fit3 <- lagphase(data, order=3)
    bestfit <- fit1
    if(AICc(fit3) < AICc(bestfit))
      bestfit <- fit3
    return(bestfit)    
  }
  # Otherwise proceed with specified order
  if(!is.null(knots))
  {
    return(lagphase.knots(knots, data, order))
  }
  # Otherwise order specified but knots unspecified
  
  # Choose some initial knots
  knots <- quantile(data$year,prob=c(0.2,0.4,0.6,0.8))
  names(knots) <- NULL
  
  # Fit best 4, 3, 2, 1 and 0 knot models
  fit4 <- optim(knots, tryknots, data=data, order=order)
  fit3 <- optim(knots[2:4], tryknots, data=data, order=order)
  fit2 <- optim(knots[c(2,4)], tryknots, data=data, order=order)
  fit1 <- optim(knots[2], tryknots, data=data, order=order, method="Brent", 
                lower=min(data$year), upper=max(data$year))
  suppressWarnings(fit0 <- glm(frequency ~ 1, offset=log(specimens), family=poisson, data=data, na.action=na.omit))
  
  # Find best of these models:
  bestfit <- fit4
  if(fit3$value < bestfit$value)
    bestfit <- fit3
  if(fit2$value < bestfit$value)
    bestfit <- fit2
  if(fit1$value < bestfit$value)
    bestfit <- fit1
  if(AICc(fit0) < bestfit$value)
  {
    bestfit <- fit0
    bestfit$year <- data$year
    if(!is.null(data$island))
      bestfit$name <- paste(data$island,"island:",data$species)
    else
      bestfit$name <- deparse(substitute(data))
    bestfit$data <- data
  }
  else  # Refit best model
    bestfit <- lagphase.knots(bestfit$par, data=data, order=order)
  
  if(is.null(bestfit$knots))
  {
    bestfit$lagphase <- FALSE
    bestfit$lengthlag <- NA
  }
  return(bestfit)
}


# Fit model with lag phase followed by growth
# where knots and order are specified
lagphase.knots <- function(knots, data, order)
{
  x <- matrix(NA,ncol=length(knots),nrow=length(data$year))
  #x[,1] <- as.numeric(data$year < knots[1])
  for(i in 1:length(knots))
    x[,i] <- pmax((data$year-knots[i])^order,0)

  suppressWarnings(fit <- glm(frequency ~ x, offset=log(specimens), family=poisson, data=data, na.action=na.omit))
  fit$knots <- knots
  names(fit$knots) <- paste("K",1:length(knots),sep="")
  fit$year <- data$year
  fit$order <- order
  if(!is.null(data$island))
    fit$name <- paste(data$island,"island:",data$species)
  else
    fit$name <- deparse(substitute(data))    
  fit$data <- data
  
  # Check if there is a lag phase and record it
  fit$lengthlag <- NA
  if(length(fit$knots) > 0)
  {
    if(fit$coef[2] > 0)
      fit$lengthlag <- fit$knots[1] - data$year[1]
  }
  fit$lagphase <- !is.na(fit$lengthlag)
  
  class(fit) <- c("lagphase","glm","lm")
  return(fit)
}

# Check that the specified knots make sense.
# Then use lagphase.knots to fit the model
# Returns AIC of fitted model
tryknots <- function(knots, data, order)
{
  # Knots must be interior to the data
  if(min(knots) < min(data$year))
    return(1e50)
  if(max(knots) > max(data$year))
    return(1e50)
  # Knots must be five years apart and ordered
  if(length(knots) > 1)
  {
    dk <- diff(knots)
    if(min(diff(knots)) < 5)
      return(1e50)
  }
  # OK. Now fit the model
  fit <- lagphase.knots(knots, data, order)
  # Return the AICc of the fitted model
  return(AICc(fit))
}

# Function to return corrected AIC from a fitted object
AICc <- function(object)
{
  aic <- object$aic
  k <- length(object$coefficients)
  n <- object$df.residual+k
  aicc <- aic + 2*k*(k+1)/(n-k-1)
  return(aicc)  
}
  
# Produces plot of the fitted spline function after adjusting for 
# number of specimens

plot.lagphase <- function(fit,ylim=NULL,xlab="Year", ylab="Adjusted frequency", main=fit$name,...)
{
  fits <- predict(fit, se.fit=TRUE)
  #specimens <- model.matrix(fit)[,"specimens"]
  #adjfits <- fits$fit - coef(fit)["specimens"]*(specimens - mean(specimens))
  adjfits <- exp(fits$fit - fit$offset + mean(fit$offset,na.rm=TRUE))
  up <- adjfits * exp(2*fits$se.fit)
  lo <- adjfits * exp(-2*fits$se.fit)
  if(is.null(ylim))
    ylim <- range(lo,up)
  j <- (fit$data$specimens > 0)
  plot(fit$data$year[j],adjfits, ylim=ylim, type="n", xlab=xlab,ylab=ylab,
       main=main,...)
  polygon(c(fit$data$year[j],rev(fit$data$year[j])),c(lo,rev(up)),border=FALSE,col="gray")
  lines(fit$data$year[j],adjfits)
  if(!is.null(fit$knots))
    abline(v=fit$knots[1],col="gray")
  rug(fit$year[fit$data$frequency > 0])
}


freqplot <- function(fit1, fit2=NULL, fit3=NULL, fit4=NULL, 
                    xlab="Year", ylab="Frequency", main=fit1$name, cols=2:5, ...)
{
  if(is.element("data",names(fit1)))
    data <- fit1$data
  else
  {
    data <- fit1
    fit1 <- NULL
  }
  
  plot(frequency ~ year, data=data, xlab=xlab, ylab=ylab, main=main, 
       ylim=range(0,data$frequency,na.rm=TRUE),...)
  j <- (data$specimens > 0)
  if(!is.null(fit1))
    lines(data$year[j],fitted(fit1),col=cols[1])
  if(!is.null(fit2))
    lines(data$year[j],fitted(fit2),col=cols[2])
  if(!is.null(fit3))
    lines(data$year[j],fitted(fit3),col=cols[3])
  if(!is.null(fit4))
    lines(data$year[j],fitted(fit4),col=cols[4])
}

# Fit piecewise linear model
pwlm <- function(x,y)
{
  # choose knot
  minmse <- Inf
  xgrid <- seq(min(x),max(x),l=102)[-c(1,102)]
  for(k in xgrid)
  {
    x2 <- pmax(x-k,0)
    fit <- lm(y ~ x + x2)
    res <- residuals(fit)
    mse <- mean(res^2)
    if(mse < minmse)
    {
      bestfit <- fit
      bestfit$k <- k
      minmse <- mse
    }
  }
  return(bestfit)
}

print.lagphase <- function(x,...)
{
  if(x$lagphase)
  {
    cat(paste("Lag phase: ",x$data$year[1],"-",round(x$data$year[1]+x$lengthlag),
              " (",round(x$lengthlag)," years)\n",sep=""))
  }
  else
  {  
    cat("No lag phase identified\n")
  }
  if(length(x$coef) > 1)
  {
    cat("  Knots:",x$knots,"\n")
  }
  stats:::print.lm(x,...) 
}

# Extract frequency data for given island and species from data
# If zeros=TRUE, include zeros in returned data

get.species <- function(x, y, island, species, zeros=TRUE)
{
  out <- subset(x, x[,1]==island & x[,2]==species)
  out <- out[,c(3,4,6)]
  colnames(out) <- c("year","frequency","specimens")
  if(zeros)
  {
    yrs <- min(out$year):max(out$year)
    zeros <- as.data.frame(matrix(0,nrow=length(yrs),ncol=3))
    colnames(zeros) <- colnames(out)
    zeros[,"year"] <- yrs
    j <- is.element(zeros[,"year"],out[,"year"])
    zeros[j,"frequency"] <- out[,"frequency"]
    j <- is.element(y[,"Year"],zeros[,"year"])
    zeros[,3] <- y[j,2]
    out <- zeros
  }
  # Either way, frequency is missing if specimens=0
  #out$frequency[out$specimens==0] <- NA
  out <- as.list(out)
  out$species <- species
  out$island <- island
  return(out)
}

