#!/usr/bin/env ruby

YEARS        = [2007,    2011,    2020   ]
PREFIXES     = [247000,  388455,  1600000]
BUCKS_GBIT   = [9.6,     2.4,     0.3]
PER_AS_IP    = [16,      32,      32]
PER_AS_AIP   = [160,     160,     160]
PEERS        = [20,      20,      20]
DIAMETER     = [5,       6,       6]
PER_RIB_IP   = [72,      72,      72]
PER_RIB_AIP  = [88,      88,      88]  # next-hop is longer...
PER_PREF_IP  = [0,       0,       0  ]
PER_PREF_AIP = [512,     512,     512]

per_pref = PER_PREF_IP
per_as = PER_AS_IP
per_rib = PER_RIB_IP

puts "IP"

(0..2).each { |y|
  bytes = PREFIXES[y]*per_pref[y] +
          PEERS[y]*PREFIXES[y]*(per_rib[y] + (DIAMETER[y]*per_as[y]/8))
  cost = sprintf("%d", BUCKS_GBIT[y]*bytes*8/(1000000000))
  puts "Bytes #{YEARS[y]}:  #{bytes}  ($#{cost})"
}

per_pref = PER_PREF_AIP
per_as = PER_AS_AIP
per_rib = PER_RIB_AIP

puts "AIP"
(0..2).each { |y|
  bytes = PREFIXES[y]*per_pref[y] +
          PEERS[y]*PREFIXES[y]*(per_rib[y] + (DIAMETER[y]*per_as[y]/8))
  cost = sprintf("%d", BUCKS_GBIT[y]*bytes*8/(1000000000))
  puts "Bytes #{YEARS[y]}:  #{bytes}  ($#{cost})"
}

