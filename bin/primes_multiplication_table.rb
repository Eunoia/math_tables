#!/usr/bin/ruby

require_relative '../lib/math_tables.rb'

x = Eratosthenes.primes(30)
y = Eratosthenes.primes(30)
puts Table.cute_table(x, y)
