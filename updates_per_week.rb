#!/usr/bin/env ruby
totupdates = 0
lastday = nil

ARGF.each_line { |l|
  (day, updates) = l.chomp.split
  day, updates = day.to_i, updates.to_i
  if (!lastday)
      lastday = day
  end
  if (day > lastday + 6)
      puts "#{lastday} #{totupdates}" unless lastday == 0
      totupdates = 0
      lastday = day
  end
  totupdates += updates
}
