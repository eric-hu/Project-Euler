primes = [2,3]

def find_next_prime prime_list
  counter = prime_list[-1]
  counter_not_prime = true

  while counter_not_prime
    counter+=2
    counter_not_prime = false
    prime_list.each do |p|
      counter_not_prime = true if counter % p == 0
    end
  end
  # counter should be prime at this point
  counter
end

while primes.length < 10001
  primes.push find_next_prime(primes)
  puts "list length: #{primes.length}" if primes.length % 1000 == 0
end

puts "10001st prime: #{primes[-1]}"
