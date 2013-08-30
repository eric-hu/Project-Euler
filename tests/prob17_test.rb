# Switch to Minitest for this test suite, pragmatism ftw
require 'minitest/autorun'

require_relative '../lib/math_english'


describe "number_to_words" do
  it "should convert 1000 correctly" do
    number_to_words(1000).must_equal "one thousand"
  end

  it "should convert one digit numbers correctly" do
    number_to_words(1).must_equal "one"
    number_to_words(2).must_equal "two"
    number_to_words(5).must_equal "five"
    number_to_words(9).must_equal "nine"
  end

  it "should convert two digit numbers correctly" do
    number_to_words(10).must_equal "ten"
    number_to_words(11).must_equal "eleven"
    number_to_words(15).must_equal "fifteen"
    number_to_words(35).must_equal "thirty five"
    number_to_words(50).must_equal "fifty"
    number_to_words(91).must_equal "ninety one"
  end

  it "should insert 'and's for numbers above one hundred with a nonzero ones or tens digit" do
    number_to_words(240).must_equal "two hundred and forty"
    number_to_words(999).must_equal "nine hundred and ninety nine"
  end

  it "should complain loudly if passed a number larger than 1000" do
    lambda{number_to_words(1001)}.must_raise NumberTooLargeError
  end
end

describe 'count_letters' do
  it "should only count the letters in a string" do
    count_letters('asdf asdf').must_equal 8
    count_letters('a df asdf').must_equal 7
    count_letters('a  f asdf').must_equal 6
  end
end
