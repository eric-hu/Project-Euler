# http://projecteuler.net/index.php?section=problems&id=3

# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?
#

# Output results
#71
#839
#1471
#6857

require './primes.rb'

main_num = 600851475143
prime_factors = prime_factorization_of(main_num).keys

puts "Prime divisors:\n #{prime_factors}"
