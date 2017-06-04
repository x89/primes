#!/usr/bin/env ruby

# Using the Sieve of Atkin discovered by Atkin and Bernstein
# See: https://en.wikipedia.org/wiki/Sieve_of_Atkin#Algorithm

max_prime = 100

results = [2,3,5]

# Fill a hash up to max_prime with everything set to false
$primes = Hash[(1..max_prime).map{ |i| [i,false] }]

# 3.1 Flip for [1, 13, 17, 29, 37, 41, 49, 53] for 4x² + y² = n
# x: all positive integers
x = (1..max_prime).select { |x| x }
# y: all odd integers
y = (1..max_prime).select { |x| x % 2 != 0}
res = (x+y).combination(2).to_a.uniq.map{|x,y| 4 * x**2 + y**2}
res.reject! { |x| x > max_prime }
res.each do |p|
  if [1, 13, 17, 29, 37, 41, 49, 53].include? p then
    $primes[p] = !$primes[p]
    puts "Switched #{p}"
  end
end

# 3.2 Flip for [7, 19, 31, 43] for 3x² + y² = n
# x: all odd integers
x = (1..max_prime).select { |x| x % 2 != 0 }
# y: all even integers
y = (1..max_prime).select { |x| x % 2 == 0}
res = (x+y).combination(2).to_a.uniq.map{|x,y| 3 * x**2 + y**2}
res.reject! { |x| x > max_prime }
res.each do |p|
  if [7, 19, 31, 43].include? p then
    $primes[p] = !$primes[p]
    puts "Switched #{p}"
  end
end

# 3.3 Flip for [11, 23, 47, 59] for 3x² - y² = n


puts "#{$primes}"
$primes.reject! { |k,v| v == false }
puts
puts "#{$primes}"
