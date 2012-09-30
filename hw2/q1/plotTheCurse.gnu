set terminal postscript eps enhanced mono dashed lw 1 "Helvetica" 14

set title "Histogram plot"
set ytics out
set xtics out
set xlabel "Bins"
set ylabel "Number of pair of points"
set xrange [-10:60]
set style data histogram
set boxwidth 1.0
set style fill solid border -1
set style histogram cluster gap 1
set bars fullwidth

set output "dim1.eps"
plot "dim1.txt" using 1 title "dimension = 1"
set output "dim2.eps"
plot "dim2.txt" using 1 title "dimension = 2"
set output "dim5.eps"
plot "dim5.txt" using 1 title "dimension = 5"
set output "dim10.eps"
plot "dim10.txt" using 1 title "dimension = 10"
set output "dim25.eps"
plot "dim25.txt" using 1 title "dimension = 25"
set output "dim50.eps"
plot "dim50.txt" using 1 title "dimension = 50"
set output "dim100.eps"
plot "dim100.txt" using 1 title "dimension = 100"

set output "ndim1.eps"
plot "ndim1.txt" using 1 title "dimension = 1"
set output "ndim2.eps"
plot "ndim2.txt" using 1 title "dimension = 2"
set output "ndim5.eps"
plot "ndim5.txt" using 1 title "dimension = 5"
set output "ndim10.eps"
plot "ndim10.txt" using 1 title "dimension = 10"
set output "ndim25.eps"
plot "ndim25.txt" using 1 title "dimension = 25"
set output "ndim50.eps"
plot "ndim50.txt" using 1 title "dimension = 50"
set output "ndim100.eps"
plot "ndim100.txt" using 1 title "dimension = 100"
