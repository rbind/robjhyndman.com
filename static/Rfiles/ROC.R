######################################################
### FUNCTIONS FOR KERNEL ESTIMATION OF ROC CURVES  ###
### Last updated by RJH. 12 May 2011               ###
### Version of functions for public release        ###
######################################################

#################################
### ROC CALCULATION FROM CDFS ###
#################################

# Return ROC function based on Fx and Fy inputs
# Computed at x
ROC <- function(x,Fx,y,Fy,nx=200)
{
    xx <- seq(min(x,y),max(x,y),l=nx)
    newFx <- approx(x,Fx,xout=xx,yleft=0,yright=1)
    newFy <- approx(y,Fy,xout=xx,yleft=0,yright=1)
    return(list(x=c(0,rev(1-newFx$y),1),y=c(0,rev(1-newFy$y),1)))
}

##################################################
### ROC ESTIMATION using empirical cdf         ###
##################################################

# Step function estimate of ROC curve based on empirical cdfs

ROC.rawest <- function(x,y)
{
    tmp <- reduce(x,y)
    tmpx <- ecdf(tmp$x)
    tmpy <- ecdf(tmp$y)

    xandy <- sort(unique(c(tmp$x,tmp$y)))
    xx <- knots(tmpx)
    xy <- tmpx(xx)
    yx <- knots(tmpy)
    yy <- tmpy(yx)
    Fxx <- approx(xx,xy,xandy,yleft=0,yright=1,method="constant",f=1)$y
    Fyy <- approx(yx,yy,xandy,yleft=0,yright=1,method="constant",f=1)$y
    return(list(x=c(0,rev(1-Fxx),1),y=c(0,rev(1-Fyy),1)))
}

###############################################
### ROC ESTIMATION using kernel cdf         ###
###############################################

# Kernel estimate of ROC curve with bandwidths hx and hy
# If bandwidths missing, uses method from ROC.h function
# See bandwidths.R for details.

ROC.est <- function(x,y,hx,hy,conf=95,intervals=TRUE,...)
{
    if(missing(hx) | missing(hy))
    {
        hopt <- ROC.h(x,y,...)
        hx <- hopt$hx
        hy <- hopt$hy
    }
    lo <- min(min(x)-5*hx,min(y)-5*hy)
    hi <- max(max(x)+5*hx,max(y)+5*hy)
    xgrid <- seq(lo,hi,l=200)
    Fx <- cdf.est(x,hx,xgrid)
    Fy <- cdf.est(y,hy,xgrid)

    p <- c(0,rev(1-Fx$y),1)
    Rhat <- c(0,rev(1-Fy$y),1)

    if(intervals)
    {
        tmp <- ASMCONF.est(x,y,alpha=1-conf/100)
        sig2 <- approx(tmp$p,tmp$sigma2,xout=p)$y
        z <- abs(qnorm(0.5-0.005*conf))
        lo <- pmax(Rhat - z*sig2, 0)
        hi <- pmin(Rhat + z*sig2, 1)
        return(list(x=p,y=Rhat,hx=hx,hy=hy,lo=lo, hi=hi, s2=sig2))
    }
    else
        return(list(x=p,y=Rhat,hx=hx,hy=hy))
}


###############################################
### Utility functions for kernel estimation ###
###############################################

# Evaluate K on grid
make.K <- function(x,h,xgrid,ngrid=200,lo,hi)
{
    # Construct grid if necessary
    if(missing(xgrid))
    {
        if(missing(lo))
            lo <- min(x)-3*h
        if(missing(hi))
            hi <- max(x)+3*h
        xgrid <- seq(lo,hi,l=ngrid)
    }
    # Setup necessary variables
    n <- length(x)
    ngrid <- length(xgrid)
    Kmat1 <- Kmat2 <- Kmat3 <- matrix(NA,ngrid,n)
    for(i in 1:ngrid)
    {
        xx <- (xgrid[i]-x)/h
        Kmat1[i,] <- pnorm(xx)
        Kmat2[i,] <- dnorm(xx)
        Kmat3[i,] <- -xx*Kmat2[i,]
    }
    # Return results
    return(list(x=xgrid,K1=Kmat1,K2=Kmat2,K3=Kmat3))
}

