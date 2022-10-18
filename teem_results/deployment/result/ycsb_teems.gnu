reset

set terminal postscript eps colour size 12cm,8cm enhanced font 'Helvetica,20'
set output 'result/ycsb_teems.eps'

set border linewidth 0.75
set key outside above
set style data histogram

set style histogram cluster gap 1 errorbars lw 2

# set axis
set style fill pattern 4 border rgb "black"
set auto x
set yrange [0:120]
set ylabel 'Latency (ms)'

plot for [i=2:17:3] 'result/ycsb_teems.dat' using i:i+1:i+2:xtic(1) title col(i)
