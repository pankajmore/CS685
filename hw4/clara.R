#!/usr/bin/Rscript

library('cluster')

asw <- numeric(20) 
x <- read.csv("clusters_input.csv")

for (k in 2:20) {
  asw[k] <- clara(x, k)$silinfo$avg.width 
  cat("silhoutte coefficient for ",k," clusters : ", asw[k], "\n")
} 

k.best <- which.max(asw)
cat("silhouette-optimal number of clusters:", k.best, "\n")

cl <- clara(x,9)$cluster

for (k in 1:length(cl)) {
  cat(cl[k],"\n")
}
plot(1:20, asw, type= "h", main = "clara clustering assessment",xlab= "k (# clusters)", ylab = "average silhouette width") 
axis(1, k.best, paste("best",k.best,sep="\n"), col = "red", col.axis = "red")

