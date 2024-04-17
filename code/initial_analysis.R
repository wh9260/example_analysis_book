#Initial Analysis

#Load data from file
obs <- read.csv("./data/obs.csv")

#Changes ZONE to Factor type
obs$zone <- as.factor(obs$zone)
obs$wrb1 <- factor(obs$wrb1, labels=c("a", "c", "f"))

#Creates a list of ints as long as OBS
plot.id <- 1:dim(obs)[1]

#Creates a list of the observations without the data. ID inc.
t.obs <- cbind(plot.id, obs[, 1:6])

#Creates a list of the data, split from each obs. A normalised structure.
#One entry for each piece of data.
t.layers <- cbind(plot.id = rep(plot.id, 3),
  reshape(obs, direction="long",
  drop=c("e", "n", "elev", "zone", "wrb1", "LC"),
  varying=list(c("Clay1","Clay2","Clay5"),
  c("CEC1", "CEC2", "CEC5"), c("OC1", "OC2", "OC5")),
  times=c("1", "2", "5")))

#Renames some of the fields.
names(t.layers)[2:5] <- c("layer", "Clay", "CEC", "OC")
t.layers$layer <- as.factor(t.layers$layer)

#Save.
rm(plot.id)
save(t.obs, t.layers, file="t.RData")
