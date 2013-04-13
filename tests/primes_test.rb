require "./#{File.dirname(__FILE__)}/../primes.rb"
require "./#{File.dirname(__FILE__)}/assertion.rb"

# is_prime?
assert do
  is_prime?(3) &&
    is_prime?(5) &&
    is_prime?(7) &&
    is_prime?(11)
end

# nontrivial_divisors_of
assert do
  nontrivial_divisors_of(10) == [2,5] &&
    nontrivial_divisors_of(10, {upper_limit: 4}) == [2] &&
    nontrivial_divisors_of(17) == [] &&
    nontrivial_divisors_of(100) == [2,4,5,10,20,25,50] &&
    nontrivial_divisors_of(100, {upper_limit: 25}) == [2,4,5,10,20,25]
end

# prime_factorization_of
assert do
  prime_factorization_of(2**3 * 3**2 * 7**5) == {2 => 3, 3 => 2, 7 => 5}
end


puts "Prime tests passed"
