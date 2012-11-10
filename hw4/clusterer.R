#!/usr/bin/Rscript

library('cluster')

asw <- numeric(20) 
x <- read.csv("clusters_input.csv")

cl <- kmeans(x,9)$cluster

for (k in 1:length(cl)) {
  cat(cl[k],"\n")
}
