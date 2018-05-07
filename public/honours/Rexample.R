library(forecast)
library(ggplot2)

autoplot(USAccDeaths)

fit <- auto.arima(USAccDeaths)
autoplot(forecast(fit))


# Linear model
library(GGally)
ggpairs(LifeCycleSavings) +
      ggtitle("LifeCycleSavings data")
fm1 <- lm(sr ~ pop15 + pop75 + dpi + ddpi,
          data = LifeCycleSavings)
summary(fm1)


library(demography)
plot(fr.mort, main="French death rates: 1816-2006")



# 3-d perspectives
x <- seq(-10, 10, length= 30)
y <- x
f <- function(x, y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r }
z <- outer(x, y, f)
z[is.na(z)] <- 1

persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue",
      ltheta = 120, shade = 0.75, ticktype = "detailed",
      xlab = "X", ylab = "Y", zlab = "Sinc( r )"
)


# Volcano
z <- 2 * volcano        # Exaggerate the relief
x <- 10 * (1:nrow(z))   # 10 meter spacing (S to N)
y <- 10 * (1:ncol(z))   # 10 meter spacing (E to W)
par(bg = "slategray")
persp(x, y, z, theta = 135, phi = 30, col = "green3", scale = FALSE,
      ltheta = -120, shade = 0.75, border = NA, box = FALSE)



# 3D Scatterplot
attach(mtcars)
library(rgl)
plot3d(wt, disp, mpg, col="red", size=3)


require(car)

scatter3d(prestige ~ income + education, data=Duncan, surface=FALSE)

scatter3d(prestige ~ income + education, data=Duncan)

scatter3d(prestige ~ income + education | type, data=Duncan)

scatter3d(prestige ~ income + education | type, surface=FALSE,
            ellipsoid=TRUE,  data=Duncan)

scatter3d(prestige ~ income + education, fit=c("linear", "additive"),
            data=Prestige)




# Show Econometrics, Empirical Finance, Time series task views

# Cross-validated
