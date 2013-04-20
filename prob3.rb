# http://projecteuler.net/index.php?section=problems&id=3

# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?
#

# Output results
#71
#839
#1471
#6857
#59569
#104441
#486847

require './primes.rb'

main_num = 600851475143
divs = nontrivial_divisors_of main_num


puts "Divisors of main number: #{main_num}\n #{divs}"


prime_divs = []
divs.each do |d|
  prime_divs.push(d) if is_prime?(d)
end

puts "Prime divisors:\n #{prime_divs}"
