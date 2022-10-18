reset

set terminal postscript eps colour size 12cm,8cm enhanced font 'Helvetica,20'
set output 'result/0.eps'

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
# Set color of linestyle 5 to #00a6ed
set style line 5 linecolor rgb '#00a6ed' linetype 2 linewidth 2.5 pointtype 8 pointsize 2 dashtype 2
# Set yerror color of linestyle 6 to #8
set style line 6 linecolor rgb '#00a6ed' linetype 2 linewidth 2.5 pointtype 8 pointsize 2
# Set color of linestyle 7 to #7fb800
set style line 7 linecolor rgb '#7fb800' linetype 2 linewidth 2.5 pointtype 10 pointsize 2 dashtype 2
# Set yerror color of linestyle 8 to #10
set style line 8 linecolor rgb '#7fb800' linetype 2 linewidth 2.5 pointtype 10 pointsize 2
# Set color of linestyle 9 to #0d2c54
set style line 9 linecolor rgb '#0d2c54' linetype 2 linewidth 2.5 pointtype 12 pointsize 2 dashtype 2
# Set yerror color of linestyle 10 to #12
set style line 10 linecolor rgb '#0d2c54' linetype 2 linewidth 2.5 pointtype 12 pointsize 2
# Set color of linestyle 11 to #f6511d
set style line 11 linecolor rgb '#f6511d' linetype 2 linewidth 2.5 pointtype 14 pointsize 2 dashtype 2
# Set yerror color of linestyle 12 to #14
set style line 12 linecolor rgb '#f6511d' linetype 2 linewidth 2.5 pointtype 14 pointsize 2


# set axis
set tics scale 0.75
set xlabel 'Throughput (Kops/s)'
set ylabel 'Latency (ms)'
set xrange [*:*]
set yrange [*:*]

plot 'result/0_bft get.dat' title 'BFT Get' with linespoint linestyle 1, 'result/0_bft transfer.dat' title 'BFT Transfer' with linespoint linestyle 3, 'result/0_crash get.dat' title 'Crash Get' with linespoint linestyle 5, 'result/0_crash transfer.dat' title 'Crash Transfer' with linespoint linestyle 7, 'result/0_rr get.dat' title 'RR Get' with linespoint linestyle 9, 'result/0_rr transfer.dat' title 'RR Transfer' with linespoint linestyle 11
