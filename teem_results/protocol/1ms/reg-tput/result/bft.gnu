reset

set terminal postscript eps colour size 12cm,8cm enhanced font 'Helvetica,20'
set output 'result/bft.eps'

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


# set axis
set tics scale 0.75
set xlabel 'Throughput (Kops/s)'
set ylabel 'Latency (s)'
set xrange [*:*]
set yrange [*:*]

plot 'result/0_bft put.dat' title 'BFT Put' with linespoint linestyle 1, 'result/100_bft get.dat' title 'BFT Put' with linespoint linestyle 3
