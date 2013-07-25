# Power digit sum
# Problem 16
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 2^1000?

# Another example problem of Ruby making bignum math trivial
#
number = 2^1000
result = 0
number.to_s.each_char do |val|
  result += val
end
