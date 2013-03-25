# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

def is_palindrome? number
  num_string = number.to_s
    counter = num_string.length / 2

    palindromic = true
    counter.times {|n| palindromic &&= ( num_string[n] == num_string[-n-1])}

  palindromic
end

range = 100..999

largest = 0

range.each { |n|
  range.each { |m|
    num = m * n
    largest = num if is_palindrome?(num) && num > largest
    #puts "n: #{n}, m: #{m}" if num == 906609

  }

}

puts "Largest palindrome composite is #{largest}"
