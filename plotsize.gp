set xlabel "Year"
set ylabel "Table size (prefixes)"
set key top left

set xtics ("1989" 186, "1991" 916, "1993" 1647, "1995" 2377, "1997" 3108, "1999" 3838, "2001" 4569, "2003" 5299, "2005" 6030, "2007" 6760)

set terminal postscript eps 19
set output "tablesizefit.eps"

plot [:][0:300000] "bgp-daily.txt" using ($1-47341):2 with lines lw 2 title "Prefixes in table", \
     linfit(x) = -81513.5 + x*39.6, linfit(x) lw 2 title "Linear fit", \
     expfit(x) = exp(9.3735436 + 0.0004253*x), expfit(x) lw 2 title "Exponential fit"

# For talk version
set xtics ("1989" 186, "1993" 1647, "1997" 3108, "2001" 4569, "2005" 6030)
set terminal pdf color fsize 12
set output "tablesizefit-color-talk.pdf"

plot [:][0:300000] "bgp-daily.txt" using ($1-47341):2 with lines lw 4 title "Prefixes in table", \
     expfit(x) = exp(9.3735436 + 0.0004253*x), expfit(x) lw 8 lc rgb 'dark-blue' title "Exponential fit"