cdf.est <- function(x,h=h.lloyd2(x),xgrid)
{
    if(missing(xgrid))
        xgrid <- seq(min(x)-3*h,max(x)+3*h,l=200)
    n <- length(xgrid)
    Fx <- cumsum(density(x,bw=h,from=xgrid[1],to=xgrid[n],n=n)$y)
    return(list(x=xgrid,y=Fx/Fx[n]))
}

pdf.est <- function(x,h=bw.SJ(x),xgrid)
{
    if(missing(xgrid))
        xgrid <- seq(min(x)-3*h,max(x)+3*h,l=200)
    n <- length(xgrid)
    return(list(x=xgrid,y=density(x,bw=h,from=xgrid[1],to=xgrid[n],n=n)$y))
}

#  FUNCTION reduces (x,y) values by removing repeated x values.
#  Points with smaller y-value are retained.
#  REQUIRED ARUMENTS:",
#      x - vector of x-coordinates of function
#      y - vector of y -coordinates of function

reduce <- function (x = stop("Argument is missing"), y = stop("Argument is missing"))
{
    Y <- y[order(x)]
    X <- sort(x)
    tmp <- match(unique(X), X)
    X <- X[tmp]
    Y <- Y[tmp]
    return(list(x=X,y=Y))
}


#################################
### BANDWIDTH SELECTION       ###
### FOR KERNEL ROC ESTIMATION ###
#################################

# Main bandwidth selection function
# Method:
#     norm: assumes normal densities
#     lloyd: uses Lloyd's plug-in estimator for cdfs
#     plugin: uses plug-in method of Hall and Hyndman
#     mix: uses recommended method of Hall and Hyndman

ROC.h <- function(x,y,method="mix",...)
{
    if(method=="norm")
        return(h.norm(x,y))
    else if(method=="lloyd")
        return(list(hx=h.lloyd(x),hy=h.lloyd(y)))
    else if(method=="plugin")
        return(plugin(x,y,...))
    else if(method=="mix")
    {
        hn <- h.norm(x,y)
        hp <- plugin(x,y,...)
        return(list(hx=min(hn$hx,hp$hx),hy=min(hn$hy,hp$hy)))
    }
    else
        stop("Unknown method")
}

## NORMAL REFERENCE BANDWIDTH SELECTION

# Compute optimal h for each variable assuming normal densities
# with unknown means and variances
h.norm <- function(x,y)
{
    mx <- mean(x)
    my <- mean(y)
    sx <- sqrt(var(x))
    sy <- sqrt(var(y))
    nx <- length(x)
    ny <- length(y)
    h.norm2(mx,sx,my,sy,nx,ny)
}

# Compute optimal h for each variable assuming normal densities
# with known means and variances
h.norm2 <- function(mx,sx,my,sy,nx,ny)
{
    hx <- hx.norm(mx,sx,my,sy,nx)
    hy <- hx.norm(my,sy,mx,sx,ny)
    return(list(hx=hx,hy=hy))
}

# Optimal h for x variable assuming normal densities
# with known means and variances
hx.norm <- function(mx,sx,my,sy,n)
{
    kappa <- 0.5641896
    #kappa2 <- 1
    sum1 <- sx^2+sy^2
    sum2 <- sum1+sx^2
    sum3 <- (mx-my)^2
    f1 <- 4*sqrt(pi)*kappa * sx^3*sum1^2.5 / (sqrt(sum2)*(sy^4+sy^2*sx^2 + 2*sx^2*sum3))
    c3 <-f1*exp(sum3*sx^2/(sum1*sum2))
    return((c3/n)^(1/3))
}


## LLOYD PLUG-IN RULE FOR kernel estimate of CDF

