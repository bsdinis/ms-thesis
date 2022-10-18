reset

set terminal postscript eps colour size 12cm,8cm enhanced font 'Helvetica,20'
set output 'crash/crash_10.eps'

set border linewidth 0.75
set key outside above
# Set color of linestyle 1 to #f6511d
set style line 1 linecolor rgb '#f6511d' linetype 2 linewidth 2.5 pointtype 4 pointsize 2 dashtype 2
# Set yerror color of linestyle 2 to #4
set style line 2 linecolor rgb '#f6511d' linetype 2 linewidth 2.5 pointtype 4 pointsize 2
# Set color of linestyle 3 to #ffb400
set style line 3 linecolor rgb '#ffb400' linetype 2 linewidth 2.5 pointtype 6 pointsize 2 dashtype 2
# Set yerror color of linestyle 4 to #6
set style line 4 linecolor rgb '#ffb400' linetype 2 linewidth 2.5 pointtype 6 pointsize 2


# set axis
set tics scale 0.75
set xlabel 'Throughput (Kops/s)'
set ylabel 'Latency (ms)'
set xrange [*:*]
set yrange [*:*]

plot 'crash/crash_10_crash transfer.dat' title 'Crash Transfer' with lp linestyle 1, 'crash/crash_10_crash get.dat' title 'Crash Get' with lp linestyle 3
