class Fixnum

  VERSION = 1

  def to_roman
    arabic_number = self
    roman_numeral = ""
    ARABIC.each do |arabic, roman|
      while arabic_number >= arabic
        roman_numeral << roman
        arabic_number -= arabic
      end
    end
    roman_numeral
  end

    ARABIC = {
      1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
    }
end
