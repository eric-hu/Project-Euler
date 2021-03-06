# Largest product in a grid
# Problem 11
#
# In the 20×20 grid below, four numbers along a diagonal line have been marked
# in red.
#
# 08 02 22 97 38 15 00 40 00 75 04 05 07 78 52 12 50 77 91 08
# 49 49 99 40 17 81 18 57 60 87 17 40 98 43 69 48 04 56 62 00
# 81 49 31 73 55 79 14 29 93 71 40 67 53 88 30 03 49 13 36 65
# 52 70 95 23 04 60 11 42 69 24 68 56 01 32 56 71 37 02 36 91
# 22 31 16 71 51 67 63 89 41 92 36 54 22 40 40 28 66 33 13 80
# 24 47 32 60 99 03 45 02 44 75 33 53 78 36 84 20 35 17 12 50
# 32 98 81 28 64 23 67 10 26 38 40 67 59 54 70 66 18 38 64 70
# 67 26 20 68 02 62 12 20 95 63 94 39 63 08 40 91 66 49 94 21
# 24 55 58 05 66 73 99 26 97 17 78 78 96 83 14 88 34 89 63 72
# 21 36 23 09 75 00 76 44 20 45 35 14 00 61 33 97 34 31 33 95
# 78 17 53 28 22 75 31 67 15 94 03 80 04 62 16 14 09 53 56 92
# 16 39 05 42 96 35 31 47 55 58 88 24 00 17 54 24 36 29 85 57
# 86 56 00 48 35 71 89 07 05 44 44 37 44 60 21 58 51 54 17 58
# 19 80 81 68 05 94 47 69 28 73 92 13 86 52 17 77 04 89 55 40
# 04 52 08 83 97 35 99 16 07 97 57 32 16 26 26 79 33 27 98 66
# 88 36 68 87 57 62 20 72 03 46 33 67 46 55 12 32 63 93 53 69
# 04 42 16 73 38 25 39 11 24 94 72 18 08 46 29 32 40 62 76 36
# 20 69 36 41 72 30 23 88 34 62 99 69 82 67 59 85 74 04 36 16
# 20 73 35 29 78 31 90 01 74 31 49 71 48 86 81 16 23 57 05 54
# 01 70 54 71 83 51 54 69 16 92 33 48 61 43 52 01 89 19 67 48
#
# The product of these numbers is 26 × 63 × 78 × 14 = 1788696.
#
# What is the greatest product of four adjacent numbers in the same direction
# (up, down, left, right, or diagonally) in the 20×20 grid?

# Result
# 70600674

# Possible optimizations or improvements:
# 1. Rewrite this solution to use Ruby's Matrix class. That class came up
#    during API reading for this solution, but Matrix doesn't appear to be
#    available in IRB 1.9.3
# 2. Rename and refactor the method names.
# 3. Build a string-to-matrix parsing method (if one doesn't already exist in
#    the Ruby Matrix class).
# BUG: (Minor) This problem solver iterates over the diagonal rows many times
# more than is necessary.  Runtime is still < 1 second.

# ============================  Support Functions =============================
# Internal: Returns the formatted input.
#
# Returns an array of arrays of numbers.
def input_as_array
  # Remove leading zeroes since Ruby treats numbers like 00 as octal.  08 and
  # 09 are invalid
  [[ 8,  2, 22, 97, 38, 15,  0, 40,  0, 75,  4,  5,  7, 78, 52, 12, 50, 77, 91,  8],
  [49, 49, 99, 40, 17, 81, 18, 57, 60, 87, 17, 40, 98, 43, 69, 48,  4, 56, 62,  0],
  [81, 49, 31, 73, 55, 79, 14, 29, 93, 71, 40, 67, 53, 88, 30,  3, 49, 13, 36, 65],
  [52, 70, 95, 23,  4, 60, 11, 42, 69, 24, 68, 56,  1, 32, 56, 71, 37,  2, 36, 91],
  [22, 31, 16, 71, 51, 67, 63, 89, 41, 92, 36, 54, 22, 40, 40, 28, 66, 33, 13, 80],
  [24, 47, 32, 60, 99,  3, 45,  2, 44, 75, 33, 53, 78, 36, 84, 20, 35, 17, 12, 50],
  [32, 98, 81, 28, 64, 23, 67, 10, 26, 38, 40, 67, 59, 54, 70, 66, 18, 38, 64, 70],
  [67, 26, 20, 68,  2, 62, 12, 20, 95, 63, 94, 39, 63,  8, 40, 91, 66, 49, 94, 21],
  [24, 55, 58,  5, 66, 73, 99, 26, 97, 17, 78, 78, 96, 83, 14, 88, 34, 89, 63, 72],
  [21, 36, 23,  9, 75,  0, 76, 44, 20, 45, 35, 14,  0, 61, 33, 97, 34, 31, 33, 95],
  [78, 17, 53, 28, 22, 75, 31, 67, 15, 94,  3, 80,  4, 62, 16, 14,  9, 53, 56, 92],
  [16, 39,  5, 42, 96, 35, 31, 47, 55, 58, 88, 24,  0, 17, 54, 24, 36, 29, 85, 57],
  [86, 56,  0, 48, 35, 71, 89,  7,  5, 44, 44, 37, 44, 60, 21, 58, 51, 54, 17, 58],
  [19, 80, 81, 68,  5, 94, 47, 69, 28, 73, 92, 13, 86, 52, 17, 77,  4, 89, 55, 40],
  [ 4, 52,  8, 83, 97, 35, 99, 16,  7, 97, 57, 32, 16, 26, 26, 79, 33, 27, 98, 66],
  [88, 36, 68, 87, 57, 62, 20, 72,  3, 46, 33, 67, 46, 55, 12, 32, 63, 93, 53, 69],
  [ 4, 42, 16, 73, 38, 25, 39, 11, 24, 94, 72, 18,  8, 46, 29, 32, 40, 62, 76, 36],
  [20, 69, 36, 41, 72, 30, 23, 88, 34, 62, 99, 69, 82, 67, 59, 85, 74,  4, 36, 16],
  [20, 73, 35, 29, 78, 31, 90,  1, 74, 31, 49, 71, 48, 86, 81, 16, 23, 57,  5, 54],
  [ 1, 70, 54, 71, 83, 51, 54, 69, 16, 92, 33, 48, 61, 43, 52,  1, 89, 19, 67, 48]]
