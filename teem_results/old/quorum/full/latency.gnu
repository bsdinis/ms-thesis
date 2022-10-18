
reset

# eps
set terminal postscript eps size 7.50, 4.00 enhanced color font 'Helvetica, 28'
set output 'full/eps/latency.eps'


set border linewidth 5
set key outside above


# Set color of linestyle 2 to #8b0000
set style line 2 linecolor rgb '#8b0000' linetype 2 linewidth 5 pointtype 6 pointsize 3 dashtype 2
# Set yerror color of linestyle 3 to #8b0000
set style line 3 linecolor rgb '#8b0000' linetype 2 linewidth 3.75 pointtype 6 pointsize 3


# Set color of linestyle 4 to #0000ff
set style line 4 linecolor rgb '#00109b' linetype 4 linewidth 5 pointtype 6 pointsize 3 dashtype 2
# Set yerror color of linestyle 5 to #0000ff
set style line 5 linecolor rgb '#00109b' linetype 4 linewidth 3.75 pointtype 6 pointsize 3


# Set color of linestyle 6 to #228b22
set style line 6 linecolor rgb '#228b22' linetype 6 linewidth 5 pointtype 6 pointsize 3 dashtype 2
# Set yerror color of linestyle 7 to #228b22
set style line 7 linecolor rgb '#228b22' linetype 6 linewidth 3.75 pointtype 6 pointsize 3

# set axis
set tics scale 0.75
set xlabel 'Offered Load (ops/s)'
set ylabel 'Latency (ms)'
set xrange [0:6500]
set yrange [0:200]
plot 'bft/dat/read_lat.dat' title 'BQS Read' with yerrorbars linestyle 3 pointtype 6, '' notitle with lines linestyle 2, 'bft/dat/write_lat.dat' title 'BQS Write' with yerrorbars linestyle 3 pointtype 8, '' notitle with lines linestyle 2, 'r3/dat/read_lat.dat' title 'R^2 Read' with yerrorbars linestyle 5 pointtype 6, '' notitle with lines linestyle 4, 'r3/dat/write_lat.dat' title 'R^2 Write' with yerrorbars linestyle 5 pointtype 8, '' notitle with lines linestyle 4
