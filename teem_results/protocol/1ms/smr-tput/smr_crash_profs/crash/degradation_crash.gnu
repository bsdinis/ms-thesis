reset

set terminal postscript eps colour size 12cm,8cm enhanced font 'Helvetica,20'
set output 'crash/degradation.eps'

set border linewidth 0.75
set key outside above
# Set color of linestyle 1 to #f6511d
set style line 1 linecolor rgb '#f6511d' linetype 2 linewidth 2.5 pointtype 4 pointsize 2 dashtype 2
# Set yerror color of linestyle 2 to #4
set style line 2 linecolor rgb '#f6511d' linetype 2 linewidth 2.5 pointtype 4 pointsize 2


# set axis
set tics scale 0.75
set xlabel 'Percentage of Updates (%)'
set ylabel 'Throughput (Kops/s)'
set xrange [*:*]
set yrange [*:*]

plot 'crash/degradation_crash.dat' title 'Crash' with linespoint linestyle 1
