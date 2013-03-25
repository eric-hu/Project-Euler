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


def is_prime? number
  # assume number is a postive integer
  divs = find_divisors number
  divs.empty?
end

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


main_num = 600851475143
divs = find_divisors main_num


puts "Divisors of main number: #{main_num}\n #{divs}"


prime_divs = []
divs.each do |d|
  prime_divs.push(d) if is_prime?(d)
end

puts "Prime divisors:\n #{prime_divs}"
