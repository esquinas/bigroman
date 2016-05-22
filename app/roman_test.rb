#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'roman'

# Test data version:
# 6985644 Merge pull request #121 from mikeyjcat/add-roman-numerals

class RomanNumeralsTest < Minitest::Test
  def test_1
    assert_equal 'I', 1.to_roman
  end

  def test_2
    # skip
    assert_equal 'II', 2.to_roman
  end

  def test_3
    # skip
    assert_equal 'III', 3.to_roman
  end

  def test_4
    # skip
    assert_equal 'IV', 4.to_roman
  end

  def test_5
    # skip
    assert_equal 'V', 5.to_roman
  end

  def test_6
    # skip
    assert_equal 'VI', 6.to_roman
  end

  def test_9
    # skip
    assert_equal 'IX', 9.to_roman
  end

  def test_27
    # skip
    assert_equal 'XXVII', 27.to_roman
  end

  def test_48
    # skip
    assert_equal 'XLVIII', 48.to_roman
  end

  def test_59
    # skip
    assert_equal 'LIX', 59.to_roman
  end

  def test_93
    # skip
    assert_equal 'XCIII', 93.to_roman
  end

  def test_141
    # skip
    assert_equal 'CXLI', 141.to_roman
  end

  def test_163
    # skip
    assert_equal 'CLXIII', 163.to_roman
  end

  def test_402
    # skip
    assert_equal 'CDII', 402.to_roman
  end

  def test_575
    # skip
    assert_equal 'DLXXV', 575.to_roman
  end

  def test_911
    # skip
    assert_equal 'CMXI', 911.to_roman
  end

  def test_1024
    # skip
    assert_equal 'MXXIV', 1024.to_roman
  end

  def test_3000
    # skip
    assert_equal 'MMM', 3000.to_roman
  end

  def test_4000
    # skip
    assert_equal "MMMM", 4000.to_roman
  end

  def test_big_roman_5000
    # skip
    assert_equal "V\u0305", 5000.to_roman
  end

  def test_big_roman_5001
    # skip
    assert_equal "V\u0305I", 5001.to_roman
  end

  def test_big_roman_6911
    # skip
    assert_equal "V\u0305I\u0305CMXI", 6911.to_roman
  end

  def test_big_roman_10_000
    # skip
    assert_equal "X\u0305", 10_000.to_roman
  end

  def test_big_roman_30_000
    # skip
    assert_equal "X\u0305X\u0305X\u0305", 30_000.to_roman
  end

  def test_big_roman_one_million
    # skip
    assert_equal "I\u0305\u0332", 1_000_000.to_roman
  end

  def test_biggest_roman_ever
    # skip
    expected = "M\xCC\xBF\xCC\xB3M\xCC\xBF\xCC\xB3M\xCC\xBF\xCC\xB3" \
               "M\xCC\xBF\xCC\xB3C\xCC\xBF\xCC\xB3M\xCC\xBF\xCC\xB3" \
               "X\xCC\xBF\xCC\xB3C\xCC\xBF\xCC\xB3I\xCC\xBF\xCC\xB3" \
               "X\xCC\xBF\xCC\xB3C\xCC\xBF\xCC\xB2M\xCC\xBF\xCC\xB2" \
               "X\xCC\xBF\xCC\xB2C\xCC\xBF\xCC\xB2I\xCC\xBF\xCC\xB2" \
               "X\xCC\xBF\xCC\xB2C\xCC\x85\xCC\xB2M\xCC\x85\xCC\xB2" \
               "X\xCC\x85\xCC\xB2C\xCC\x85\xCC\xB2I\xCC\x85\xCC\xB2" \
               "X\xCC\x85\xCC\xB2C\xCC\x85M\xCC\x85X\xCC\x85C\xCC\x85" \
               "I\xCC\x85X\xCC\x85CMXCIX"
    assert_equal expected, ((5*10**15)-1).to_roman
  end

  def test_number_is_too_damn_big
    assert_raises ArgumentError do
      (5*10**15).to_roman
    end
  end


  # Don't forget to define a constant VERSION inside of Fixnum.
  def test_bookkeeping
    # skip
    assert_equal 1, Fixnum::VERSION
  end
end