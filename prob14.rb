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

# =============================================================================
#
# First pass run time: ~1 min
# Solution: 837799

# ================================= Support ===================================
# CollatzSequence is a container class for an initial value of a Collatz
# sequence and its length.
class CollatzSequence
  attr_accessor :initial_value, :length

  def initialize initial_value
    raise "initial value must be greater than zero" unless initial_value > 0
    @initial_value = initial_value
    @length = self.class.sequence_length_of initial_value
  end

  private

  def self.sequence_length_of value
    length = 1
    until value == 1
      length += 1
      value = next_value(value)
    end

    length
  end

  def self.next_value value
    value.even? ? value/2 : 3*value + 1
  end
end

# =================================  Solution ==================================

max_seq = CollatzSequence.new(1)
(2...1_000_000).each do |value|
  current_sequence = CollatzSequence.new(value)
  if current_sequence.length > max_seq.length
    max_seq = current_sequence
  end
end

puts "The longest Collatz sequence for a starting value less than a million is:"
puts max_seq.initial_value
puts "Its length is: #{max_seq.length}"

