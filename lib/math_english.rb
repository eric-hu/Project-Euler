
def count_letters string
  string.delete(' ').length
end

# number_to_words
#
# Supports number conversion up to one thousand, inclusive
def number_to_words num
  if num > 1000
    raise NumberTooLargeError
    return
  end

  result = join_with_necessary_spacing(parse_thousands(num), parse_hundreds(num))
  result = english_and_rule(result, parse_tens_and_ones(num))

  return result
end

class NumberTooLargeError < StandardError
end

# =============================  Internal Methods ==============================
private

# Only parses 1000, since that's all we care about for problem 17
def parse_thousands num
  if num / 1000 == 1
    "one thousand"
  else
    ""
  end
end

def parse_hundreds num
  hundreds_digit = (num % 1000) / 100
  return "" if hundreds_digit == 0

  number_index[hundreds_digit] + " hundred"
end

def parse_tens_and_ones num
  tens_and_ones_digits = num % 100
  if tens_and_ones_digits > 20
    tens_digit = tens_and_ones_digits / 10
    ones_digit = tens_and_ones_digits % 10

    result = "" + number_index[tens_digit * 10]
    result += " " + number_index[ones_digit] unless ones_digit == 0
  else
    result = number_index[tens_and_ones_digits]
  end

  result
end

def english_and_rule above_hundred_words, tens_and_ones_words
  return tens_and_ones_words if above_hundred_words.length == 0
  return above_hundred_words if tens_and_ones_words == "zero"

  return above_hundred_words + " and " + tens_and_ones_words
end

def join_with_necessary_spacing num_in_words1, num_in_words2
  return num_in_words1 if num_in_words2 == ""
  return num_in_words2 if num_in_words1 == ""

  num_in_words1 + " " + num_in_words2
end

def number_index
  {0 => "zero",
   1 => "one",
   2 => "two",
   3 => "three",
   4 => "four",
   5 => "five",
   6 => "six",
   7 => "seven",
   8 => "eight",
   9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen",
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety"
  }
end
