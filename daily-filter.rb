#!/usr/bin/env ruby
require 'rubygems'
require 'date'
#require 'gsl'
#include GSL
#include GSL::Fit

timevec = Array.new
entryvec = Array.new

puts "day entries"
oldtime = 0
starttime = nil
ARGF.each_line { |line|
  time, entries = line.chomp.split
  time = time.to_i
  amjd = Date.parse(Time.at(time).to_s).amjd.to_i
  time = amjd
  if (!starttime)
    starttime = time
  end
  #time -= starttime
  if (time != oldtime)
    entries = entries.to_i
    timevec.push(time)
    entryvec.push(entries)
    puts "#{time} #{entries}"
  end
  oldtime = time
}
exit
times = Vector.alloc(timevec)
entries = Vector.alloc(entryvec)
weights = Vector.indgen(entryvec.size, 1, 0)

#c0, c1, cov00, cov01, cov11, chisq = wlinear(times, weights, entries)
c0 = 0
c1, cov11, chisq, status = mul(times, entries)
p status
printf("Best linear fit:  Y = #{c0} + #{c1} * x\n")
#printf("Covariance matrix:\n")
#printf("[ %g %g\n  %g %g]\n", cov00, cov01, cov01, cov11)
printf("chisq: %g\n", chisq)
derived_entries = Vector.calloc(entries.size)
pos = 0
times.each { |t|
  derived_entries[pos] = c0 + (c1 * t)
#   derived_entries[pos], err = linear_est(t, c0, c1, cov00, cov01, cov11)
   pos += 1
}
puts times
puts entries 
puts derived_entries
