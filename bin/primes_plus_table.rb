#!/usr/bin/ruby

require_relative '../lib/math_tables.rb'

class PlusTable < Table
  def self.math(a,b)
    a+b
  end
  def self.max_cell_width
    @x_max ||= @x.sort.last
    @y_max ||= @y.sort.last
    max_cell_width ||= (@x_max+@y_max).to_s.length.to_i
  end
end

x = Eratosthenes.primes(30)
y = Eratosthenes.primes(30)

puts PlusTable.cute_table(x,y)