#!/usr/bin/env ruby

"""
Implementation of the considerably simpler Sieve of Eratosthenes compared
to the Atkin sieve.

Used to generate up to N primes.
"""

class Integer
  def eratosthenes
    """Returns a hash of primes Int => Bool."""
    n = self  # because I prefer n
    sqrt_n = Math.sqrt(n)
    h = Hash[(1..n).each.map { |x| [x, true] }]
    h[1] = false
    (2..sqrt_n).each do |i|
      if h[i] == true then
        (i*i..n).step(i).each do |j|
          h[j] = false
        end
      end
    end
    h
  end
end

require 'benchmark'

runs = 100
Benchmark.bm do |x|
  x.report { runs.times do 100.eratosthenes; end }
  x.report { runs.times do 10000.eratosthenes; end }
  x.report { runs.times do 1000000.eratosthenes; end }
end