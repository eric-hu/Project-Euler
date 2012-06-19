
# The difference of the sum of the squares
# and the square of the sums works out to be
# the sum of each possible pair of numbers
# where the two numbers are distinct.
def findDiffSquares(n)
  sum = 0
  (1..n).each { |i|
    (1..n).each { |j|
      sum += i*j unless i == j
    }
  }
  sum
end

puts findDiffSquares(100)
