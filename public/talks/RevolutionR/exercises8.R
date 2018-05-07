library(fpp)

# Question 1

plot(usnetelec)
tsdisplay(diff(usnetelec)) # Looks stationary

plot(usgdp)
tsdisplay(diff(usgdp)) # Looks stationary

plot(mcopper)
plot(log(mcopper))
tsdisplay(diff(log(mcopper))) # Looks stationary

plot(enplanements)
plot(log(enplanements))
tsdisplay(diff(log(enplanements),12))
tsdisplay(diff(diff(log(enplanements),12))) # Looks stationary

plot(visitors)
plot(log(visitors))
bc <- BoxCox.lambda(visitors)
plot(BoxCox(visitors, bc))
tsdisplay(diff(BoxCox(visitors, bc),12))
tsdisplay(diff(diff(BoxCox(visitors, bc),12))) # Looks stationary


