#!/usr/bin/Rscript

library('cluster')

asw <- numeric(20) 
x <- read.csv("clusters_input.csv")

hc <- hclust(dist(x,method='minkowski'))

c <- cutree(hc,9)

for (k in 1:length(c)) {
  cat(c[k],"\n")
}
