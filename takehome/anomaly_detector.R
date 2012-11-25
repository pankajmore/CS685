#!/usr/bin/Rscript

require("pracma")

x <- read.table("anomaly_s57.dat")

data <- as.matrix(x)

fp = 0
for(i in 1:100) {
    fp = fp + length(hampel(data[i,],1,0.68)$ind)
}

hampel_matrix = function() {
m <- zeros(100)
for(i in 1:100) {
  m[i,c(hampel(data[i,],1,0.68)$ind)] = 1
}
write.table(m,"answer_s57.dat",row.names=FALSE,col.names=FALSE)
return(m)
}

plot_peaks = function(row) {

plot.ts(data[row,])
fp <- findpeaks(data[row,])
y <- data[row,fp[,3]]
x <- fp[,3]
points(x,y,col="red")

}

plot_hampel = function(row, k = 2, t = 3) {

plot.ts(data[row,])
hp <- hampel(data[row,], k , t)
y <- data[row,hp$ind]
x <- hp$ind
points(x,y,col="red")

} 

plot_loess = function(row) {

plot.ts(data[row,])
lo <- loess(data[row,]~seq(1:100),control = loess.control(surface = "direct"))
x <- order(abs(lo$residuals),decreasing=TRUE)[1:5]
y <- data[row,x]
lines(predict(lo), col='blue', lwd=2)
points(x,y,col="red")

}

smoothSpline_matrix = function() {

m <- zeros(100)
residues <- zeros(100)
for(i in 1:100) {
  p <- predict(smoothingSpline)
  r <- p$y - data[i,]
  r <- abs(r)
  residues[i,] = r
}
b <- order(residues,decreasing=TRUE)[1:500]
m[b] = 1
write.table(m,"smoothSpline.dat",row.names=FALSE,col.names=FALSE)
return(b)

}

plot_smoothSpline = function(row) {

plot.ts(data[row,])
smoothingSpline = smooth.spline(seq(1:100), data[row,] )
p <- predict(smoothingSpline)
r <- p$y - data[row,]
r <- abs(r)
x <- order(r,decreasing=TRUE)[1:5]
y <- data[row,x]
lines(predict(smoothingSpline), col='blue', lwd=2)
points(x,y,col="red")

}

plot_all_hampel = function() {
for(i in 1:100) {
  filename <- sprintf("%d.png",i)
  png(filename)
  # make plot
  plot.ts(data[i,])
  hp <- hampel(data[i,],1,1)
  y <- data[row,hp$ind]
  x <- hp$ind
  points(x,y,col="red")
  dev.off()
}

}

plot_polyfit = function(row,degree = 3){

x <- seq(1:100)
y <- data[row,]

fit <- lm(y ~ poly(x,degree,raw=TRUE))

polynomial <- function(x) fit$coefficient[3]*x^2 + fit$coefficient[2]*x + fit$coefficient[1]

curve(polynomial, 1, 100, col="red")

points(x,y,type="p", lwd=3)

}

# Main function
print(fp)
hampel_matrix()
