# Longest Collatz sequence
# Problem 14
# The following iterative sequence is defined for the set of positive integers:
#
# n  n/2 (n is even)
# n  3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13  40  20  10  5  16  8  4  2  1
# It can be seen that this sequence (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet (Collatz Problem), it
# is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

# 1st pass: implement the dumb way without any math or software engineering
# optimizations to see if any memoization is needed.  Consider this an exercise
# in prototyping.
#
# =============================================================================
#
# First pass run time: ~1 min
# Solution: 837799

def collatz_length_of starting_value
  length = 1
  until starting_value == 1
    length += 1
    starting_value = if starting_value % 2 == 0
                         starting_value/2
                       else
                         3*starting_value + 1
                       end
  end

  length
end


#class CollatzSequence

  #def initialize
    #value
    #@length = nil
  #end

#end

max_length = 0
max_value = nil
(1...1_000_000).each do |value|
  current_length = collatz_length_of(value)
  if current_length > max_length
    max_length = current_length
    max_value = value
  end

  puts "50k step" if value % 50000 == 0
end

puts "The longest Collatz sequence for a starting value less than a million is:"
puts max_value
puts "Its length is: #{max_length}"

