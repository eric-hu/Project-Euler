# Summation of primes
# Problem 10
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

# Result
#
# 142913828922
# Current solution takes 5-10 minutes to run.  This problem has lots of room
# for optimization.
#
# TODO: Optimize array_of_primes_less_than by implementing sieve of Erathnoses

require './primes.rb'

# =============================  Support Methods ==============================
def array_of_primes_less_than limit

  result = []

  return result unless limit >= 2

  (2...limit).each do |value|
    puts "value is: #{value}" if value % 10000 == 0
    result.push value if is_prime?(value)
  end

  result
end

# =================================  Solution ==================================

upper_limit = 2_000_000
result = array_of_primes_less_than(upper_limit).inject &:+

puts "The sum of primes less than #{upper_limit} is #{result}"
