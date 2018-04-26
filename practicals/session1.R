# mydata <- read.csv(file.choose())

# install.packages("fpp")

load("../datasets/souvenir.RData")


souvenir.ts <- ts(souvenir, start = c(1987,1), frequency = 12)

tsdisplay(souvenir.ts)
monthplot(souvenir.ts)
seasonplot(souvenir.ts)
