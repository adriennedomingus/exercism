class Hexadecimal

  HEX_LETTERS = { 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15 }

  def initialize(hex_number)
    @hex_number = hex_number.chars
  end

  def to_decimal
    if @hex_number.any? { |digit| /[a-f0-9]/.match(digit.to_s) == nil }
      return 0
    end
    hex = map_letters_to_number
    hex.reverse.map.with_index do |number, index|
      number * (16 ** index)
    end.reduce(:+)
  end

  def map_letters_to_number
    @hex_number.map do |char|
      HEX_LETTERS.include?(char.upcase) ? HEX_LETTERS[char.upcase] : char.to_i
    end
  end
end
