# f1 maps (0,infinity) to (0,1)
f1 <- function(x,a,b)
{
  eax <- exp(a*x)
  if (eax == Inf)
    f1eax <- 1
  else
    f1eax <- (eax-1)/(eax+b)
  return(f1eax)
}

# f2 maps (0,1) onto (0,1)
f2 <- function(x,a,b)
{
  eax <- exp(a*x)
  ea <- exp(a)
  return((eax-1)/(eax+b)*(ea+b)/(ea-1))
}

# decomposition data - detrend & deseasonal
decomp <- function(x,transform=TRUE)
{
  require(forecast)
  # Transform series
  if(transform & min(x,na.rm=TRUE) >= 0)
  {
    lambda <- BoxCox.lambda(na.contiguous(x))
    x <- BoxCox(x,lambda)
  }
  else
  {
    lambda <- NULL
    transform <- FALSE
  }
  # Seasonal data
  if(frequency(x)>1)
  {
    x.stl <- stl(x,s.window="periodic",na.action=na.contiguous)
    trend <- x.stl$time.series[,2]
    season <- x.stl$time.series[,1]
    remainder <- x - trend - season
  }
  else #Nonseasonal data
  {
    require(mgcv)
    tt <- 1:length(x)
    trend <- rep(NA,length(x))
    trend[!is.na(x)] <- fitted(gam(x ~ s(tt)))
    season <- NULL
    remainder <- x - trend
  }
  return(list(x=x,trend=trend,season=season,remainder=remainder,transform=transform,lambda=lambda))
}

# === Following function computes all measures

measures <- function(x)
{
  require(forecast)

  N <- length(x)
  freq <- findfrequency(x)
  fx <- c(frequency=(exp((freq-1)/50)-1)/(1+exp((freq-1)/50)))
  x <- ts(x,f=freq)

  # Decomposition
  decomp.x <- decomp(x)

  # Adjust data
  if(freq > 1)
      fits <- decomp.x$trend + decomp.x$season
  else # Nonseasonal data
      fits <- decomp.x$trend
  adj.x <- decomp.x$x - fits + mean(decomp.x$trend, na.rm=TRUE)

  # Backtransformation of adjusted data
  if(decomp.x$transform)
      tadj.x <- InvBoxCox(adj.x,decomp.x$lambda)
  else
      tadj.x <- adj.x

  # Trend and seasonal measures
  # avoids the divide by zero problem by testing if the variances are close to zero first
  v.adj <- var(adj.x, na.rm=TRUE)
  if(freq > 1)
  {
    detrend <- decomp.x$x - decomp.x$trend
    deseason <- decomp.x$x - decomp.x$season
    trend <- ifelse(var(deseason,na.rm=TRUE) < 1e-10, 0, 
      max(0,min(1,1-v.adj/var(deseason,na.rm=TRUE))))
    season <- ifelse(var(detrend,na.rm=TRUE) < 1e-10, 0,
      max(0,min(1,1-v.adj/var(detrend,na.rm=TRUE))))
  }
  else #Nonseasonal data
  {
    trend <- ifelse(var(decomp.x$x,na.rm=TRUE) < 1e-10, 0,
      max(0,min(1,1-v.adj/var(decomp.x$x,na.rm=TRUE))))
    season <- 0
  }

  m <- c(fx,trend,season)

  # Measures on original data
  xbar <- mean(x,na.rm=TRUE)
  s <- sd(x,na.rm=TRUE)
  
  # Serial correlation
  Q <- Box.test(x,lag=10)$statistic/(N*10)
  fQ <- f2(Q,7.53,0.103)

  # Nonlinearity
  p <- tseries::terasvirta.test(na.contiguous(x))$statistic
  fp <- f1(p,0.069,2.304)

  # Skewness
  sk <- abs(mean((x-xbar)^3,na.rm=TRUE)/s^3)
  fs <- f1(sk,1.510,5.993)

  # Kurtosis
  k <- mean((x-xbar)^4,na.rm=TRUE)/s^4
  fk <- f1(k,2.273,11567)

  # Hurst=d+0.5 where d is fractional difference.
  H <- fracdiff::fracdiff(na.contiguous(x),0,0)$d + 0.5

  # Lyapunov Exponent
  if(freq > N-10)
      stop("Insufficient data")
  Ly <- numeric(N-freq)
  for(i in 1:(N-freq))
  {
    idx <- order(abs(x[i] - x))
    idx <- idx[idx < (N-freq)]
    j <- idx[2]
    Ly[i] <- log(abs((x[i+freq] - x[j+freq])/(x[i]-x[j])))/freq
    if(is.na(Ly[i]) | Ly[i]==Inf | Ly[i]==-Inf)
      Ly[i] <- NA
  }
  Lyap <- mean(Ly,na.rm=TRUE)
  fLyap <- exp(Lyap)/(1+exp(Lyap))

  m <- c(m,fQ,fp,fs,fk,H,fLyap)
  
  # Measures on adjusted data
  xbar <- mean(tadj.x, na.rm=TRUE)
  s <- sd(tadj.x, na.rm=TRUE)

  # Serial
  Q <- Box.test(adj.x,lag=10)$statistic/(N*10)
  fQ <- f2(Q,7.53,0.103)

  # Nonlinearity
  p <- tseries::terasvirta.test(na.contiguous(adj.x))$statistic
  fp <- f1(p,0.069,2.304)

  # Skewness
  sk <- abs(mean((tadj.x-xbar)^3,na.rm=TRUE)/s^3)
  fs <- f1(sk,1.510,5.993)

  # Kurtosis
  k <- mean((tadj.x-xbar)^4,na.rm=TRUE)/s^4
  fk <- f1(k,2.273,11567)

  m <- c(m,fQ,fp,fs,fk)
  names(m) <- c("frequency", "trend","seasonal",
    "autocorrelation","non-linear","skewness","kurtosis","Hurst","Lyapunov",
    "dc autocorrelation","dc non-linear","dc skewness","dc kurtosis")

  return(m)
}