h.lloyd <- function(x)
{
    n <- length(x)
    if(n < 2)
        stop("Insufficient data")
    s <- IQR(x) / 1.349
    mu <- mean(x)
    psi6 <- -0.5289/s^7
    h4 <- (-6/psi6/n)^(1/7)
    xx <- seq(min(x)-s,max(x)+s,l=512)
    pdf4deriv <- denest(x,deriv=4,h=h4,xgrid=xx)
    psi4 <- mean(approx(xx,pdf4deriv$y,xout=x)$y,na.rm=T)
    h2 <- (0.7979/psi4/n)^(1/5)
    pdf2deriv <- denest(x,deriv=2,h=h2,xgrid=xx)
    psi2 <- mean(approx(xx,pdf2deriv$y,xout=x)$y,na.rm=T)
    h <- (-0.5641896/psi2/n)^(1/3)
    if(h < 0)
        return(h.lloyd2(x))
    else
        return(h)
}

# Normal reference rule for kernel estimate of CDF
h.lloyd2 <- function(x)
{
    n <- length(x)
    s <- IQR(x) / 1.349
    return(1.583*s/n^(1/3))
}

# Estimate density and derivatives
denest <- function(x,deriv=0,h,xgrid,ngrid=200,lo,hi)
{
    # Construct grid if necessary
    if(missing(xgrid))
    {
        if(missing(lo))
            lo <- min(x)-3*h
        if(missing(hi))
            hi <- max(x)+3*h
        xgrid <- seq(lo,hi,l=ngrid)
    }

    # Setup necessary variables
    n <- length(x)
    xmat <- sweep(matrix(xgrid, nrow=length(xgrid), ncol=n), 2, x)/h
    if(deriv==-1)
        return(cdf.est(x,h,xgrid))
    else if(deriv==0)
        return(pdf.est(x,h,xgrid))
    else if(deriv==1)
        Kmat <- -xmat*dnorm(xmat)
    else if(deriv==2)
        Kmat <- dnorm(xmat)*(xmat^2-1)
    else if(deriv==3)
        Kmat <- dnorm(xmat)*xmat*(3-xmat^2)
    else if(deriv==4)
        Kmat <- dnorm(xmat)*(3-6*xmat^2+xmat^4)
    else
        stop("Not implemented")
    # Return results
    return(list(x=xgrid,y=apply(Kmat,1,sum)/(n*h^(deriv+1))))
}


## Utility functions for computing numerical derivatives
# Assume x is sorted in ascending order

# 2nd derivatives
deriv2 <- function(y,x)
{
    n <- length(x)
    del <- x[2]-x[1]
    c(NA,y[3:n]-2*y[2:(n-1)]+y[1:(n-2)],NA)/(del^2)
}

# 4th derivatives
deriv4 <- function(y,x)
{
    deriv2(deriv2(y,x),x)
}

### PLUG IN METHOD OF HALL AND HYNDMAN

# PLUG IN SELECTOR
pluginbands <- function(x,y)
{
    m <- length(x)
    n <- length(y)
    mx <- mean(x)
    my <- mean(y)
    sx <- sqrt(var(x))
    sy <- sqrt(var(y))
    rmin <- min(mx-5*sx,my-5*sy)
    rmax <- max(mx+5*sx,my+5*sy)

    R <- n/m
    lambda1 <- 0.5/sqrt(pi)
    lambda2 <- 0.5/sqrt(2*pi)
    kappa2 <- 1
    I1 <- abs(integrate(intf9,rmin,rmax,mx=my,sx=sy,my=mx,sy=sx)$value)
    I2 <- abs(integrate(intf3,rmin,rmax,mx=my,sx=sy,my=mx,sy=sx)$value)
    I3 <- abs(integrate(intf2,rmin,rmax,mx=my,sx=sy,my=mx,sy=sx)$value)
    H <- n^(-0.4)*((2*R*lambda1*I1 + lambda2*I2)/(2*kappa2^2*I3^2))^(0.2)

    I4 <- abs(integrate(intf5,rmin,rmax,mx=mx,sx=sx,my=my,sy=sy)$value)
    I5 <- abs(integrate(intf6,rmin,rmax,mx=mx,sx=sx,my=my,sy=sy)$value)
    J <- 64*abs(integrate(intf10,rmin,rmax,mx=mx,sx=sx,my=my,sy=sy)$value)
    rho <- h.lloyd(y)/h.lloyd(x)
    H2 <- (3*J/(m*n*sqrt(2*pi)*(1+2*rho^2)^1.5*(2*rho^2*I4+I5)^2))^(1/7)
    H1 <- rho*H2

    return(list(H=H,H1=H1,H2=H2))
}

