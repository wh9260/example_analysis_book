#Clear environment
rm(list = ls())

#Load data
obs <- read.csv("./data/obs.csv")
attach(obs)

#Shows basic stats.
summary(Clay1); summary(Clay2); summary(Clay5)

#Basic histograms
stem(Clay1)
hist(Clay1)

#Makes a histogram. Breaks are defined between cells.
hist(Clay1, breaks=seq(0, 96, by=8), col="darkgray", border="black",
     main="Clay proportion in surface soil, weight %")

#Show data points on x axis, but not all as some are equal.
rug(Clay1)

#Create histo object, do not plot.
h <- hist(Clay1, breaks=seq(0, 96, by=8), plot=F)
str(h)

#Plot with mods
plot(h, col = heat.colors(length(h$mids))[length(h$count)-rank(h$count)+1],
     ylim = c(0, max(h$count)+5),
     main="Clay proportion in surface soil, weight %",
     sub="Counts shown above bar, actual values shown with rug plot")

rug(Clay1)
#Add text at x = mid points, y = count, then above (3)
text(h$mids, h$count, h$count, pos=3)
#Remove hist object
rm(h)

#Looking for unusual results, above 65%

obs[Clay1 > 65,]

#Does same thing:
(ix <- which(Clay1 > 65)); obs[ix, ]

#Creates a grid for four plots, 2x2.
par(mfrow = c(2,2))

#Create a box plot
boxplot(Clay1, notch=T, horizontal=T,
  main="Boxplot of Clay 0-10cm")

hist(Clay1, freq=F, breaks=seq(0,100,5),
  main="Probability density for Clay 0-10cm")

lines(density(Clay1),lwd=2)

lines(density(Clay1, adj=.5),lwd=1)

lines(density(Clay1, adj=2),lwd=1.5)

qqnorm(Clay1, main="QQ plot for Clay 0-10cm vs Normal distribution",
  ylab="Clay %, 0-10cm")

qqline(Clay1, col=4)

qqnorm(log(Clay1), main="QQ plot for Clay 0-10cm vs lognormal distribution",
  ylab="log(Clay %), 0-10cm")

qqline(log(Clay1), col=4)

par(mfrow=c(1,1))

#Point estimation; inference of the mean

t.test(Clay1, mu = 30, conf.level = 0.99)









