#Clear environment
rm(list = ls())

#Load data
obs <- read.csv("./data/obs.csv")
#attach(obs)
obs$wrb1 <- factor(obs$wrb1, labels=c("a", "c", "f"))

#Create 2x2 plot area
par(mfrow=c(2,2))

plot(obs$Clay1,obs$Clay2)
abline(0,1,lty=2) #Adds straight line, int = 0, grad = 1
title("default axes, subsoil vs. topsoil")

#Adds lines to show mean of each axis.
abline(h=mean(obs$Clay2))
abline(v=mean(obs$Clay1))

plot(obs$Clay1,obs$Clay2,xlim=c(0,100),ylim=c(0,100),pch=20)
abline(0,1,lty=2)
title("axes 0..100, subsoil vs. topsoil")
abline(h=mean(obs$Clay2)); abline(v=mean(obs$Clay1))

plot(obs$Clay2,obs$Clay1); abline(0,1,lty=2)
title("default axes, topsoil vs. subsoil")
abline(h=mean(obs$Clay1)); abline(v=mean(obs$Clay2))

plot(obs$Clay2,obs$Clay1,xlim=c(0,100),ylim=c(0,100),pch=20)
abline(0,1,lty=2)
title("axes 0..100, topsoil vs. subsoil")
abline(h=mean(obs$Clay1)); abline(v=mean(obs$Clay2))

par(mfrow=c(1,1))# reset to 1 plot per figure

#####

par(mfrow=c(2,2))
plot(obs$Clay1, obs$Clay2, xlim=c(0,80), ylim=c(0,80),
  pch=as.numeric(obs$wrb1))

abline(0,1,lty=2)
abline(h=mean(obs$Clay2)); abline(v=mean(obs$Clay1))
legend(60, 20, legend=levels(obs$wrb1), pch=1:nlevels(obs$wrb1), bty="n")

plot(obs$Clay1, obs$Clay2, xlim=c(0,80), ylim=c(0,80), pch=20,
  col=as.numeric(obs$wrb1))

legend(60, 20, legend=levels(obs$wrb1), pch=20,
  col=1:nlevels(obs$wrb1), bty="n")

abline(0, 1, lty=2)
abline(h=mean(obs$Clay2)); abline(v=mean(obs$Clay1))

plot(obs$Clay1, obs$Clay2, xlim=c(0,80), ylim=c(0,80),
  pch=as.numeric(obs$wrb1), col=as.numeric(obs$wrb1))

abline(0, 1, lty=2, col=5)
abline(h=mean(obs$Clay2)); abline(v=mean(obs$Clay1))

legend(60, 20, levels(obs$wrb1), pch=1:nlevels(obs$wrb1),
  col=1:nlevels(obs$wrb1), bty="n")

par(mfrow=c(1,1))

#####

plot(obs$Clay2 ~ obs$Clay1, pch=20,col=as.numeric(obs$wrb1))
legend(60, 20, legend=levels(obs$wrb1), pch=20, col=1:nlevels(obs$wrb1), bty="n")
for (f in c(0.1,0.5, 2/3, 1)) {lines(lowess(obs$Clay1, obs$Clay2, f=f), lwd=2, col="blue")}
abline(lm(obs$Clay2 ~ obs$Clay1), lty=2))