end

# Internal: Take an array and compute each product of 4 adjacent values.
#
# number_array - an array of numbers
#
# Returns the maximum or 0 if there are less than 4 elements.
def max_consecutive_quadruple_product_of(number_array)
  return 0 if number_array.length < 4

  max_product = 0
  max_iterations = number_array.length - 3
  max_iterations.times do |counter|
    quadruple_product = number_array[counter..counter+3].inject(&:*)

    max_product = [quadruple_product, max_product].max
  end

  return max_product
end

# Internal: Take an array and find the maximum product of 4 adjacent values in
# any row.
#
# number_2d_array - An array of arrays of numbers.  The length of all arrays
#                   should be the same.
#
# Returns a fixnum, just the maximum.
def max_quadruple_product_of_rows_of(number_2d_array)
  max_product = 0
  number_2d_array.map do |row|
    max_product = [max_consecutive_quadruple_product_of(row), max_product].max
  end

  max_product
end

# Internal: Take an array and find the maximum product of 4 adjacent values in
# any column.
#
# number_2d_array - An array of arrays of numbers.  The length of all arrays
#                   should be the same.
#
# Returns a fixnum, just the maximum.
def max_quadruple_product_of_columns_of(number_2d_array)
  max_product = 0

  # The rows of the transposed matrix are the same as the columns of the
  # original matrix
  transposed_2d_array = number_2d_array.transpose
  max_product = max_quadruple_product_of_rows_of(transposed_2d_array)

  max_product
end

# Internal: Build an array in which each row is a forward diagonal of the
# provided array.  The forward diagonals are those constructed by stepping
# through the array left-to-right, top-to-bottom.
#
# number_2d_array - An array of arrays of numbers.  The length of all arrays
#                   should be the same.
#
# Examples
#
#   forward_diagonals_of([[1,2],
#                         [3,4]])
#   # => [[1,4], [3], [2]]
#
# Returns the built array.
def forward_diagonals_of number_2d_array
  length = number_2d_array.length

  result = []
  (0...length).each do |column|
    num_diagonals = length - column
    (0...num_diagonals).each do |starting_row|
      diagonal = []
      total_steps = length - [starting_row, column].max
      (0...total_steps).each do |step|
          diagonal.push number_2d_array[starting_row + step][column + step]
      end
      result.push diagonal
    end
  end

  result
end

# Internal: Build an array in which each row is a backward diagonal of the
# provided array.  Backward diagonals are those constructed by stepping
# through the array right-to-left, top-to-bottom.
#
# number_2d_array - An array of arrays of numbers.  The length of all arrays
#                   should be the same.
#
# Examples
#
#   backward_diagonals_of([[1,2],
#                          [3,4]])
#   # => [[2,3], [1], [4]]
#
#   # Equivalent to forward_diagonals_of([[2,1],
#   #                                     [4,3]])
#
# Returns the built array.
def backward_diagonals_of(number_2d_array)
  # Transpose, reverse, then transpose again to get a 2-d array whose rows are
  # reversed relative to the same row of the original
  new_array = number_2d_array.transpose.reverse.transpose

  forward_diagonals_of(new_array)
end

# Internal: Take an array and find the maximum product of 4 adjacent values in
# any forward diagonal.  See forward_diagonals_of for definition.
#
# number_2d_array - An array of arrays of numbers.  The length of all arrays
#                   should be the same.
#
# Returns the maximum as a number.
def max_quadruple_product_of_forward_diagonals_of(number_2d_array)
  max_product = 0

  # Build an array in which each row is a forward diagonal of number_2d_array
  forward_diagonals = forward_diagonals_of(number_2d_array)
  max_product = max_quadruple_product_of_rows_of(forward_diagonals)

  max_product
end

# Internal: Take an array and find the maximum product of 4 adjacent values in
# any backward diagonal.  See backward_diagonals_of for definition.
#
# number_2d_array - An array of arrays of numbers.  The length of all arrays
#                   should be the same.
#
# Returns the maximum as a number.
def max_quadruple_product_of_backward_diagonals_of(number_2d_array)
  max_product = 0

  # Build an array in which each row is a backward diagonal of number_2d_array
  backward_diagonals = backward_diagonals_of(number_2d_array)
  max_product = max_quadruple_product_of_rows_of(backward_diagonals)

  max_product
end

# =============================  General Solution ==============================
#
# Treat each row, column and diagonal greater than 4 as a sequence, pass each
# sequence into a checker.  The checker will find the max product of 4 adjacent
# sequence members.
#
# Since we only care about the max, track only the largest seen so far
#
puts "Given the input:"
puts input_as_array.to_s

result = [max_quadruple_product_of_rows_of(input_as_array),
          max_quadruple_product_of_columns_of(input_as_array),
          max_quadruple_product_of_forward_diagonals_of(input_as_array),
          max_quadruple_product_of_backward_diagonals_of(input_as_array)].max

puts "The maximum product of an adjacent quadruplet is: #{result}"
