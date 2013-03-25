
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

