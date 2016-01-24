class Binary
  VERSION = 1

  def initialize(number)
    @number = number
    raise ArgumentError if @number.chars.any? { |num| num != "0" && num != "1" }
  end

  def to_decimal
    characters = @number.chars.map! { |number| number.to_i }
    n = characters.length
    characters.map do |number|
      n -=1
      number * (2 ** n)
    end.reduce(:+)
  end
end
