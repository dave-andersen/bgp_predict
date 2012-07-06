set xtics ("1989" 47527, "1990" 47892, "1991" 48257, "1992" 48622, "1993" 48988, "1994" 49353, "1995" 49718, "1996" 50083, "1997" 50449, "1998" 50814, "1999" 51179, "2000" 51544, "2001" 51910, "2002" 52275, "2003" 52640, "2004" 53005, "2005" 53371, "2006" 53736, "2007" 54101, "2008" 54466)
set ylabel "BGP updates per week"
set xlabel "Year"
set terminal postscript eps 22
set output "weekupdates.eps"
plot "att-weekly.txt" with lines lw 2 title "# Updates (AT&T)", \
     "sprint-weekly.txt" with lines lw 2 title "# Updates (Sprint)"
