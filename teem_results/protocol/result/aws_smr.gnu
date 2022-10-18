reset

set terminal postscript eps colour size 12cm,8cm enhanced font 'Helvetica,20'
set output 'result/aws_smr.eps'

set border linewidth 0.75
set key outside above
set style data histogram

set style histogram cluster gap 1 errorbars lw 2

# set axis
set style fill pattern 4 border rgb "black"
set auto x
set yrange [0:500]
set ylabel 'Latency (ms)'

plot for [i=2:8:3] 'result/aws_smr.dat' using i:i+1:i+2:xtic(1) title col(i)
