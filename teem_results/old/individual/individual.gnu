
set terminal postscript eps size 9.00, 6.00 enhanced color font 'Helvetica, 60'
set output 'individual.eps'


set key outside above

set border linewidth 2

set style data histogram
set style histogram cluster gap 1 errorbars lw 2

set style fill pattern 4 border rgb "black"
set auto x
set yrange [0:*]
set ylabel 'Latency (ms)'

plot for [i=2:5:3] 'individual.dat' using i:i+1:i+2:xtic(1) title col(i)
