#Clear environment
rm(list = ls())

#Load data
obs <- read.csv("./data/obs.csv")
attach(obs)

#Create 2x2 plot area
par(mfrow=c(2,2))

plot(Clay1,Clay2)
abline(0,1,lty=2) #Adds straight line, int = 0, grad = 1
title("default axes, subsoil vs. topsoil")

#Adds lines to show mean of each axis.
abline(h=mean(Clay2))
abline(v=mean(Clay1))

plot(Clay1,Clay2,xlim=c(0,100),ylim=c(0,100),pch=20)
abline(0,1,lty=2)
title("axes 0..100, subsoil vs. topsoil")
abline(h=mean(Clay2)); abline(v=mean(Clay1))

plot(Clay2,Clay1); abline(0,1,lty=2)
title("default axes, topsoil vs. subsoil")
abline(h=mean(Clay1)); abline(v=mean(Clay2))

plot(Clay2,Clay1,xlim=c(0,100),ylim=c(0,100),pch=20)
abline(0,1,lty=2)
title("axes 0..100, topsoil vs. subsoil")
abline(h=mean(Clay1)); abline(v=mean(Clay2))

par(mfrow=c(1,1))# reset to 1 plot per figure


#####

par(mfrow=c(2,2))
plot(Clay1, Clay2, xlim=c(0,80), ylim=c(0,80),
  pch=as.numeric(wrb1))

abline(0,1,lty=2)
abline(h=mean(Clay2)); abline(v=mean(Clay1))
legend(60, 20, legend=levels(wrb1), pch=1:nlevels(wrb1), bty="n")

plot(Clay1, Clay2, xlim=c(0,80), ylim=c(0,80), pch=20,
  col=as.numeric(wrb1))

legend(60, 20, legend=levels(wrb1), pch=20,
  col=1:nlevels(wrb1), bty="n")

abline(0, 1, lty=2)
abline(h=mean(Clay2)); abline(v=mean(Clay1))

plot(Clay1, Clay2, xlim=c(0,80), ylim=c(0,80),
  pch=as.numeric(wrb1), col=as.numeric(wrb1))

abline(0, 1, lty=2, col=5)
abline(h=mean(Clay2)); abline(v=mean(Clay1))

legend(60, 20, levels(wrb1), pch=1:nlevels(wrb1),
  col=1:nlevels(wrb1), bty="n")

par(mfrow=c(1,1))


#####


