murphydiagram <- function(y, f1, f2=NULL, xaxis=c("theta","time"),
                          type=c("scores","diff"),
                          cols=c("blue","red"), ...)
{
  type <- match.arg(type)
  xaxis <- match.arg(xaxis)

  n <- length(y)
  if(length(f1) != n)
    stop("Forecasts should be of same length as data")

  if(type=="diff" & is.null(f2))
    stop("Two forecasts are required for difference graphs")

  tmp <- range(y, f1, f2, na.rm=TRUE)
  tmp <- c(tmp[1]-0.2*(tmp[2]-tmp[1]), tmp[2]+0.2*(tmp[2]-tmp[1]))
  theta <- seq(tmp[1], tmp[2], l=501)
  s1 <- s2 <- matrix(0,nrow=501,ncol=n)*NA

  max1 <- pmax(f1,y)
  max2 <- pmax(f2,y)
  min1 <- pmin(f1,y)
  min2 <- pmin(f2,y)

  for(j in 1:n)
  {
    s1[,j] <- abs(y[j]-theta) * (max1[j] > theta) * (min1[j] <= theta)
    s2[,j] <- abs(y[j]-theta) * (max2[j] > theta) * (min2[j] <= theta)
  }

  if(xaxis=="time")
  {
    s1ave <- colMeans(s1, na.rm=TRUE)
    s2ave <- colMeans(s2, na.rm=TRUE)
    tspx <- !is.null(tsp(y))
    if(tspx)
    {
      s1ave <- ts(s1ave)
      s2ave <- ts(s2ave)
      tsp(s1ave) <- tsp(s2ave) <- tsp(y)
    }
    if(type=="diff")
    {
      sdiff <- s1ave - s2ave
      meansdiff <- mean(sdiff,na.rm=TRUE)
      se <- sd(sdiff, na.rm=TRUE)/sqrt(sum(!is.na(sdiff)))
      upper <- meansdiff + 1.96*se
      lower <- meansdiff - 1.96*se
      plot(sdiff, type="n", ylab="Difference in scores", ...)
      xidx <- time(sdiff)
      polygon(c(-1e20,-1e20,1e20,1e20),
              c(lower,upper,upper,lower),col=gray(0.8),border=FALSE)
      if(tspx)
        lines(sdiff,col=gray(.4))
      else
        points(sdiff,  pch=19, col=gray(.4))
      abline(h=0,lty=3)
      abline(h=meansdiff)
    }
    else
    {
      plot(s1ave, col=cols[1], ylab="Empirical score", pch=19,...)
      if(tspx)
        lines(s2ave, col=cols[2])
      else
        points(s2ave, col=cols[2], pch=19)
      abline(h=mean(s1ave,na.rm=TRUE),col=cols[1])
      abline(h=mean(s2ave,na.rm=TRUE),col=cols[2])
    }
  }
  else if(xaxis=="theta")
  {
    s1ave <- rowMeans(s1, na.rm=TRUE)
    s2ave <- rowMeans(s2, na.rm=TRUE)
    if(type=='diff')
    {
      se <- apply(s1-s2,1,sd,na.rm=TRUE)/sqrt(n)
      diff <- rowMeans(s1-s2, na.rm=TRUE)
      upper <- diff + 1.96*se
      lower <- diff - 1.96*se
      plot(theta, diff, type="n",
           ylab="Difference in scores", xlab=expression(theta),
           ylim=range(lower,upper,na.rm=TRUE), ...)
      polygon(c(theta,rev(theta)),c(lower,rev(upper)),col=gray(0.8),border=FALSE)
      lines(theta,diff)
      abline(0,0,lty=3)
    }
    else
    {
      plot(theta, s1ave, col=cols[1],
         type="l", ylab="Empirical Score", xlab=expression(theta),
         ylim=range(s1ave,s2ave,na.rm=TRUE), ...)
      lines(theta, s2ave, col=cols[2])
      abline(0,0,lty=3)
    }
  }

  return(invisible(list(s1=s1,s2=s2)))
}

