# Public: Returns true if the provided number has no divisors besides itself
# and 1
#
# number - A positive integer
def is_prime? number
  root_floor = (number ** 0.5).floor

  # Only check if there are divisors up to the square root.  If there are any
  # divisors greater than the square root, there must be divisors less than the
  # square root
  divisors_up_to_square_root = nontrivial_divisors_of(number, {upper_limit: root_floor})
  divisors_up_to_square_root.empty?
end

# Public: Find all positive divisors of a number besides 1 and the number itself
#
# number  - A positive integer
# options - A Hash that can optionally alter the list of primes returned
#           :upper_limit - The Integer upper_limit of the divisors list,
#                          inclusive.
#
# Returns an array of divisors of number, excluding 1 and number
def nontrivial_divisors_of number, options={}
  # Merge in default options
  default_options = {upper_limit: number - 1}
  # Because default options in the argument list will be ignored/missed if a
  # partial option hash is passed in
  options = default_options.merge options

  upper_limit = options[:upper_limit]

  divisors = []
  (2..upper_limit).each do |val|
    if number % val == 0
      divisors.push val
    end
  end
  divisors
end

# Public: Find the number of divisors of the given number.
#
# number - A positive integer.
#
# Returns an integer.
def divisor_count_of(number)
  # Count the divisors by computing the prime factorization of the number and
  # multiplying PF exponents.  1 is added to the exponents since each base can
  # be raised to the 0 power, which is still a divisor of the given number.
  prime_factorization = prime_factorization_of(number)
  exponents = prime_factorization.values
  result = exponents.inject(1) {|accum, val| accum * (val + 1)}

  return result
end

# Public: Find the prime factorization of a given number.
#
# number - A positive integer greater than 1
#
# Returns the prime factorization as a hash.  The keys are prime factors and
# the values are the respective exponent.  Both keys and values are integers
def prime_factorization_of number
  counter = 2
  result = {}

  while number > 1
    # This check isn't strictly necessary as a prime will always precede its
    # composite values.
    if is_prime?(counter)
      if number % counter == 0
        result[counter] = 0
        until number % counter != 0
          number = number / counter
          result[counter] += 1
        end
      end
    end
    counter += 1
  end

  result
end

# ========================  Deprecated Implementations =========================
# Internal: the Naive class is a container for old implementations.  They're
# left available for benchmark and comparison purposes.
class Naive
  class << self
    # Deprecated: Find divisors by manually checking all values less than
    # number up to num/2, then manually add number to results array and return
    # divisors as an array
    def divisors_of(number)
      divisors = nontrivial_divisors_of(number)

      # Add in the trivial divisors
      divisors.push number, 1

      return divisors
    end

    # Deprecated: Find the number of divisors of the given number.  Divisors
    # are found by brute force and then counted.
    #
    # number - A positive integer.
    #
    # Returns an integer.
    def divisor_count_of(number)
      divisors = divisors_of(number)

      return divisors.length
    end
  end
end
