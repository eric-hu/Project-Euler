# Benchmarking code for primes.rb
#
# Include equality tests in this file as well, to verify that the old and new
# methods match in functionality.

# Use Load, not require, so that this file can be run multiple times from the
# same irb instance
load "./#{File.dirname(__FILE__)}/../primes.rb"
require 'benchmark'

# =============================  divisor_count_of ==============================
#puts "Benchmarking divisor_count_of"

## Use bmbm instead of bm to reduce GC overhead

#inputs = [2**20 + 1, 2**25 + 1]
#inputs.each do |input|
  #outputs = [0,0]

  #Benchmark.bmbm do |x|
    #puts "Finding divisor count for: ", input
    #x.report("prime factorization") {outputs[0] = divisor_count_of(input)}
    #x.report("brute force") {outputs[1] = Naive.divisor_count_of(input)}
  #end

  #puts "prime factorization result: #{outputs[0]}"
  #puts "brute force result: #{outputs[1]}"
  #puts "results equal? ", outputs[0] == outputs[1]
#end

# =============================  primes_less_than ==============================
puts "Benchmarking primes_less_than"

Benchmark.bmbm do |x|
  x.report {primes_less_than(200_000).to_a.inject(&:+)}
  x.report {Naive.primes_less_than(200_000).inject(&:+)}
end
