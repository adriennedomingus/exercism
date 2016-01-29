class Trinary
  attr_reader :number

  VALID_SYMBOLS = ['0', '1', '2']

  def initialize(number)
    @number = number
  end

  def to_decimal
    exponent = number.length
    if invalid_input
      0
    else
      number.chars.map do |character|
        exponent -= 1
        character.to_i * (3 ** exponent)
      end.reduce(:+)
    end
  end

  def invalid_input
    number.chars.any? { |digit| !VALID_SYMBOLS.include?(digit) }
  end
end
