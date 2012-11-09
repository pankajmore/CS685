#!/usr/bin/Rscript

library('cluster')

asw <- numeric(20) 
x <- read.csv("clusters_input.csv")
dissE <- daisy(x)

for (k in 2:20) {
  asw[k] <- summary(silhouette(kmeans(x,k)$cl, dissE)) $ avg.width
  cat("silhoutte coefficient for ",k," clusters : ", asw[k], "\n")
  #asw[k] <- clara(x, k)$silinfo$avg.width 
} 
k.best <- which.max(asw)
cat("silhouette-optimal number of clusters:", k.best, "\n")

plot(1:20, asw, type= "h", main = "kmeans clustering assessment",xlab= "k (# clusters)", ylab = "average silhouette width") 
axis(1, k.best, paste("best",k.best,sep="\n"), col = "red", col.axis = "red")

