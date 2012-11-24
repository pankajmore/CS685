#!/usr/bin/Rscript

library('cluster')

asw <- numeric(20) 
x <- read.csv("clusters_input.csv")

# dissimilarity matrix
dissE = daisy(x)

for (k in 2:20) {
  asw[k] <- summary(silhouette(kmeans(x, k, iter.max=300, nstart=1, algorithm='Lloyd')$cl, dissE^2))$avg.width
  cat("silhoutte coefficient for ",k," clusters : ", asw[k], "\n")
} 
k.best <- which.max(asw)
cat("silhouette-optimal number of clusters:", k.best, "with value : ", asw[k.best], "\n")

plot(1:20, asw, type= "h", main = "kmeans clustering assessment",xlab= "k (# clusters)", ylab = "average silhouette width") 
axis(1, k.best, paste("best",k.best,sep="\n"), col = "red", col.axis = "red")

