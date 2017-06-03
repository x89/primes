#!/usr/bin/env crystal

require "zip"

# Using the Sieve of Atkin discovered by Atkin and Bernstein
# See: https://en.wikipedia.org/wiki/Sieve_of_Atkin#Algorithm
# Written in the Crystal language

max_prime = 1000

results = [2,3,5] of Int32

# Fill a hash up to max_prime with everything set to false
primes = {} of Int32 => Bool
1.upto(max_prime) do |n|
  primes[n] = false
end

#  x = (1..max_prime).map { |x| x }
  #y = (1..max_prime).reject { |x| x % 2 == 0 }
  #puts "#{x} #{y} #{x.zip(y)}"
  # madzip = x.zip(y)
  #   .select{|x,y| y != nil}
  #   .map{|x,y| 4*x**2+y**2}
  #   .reject{|x| x > max_prime}
  # puts "#{madzip}"
  # madzip.each do |i|
  #   if [1,13,17,29,37,41,49,53].includes? n % 60
  #     primes[n] = !primes[n]
  #   end
  # end

x = (1..max_prime).reject { |x| x }
y = (1..max_prime).reject { |x| x % 2 != 0 }
madzip = (x+y).combinations(2).to_a.uniq
  .map{ |x| 4 *  x[0]**2 * x[1]**2 }
  .reject{ |x| x > max_prime || x < 1 }
madzip.each do |i|
  puts "#{i} #{i%60}"
  if [1,13,17,29,37,41,49,53].includes? i % 60
    primes[i] = !primes[i]
    puts "flipped: #{i}"
  end
end

x = (1..max_prime).reject { |x| x % 2 == 0 }
y = (1..max_prime).reject { |x| x % 2 != 0 }
madzip = (x+y).combinations(2).to_a.uniq
  .map{ |x| 4 *  x[0]**2 * x[1]**2 }
  .reject{ |x| x > max_prime || x < 1 }
madzip.each do |i|
  puts "#{i} #{i%60}"
  if [7,19,31,43].includes? i % 60
    primes[i] = !primes[i]
    puts "flipped: #{i}"
  end
end


primes.reject! { |k,v| v == false }
puts "#{primes}"
