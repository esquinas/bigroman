class Roman
  ROMAN_TO_ARAB = { M: 1000,
                    CM: 900,
                    D:  500,
                    CD: 400,
                    C:  100,
                    XC:  90,
                    L:   50,
                    XL:  40,
                    X:   10,
                    IX:   9,
                    V:    5,
                    IV:   4,
                    I:    1 }

  BIG_ROMAN_TO_ARAB = { "\u033F\u0333" => 1000**4, # Combining double over + double low line
                        "\u033F\u0332" => 1000**3, # Combining double over + low line
                        "\u0305\u0332" => 1000**2, # Combining over + low line
                        "\u0305" => 1000 } #  Combining over line

  def to_roman(number)
    number = number.to_i
    if number == 0
      return ''
    elsif number < 5000
      number = number
    elsif number >= 5*10**15
      raise ArgumentError, "Number '#{number}' is too big for roman numerals"
    else
      return big_roman(number)
    end
    memo = ''
    ROMAN_TO_ARAB.each_pair do |roman_letter, value|
      memo += "#{roman_letter.to_s * (number / value)}"
      number %= value
    end
    memo
  end

  def big_roman(number)
    memo = ''
    num = number
    BIG_ROMAN_TO_ARAB.each_pair do |combining_chr, factor|
      memo += combine(to_roman(num / factor), combining_chr.to_s)
      num = num % factor
    end
    memo += to_roman(num)
    memo
  end

  def combine(str, combining_chr)
    str.chars.inject('') { |memo, chr| memo + chr + combining_chr }
  end
end