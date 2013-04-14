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

# Public: Returns an array of divisors of primary_num, excluding 1 and
# primary_num
#
# primary_num - A positive integer
# options     - A Hash that can optionally alter the list of primes returned
#               :upper_limit - The Integer upper_limit of the divisors list,
#                              inclusive.
def nontrivial_divisors_of primary_num, options={}
  # Merge in default options
  default_options = {upper_limit: primary_num - 1}


  # Because default options in the argument list will be ignored/missed if a
  # partial option hash is passed in
  options = default_options.merge options

  upper_limit = options[:upper_limit]

  divisors = []
  (2..upper_limit).each do |val|
    if primary_num % val == 0
      divisors.push val
    end
  end
  divisors
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
    # composite values.  It may save time, but benchmarking should be done to
    # confirm...even then, only if a speed improvement is necessary.
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

