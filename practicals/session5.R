load("../datasets/laborforce.RData")

laborforce.ts <- ts(laborforce$laborforce, start = c(1948, 1), frequency = 12)
unemploy.ts <- ts(laborforce$unemployment, start = c(1948, 1), frequency = 12)


tsdisplay(laborforce.ts)
tsdisplay(unemploy.ts)


spectrum(laborforce.ts)
# smoothing using span
spectrum(laborforce.ts, span = 10) # try to compare the height of peaks

spectrum(unemploy.ts, span = 10) 

# one-time regular finite differencing to try to get rid of at least some part of the trend
laborforce.d1 <- diff(laborforce.ts)

tsdisplay(laborforce.ts) # just to recall what the original series looks like
tsdisplay(laborforce.d1)

spectrum(laborforce.ts, span = 10)
spectrum(laborforce.d1, span = 10) # you can see in the lower frequencies the contribution is decreased

# one-time seasonal differencing
laborforce.ds1 <- diff(laborforce.ts, lag = 12, differences = 1) # though default for differences is also 1
tsdisplay(laborforce.ds1) 

# two-times
laborforce.ds2 <- diff(laborforce.ts, lag = 12, differences = 2)
tsdisplay(laborforce.ds2)

# apply one-time differencing and seasonal differencing to get rid of both trend and seasonality
# and IMP: the order does not matter
laborforce.d1.ds1 <- diff(laborforce.ds1)
spectrum(laborforce.d1.ds1, span = 10)
tsdisplay(laborforce.d1.ds1)


# in a lot of cases it's not the case that either additive or multiplicative should be used. Maybe a mix of both has to be used.

# additive decomposition
laborforce.deco.add <- decompose(laborforce.ts, type = "additive")
plot(laborforce.deco.add)

laborforce.deco.mul <- decompose(laborforce.ts, type = "multiplicative")
plot(laborforce.deco.mul)


