
# is_prime?(number)
#
# Returns true if the provided number has no divisors besides itself and 1
#
# number - A positive integer
def is_prime? number
  divs = find_divisors number
  divs.empty?
end

# find_divisors(primary_num)
#
# Returns an array of divisors of primary_num, excluding 1 and primary_num
#
# primary_num - A positive integer
def find_divisors primary_num

  root = primary_num ** 0.5
  c = 2..(root.floor)

  divisors = []
  c.each do |val|
    if primary_num % val == 0
      divisors.push val
    end
  end
  divisors
end

