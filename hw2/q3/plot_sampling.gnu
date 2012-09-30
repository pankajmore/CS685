set terminal postscript eps enhanced mono dashed lw 1 "Helvetica" 14

set title "Sampling"
set ylabel "Empirical Probability"
set autoscale
set yrange [0:1]
set ytics out
set xtics out

set xlabel "Sample size"
set xrange [5:50]
set output "n_plot.eps"
plot "n.txt" using 1:2 title "constant k" with linespoints

set xlabel "# of groups"
set xrange [10:60]
set output "k_plot.eps"
plot "k.txt" using 1:2 title "constant n" with linespoints
