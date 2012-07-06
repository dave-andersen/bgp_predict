data = read.table("bgp-daily.txt", header = T)
attach(data)
data$day = data$day - 47341
fitlin <- lm(entries ~ day)
fitlin
log.data = data
log.data$entries = log(log.data$entries)
fitexp <- lm(log.data$entries ~ day, data=log.data)
fitexp
postscript("bgpfit.ps", paper='letter')
plot(data)
lines(data$day, fitted(fitlin))
lines(data$day, exp(fitted(fitexp)))
dev.off()
# Compute the sum of squares error
sselin <- sum(resid(fitlin)^2)
sselin
sseexp <- sum((exp(predict(fitexp, log.data)) - entries)^2)
sseexp
# Better way to compute the exponential fit using nls:
fitexp2 <- nls(entries ~ exp(alpha + beta*day), data=data, start=list(alpha=8, beta=0.0005))
fitexp2