plugin <- function(x,y)
{
    bandsx <- pluginbands(x,y)
    bandsy <- pluginbands(y,x)
    cfg <- calc.cfg(bandsx$H,bandsx$H1,bandsx$H2,x,y,diag=1)
    cgf <- calc.cfg(bandsy$H,bandsy$H1,bandsy$H2,y,x,diag=1)
    m <- length(x)
    n <- length(y)    
    h1 <- cfg/(m^(1/3))
    h2 <- cgf/(n^(1/3))
    return(list(hx=h1,hy=h2))
}

calc.cfg <- function(H,H1,H2,x,y,diag=1)
{
    tmp <- crossval.int(H,H1,H2,x,y,diag=diag)
    cfg <- (0.5641896 *  tmp$int3 / abs(tmp$int2))^(1/3)
    return(cfg)
}



# Compute estimates for Delta function
crossval.int <- function(H,H1,H2,x,y,diag=1)
{
    m <- length(x)
    n <- length(y)
    x.K <- make.K(x,H1,y)
    y.K <- make.K(y,H,x)

    # Make f2 and g2, etc.
    f12 <- f12 <- glo <- numeric(n)
    g2 <- numeric(m)
    for(i in 1:m)
    {
        tmp <- matrix(y.K$K2[i,],nrow=n,ncol=1) %*% matrix(y.K$K2[i,],nrow=1,ncol=n)
        g2[i] <- 2*sum(tmp[lower.tri(tmp,diag=F)]) / (n*(n-1)*H^2)
    }
    for(i in 1:n)
    {
        tmp <- matrix(x.K$K3[i,],nrow=m,ncol=1) %*% matrix(x.K$K3[i,],nrow=1,ncol=m)
        if(diag==1)
            f12[i] <- (2*sum(tmp[lower.tri(tmp,diag=T)]) - sum(diag(tmp))) / (m*m*H1^4)
        else if(diag==0)
            f12[i] <- 2*sum(tmp[lower.tri(tmp,diag=F)]) / (m*(m-1)*H1^4)
        else
            f12[i] <- (2*sum(tmp[lower.tri(tmp,diag=T)]) - 1.5*sum(diag(tmp))) / (m*(m-0.5)*H1^4)
        glo[i] <- (sum(dnorm((y[i]-y)/H2)) - dnorm(0))/((n-1)*H2)
    }
    return(list(int1=mean(f12),int2=mean(f12*glo),int3=mean(g2),int4=mean(glo)))
}

## FUNCTIONS TO COMPUTE INTEGRALS CONTAINING NORMAL DENSITIES

fgderiv <- function(x,mx,sx,my,sy)
{
    xx <- (x-mx)/sx
    yy <- (x-my)/sy
    f <- dnorm(xx)/sx
    g <- dnorm(yy)/sy
    fdash <- -xx*f/sx
    gdash <- -yy*g/sy
    fdash2 <- (xx^2-1)*f/sx^2
    gdash2 <- (yy^2-1)*g/sy^2
    fdash3 <- xx*(3-xx^2)*f/sx^3
    gdash3 <- yy*(3-yy^2)*g/sy^3
    return(list(f=f,g=g,fdash=fdash,gdash=gdash,fdash2=fdash2,gdash2=gdash2,fdash3=fdash3,gdash3=gdash3))
}

## fg^2 assuming normal densities
fg2 <- function(x,mx,sx,my,sy)
{
    N <- fgderiv(x,mx,sx,my,sy)
    return(N$f*N$g^2)
}

## (f'g)^2 assuming normal densities
f1g2 <- function(x,mx,sx,my,sy)
{
    N <- fgderiv(x,mx,sx,my,sy)
    return((N$fdash*N$g)^2)
}

