reset

set terminal postscript eps colour size 14cm,8 enhanced font 'Helvetica,20'
set output 'result/smr.eps'

set border linewidth 0.75
set key outside above

# Set color of linestyle 1 to #f6511d
set style line 1 linecolor rgb '#f6511d' linetype 2 linewidth 2.5 pointtype 4 pointsize 2 dashtype 2
# Set yerror color of linestyle 2 to #4
set style line 2 linecolor rgb '#f6511d' linetype 2 linewidth 1.5 pointtype 4 pointsize 2

# Set color of linestyle 3 to #f6511d
set style line 3 linecolor rgb '#f6511d' linetype 2 linewidth 2.5 pointtype 6 pointsize 2 dashtype 2
# Set yerror color of linestyle 4 to #6
set style line 4 linecolor rgb '#f6511d' linetype 2 linewidth 1.5 pointtype 6 pointsize 2

# Set color of linestyle 5 to #7fb800
set style line 5 linecolor rgb '#7fb800' linetype 2 linewidth 2.5 pointtype 4 pointsize 2 dashtype 2
# Set yerror color of linestyle 6 to #8
set style line 6 linecolor rgb '#7fb800' linetype 2 linewidth 1.5 pointtype 4 pointsize 2

# Set color of linestyle 7 to #7fb800
set style line 7 linecolor rgb '#7fb800' linetype 2 linewidth 2.5 pointtype 6 pointsize 2 dashtype 2
# Set yerror color of linestyle 8 to #10
set style line 8 linecolor rgb '#7fb800' linetype 2 linewidth 1.5 pointtype 6 pointsize 2

# Set color of linestyle 9 to #00a6ed
set style line 9 linecolor rgb '#00a6ed' linetype 2 linewidth 2.5 pointtype 4 pointsize 2 dashtype 2
# Set yerror color of linestyle 10 to #12
set style line 10 linecolor rgb '#00a6ed' linetype 2 linewidth 1.5 pointtype 4 pointsize 2

# Set color of linestyle 11 to #00a6ed
set style line 11 linecolor rgb '#00a6ed' linetype 2 linewidth 2.5 pointtype 6 pointsize 2 dashtype 2
# Set yerror color of linestyle 12 to #14
set style line 12 linecolor rgb '#00a6ed' linetype 2 linewidth 1.5 pointtype 6 pointsize 2

# Set color of linestyle 9 to #400080
set style line 13 linecolor rgb '#400080' linetype 2 linewidth 2.5 pointtype 4 pointsize 2 dashtype 2
# Set yerror color of linestyle 10 to #12
set style line 14 linecolor rgb '#400080' linetype 2 linewidth 1.5 pointtype 4 pointsize 2

# Set color of linestyle 11 to #400080
set style line 15 linecolor rgb '#400080' linetype 2 linewidth 2.5 pointtype 6 pointsize 2 dashtype 2
# Set yerror color of linestyle 12 to #14
set style line 16 linecolor rgb '#400080' linetype 2 linewidth 1.5 pointtype 6 pointsize 2


# set axis
set tics scale 0.75
set xlabel 'Throughput (Kops/s)'
set ylabel 'Latency (ms)'
set xrange [*:*]
set yrange [*:200]

plot 'result/100_crash get.dat' title 'Crash Read' with yerrorbars linestyle 2, '' title '' with lines linestyle 1, 'result/0_crash transfer.dat' title 'Crash Update' with yerrorbars linestyle 4, '' title '' with lines linestyle 3, 'result/100_rr get.dat' title 'RR Read' with yerrorbars linestyle 6, '' title '' with lines linestyle 5, 'result/0_rr transfer.dat' title 'RR Update' with yerrorbars linestyle 8, '' title '' with lines linestyle 7, 'result/100_bft get.dat' title 'BFT Read' with yerrorbars linestyle 10, '' title '' with lines linestyle 9, 'result/0_bft transfer.dat' title 'BFT Update' with yerrorbars linestyle 12, '' title '' with lines linestyle 11