## f.f''.g
intf2 <- function(x,mx,sx,my,sy)
{
    N <- fgderiv(x,mx,sx,my,sy)
    return(N$f*N$fdash2*N$g)
}

## (fg)^2
intf3 <- function(x,mx,sx,my,sy)
{
    N <- fgderiv(x,mx,sx,my,sy)
    return((N$f*N$g)^2)
}


## g^2.f'.f'''
intf5 <- function(x,mx,sx,my,sy)
{
    N <- fgderiv(x,mx,sx,my,sy)
    return(N$fdash*N$fdash3*N$g^2)
}

## g g'' (f')^2
intf6 <- function(x,mx,sx,my,sy)
{
    N <- fgderiv(x,mx,sx,my,sy)
    return(N$fdash^2*N$gdash2*N$g)
}

## f^3.g
intf9 <- function(x,mx,sx,my,sy)
{
    N <- fgderiv(x,mx,sx,my,sy)
    return(N$f^3*N$g)
}

## g^3.f.(f')^2
intf10 <- function(x,mx,sx,my,sy)
{
    N <- fgderiv(x,mx,sx,my,sy)
    return(N$fdash^2*N$f*N$g^3)
}

## COMPUTE TRUE ROC FUNCTIONS


# Assuming normal densities
ROC.norm <- function(mx,sx,my,sy,nx=200)
{
    x <- seq(mx-5*sx,mx+5*sx,l=nx)
    y <- seq(my-5*sy,my+5*sy,l=nx)
    ROC(x,pnorm(x,mx,sx),y,pnorm(y,my,sy),nx=nx)
}

ROC.beta <- function(ax,bx,ay,by,nx=200)
{
    x <- seq(0,1,l=nx)
    ROC(x,pbeta(x,ax,bx),x,pbeta(x,ay,by),nx=nx)
}

ROC.t <- function(vx,vy,nx=200)
{
    x <- seq(-5,5,l=nx)
    ROC(x,pt(x,vx),x,pt(x,vy),nx=nx)
}

ROC.pareto <- function(cx,cy,ax,ay,nx=200)
{
    x <- seq(-5,5,l=nx)
    ROC(x,ppareto(x,cx,ax),x,ppareto(x,cy,ay),nx=nx)
}

ROC.gamma <- function(sx,sy,nx=200)
{
    x <- seq(0,10,l=nx)
    ROC(x,pgamma(x,sx),x,pgamma(x,sy),nx=nx)
}

ROC.t.mix <- function(mx1,mx2,vx1,vx2,my1,my2,vy1,vy2,nx=200,px1=0.5,px2=0.5,py1=0.5,py2=0.5)
{
    sump <- px1+px2
    px1 <- px1/sump
    px2 <- px2/sump
    sump <- py1+py2
    py1 <- py1/sump
    py2 <- py2/sump
    x <- seq(min(mx1,mx2)-9,max(mx1,mx2)+9,l=nx)
    y <- seq(min(my1,my2)-9,max(my1,my2)+9,l=nx)
    Fx <- px1*pt(x-mx1,vx1) + px2*pt(x-mx2,vx2)
    Fy <- py1*pt(y-my1,vy1) + py2*pt(y-my2,vy2)
    ROC(x,Fx,y,Fy,nx=nx)
}

# Assuming equally weighted normal mixtures
ROC.norm.mix <- function(mx1,mx2,sx1,sx2,my1,my2,sy1,sy2,nx=200,px1=0.5,px2=0.5,py1=0.5,py2=0.5)
{
    sump <- px1+px2
    px1 <- px1/sump
    px2 <- px2/sump
    sump <- py1+py2
    py1 <- py1/sump
    py2 <- py2/sump
    x <- seq(min(mx1,mx2)-5*max(sx1,sx2),max(mx1,mx2)+5*max(sx1,sx2),l=nx)
    y <- seq(min(my1,my2)-5*max(sy1,sy2),max(my1,my2)+5*max(sy1,sy2),l=nx)
    Fx <- px1*pnorm(x,mx1,sx1) + px2*pnorm(x,mx2,sx2)
    Fy <- py1*pnorm(y,my1,sy1) + py2*pnorm(y,my2,sy2)
    ROC(x,Fx,y,Fy,nx=nx)
}

## CALCULATION OF ASYMPTOTIC CONFIDENCE BANDS
## as per Hall, Hyndman and Fan (2003b)

ASMCONF.est <- function(x,y,alpha=0.05,ngrid=512,...)
{
    m <- length(x)
    n <- length(y)

    # Get h1 and h2
    h1 <- h.lloyd(x)/2
    h2 <- h.lloyd(y)/2

    # Get H1 and H2
    H1 <- (4/7/m)^{1/9}*sd(x)
    H2 <- (4/7/n)^{1/9}*sd(y)

    # Get Hf and Hg
    Hf <- bw.SJ(x, method="dpi")
    Hg <- bw.SJ(y, method="dpi")

    # Get HF and HG
    HF <- h.lloyd(x)
    HG <- h.lloyd(y)

    # Get hf and hg
    lo <- min(min(x)-5*Hf,min(y)-5*Hg)
    hi <- max(max(x)+5*Hf,max(y)+5*Hg)
    xx <- seq(lo,hi,l=ngrid)
    f <- pdf.est(x,Hf,xx)$y
    g <- pdf.est(y,Hg,xx)$y
    F <- cdf.est(x,HF,xx)$y
    G <- cdf.est(y,HG,xx)$y
    f2 <- denest(x,2,H1,xgrid=xx)$y
    g2 <- denest(y,2,H2,xgrid=xx)$y
    tt <- seq(0.001,0.999,l=200)
    Finv <- approx(unique(F),xx[!duplicated(F)],xout=1-tt)$y
    Ginv <- approx(unique(G),xx[!duplicated(G)],xout=1-tt)$y
    kappa <- 0.5641896
    z <- abs(qnorm(0.5*alpha))
    gFinv <- approx(xx,g,xout=Finv)$y
    fFinv <- approx(xx,f,xout=Finv)$y
    GFinv <- approx(xx,G,xout=Finv)$y
    f2Finv <- approx(xx,f2,xout=Finv)$y
    g2Finv <- approx(xx,g2,xout=Finv)$y
    tmp <- (n/m)*(gFinv/fFinv)^2*tt*(1-tt)
    a <- tmp/(GFinv*(1-GFinv)+tmp)
    qf <- kappa*(3-a-a*z^2)+2/sqrt(2*pi)*(a+a*z^2-1)
    qg <- kappa*(a-1-a*z^2)
    temp1 <- sum(qf[!is.na(f2Finv)])/sum(f2Finv,na.rm=TRUE)
    temp2 <- sum(qg[!is.na(f2Finv)])/sum(g2Finv,na.rm=TRUE)
    hf <- ifelse(temp1<0, 2^{-1/3}, 1) *(abs(temp1))^{1/3}*m^{-1/3}
    hg <- ifelse(temp2<0, 2^{-1/3}, 1) *(abs(temp2))^{1/3}*n^{-1/3}

    # Get ftilde and gtilde
    ft <- pdf.est(x,hf,xx)$y
    gt <- pdf.est(y,hg,xx)$y

    # Get Fhat and Ghat
    Fhat <- cdf.est(x,h1,xx)$y
    Ghat <- cdf.est(y,h2,xx)$y

    # Compute sigma^2
    Finv <- approx(unique(Fhat),xx[!duplicated(Fhat)],xout=1-tt)$y
    GFinv <- approx(xx,Ghat,xout=Finv)$y
    gFinv <- approx(xx,gt,xout=Finv)$y
    fFinv <- approx(xx,ft,xout=Finv)$y
    sig2 <- sqrt(1/n*GFinv*(1-GFinv) + 1/m*tt*(1-tt)*(gFinv/fFinv)^2)

    # Compute upper and lower bounds
    lo <- pmax(1-GFinv - z * sig2, 0)
    hi <- pmax(1-GFinv + z * sig2, 0)

    return(list(p=tt,Rp=1-GFinv, sigma2=sig2, lower=lo, upper=hi))
}