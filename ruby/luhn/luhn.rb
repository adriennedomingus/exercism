class Luhn
  attr_reader :number

  def initialize(number)
    @number = number.to_s.split("")
  end

  def integer_chars(number)
    number.to_s.split("")
  end

  def addends
    removed = number.shift.to_i if number.length.odd?
    split = number.map.with_index do |digit, index|
      index.even? ? double_and_reduce(digit) : digit.to_i
    end
    split.unshift(removed) if removed
    split
  end

  def double_and_reduce(digit)
    if digit.to_i * 2 > 9
      digit.to_i * 2 - 9
    else
      digit.to_i * 2
    end
  end

  def checksum
    addends.reduce(0, :+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(invalid_number)
    num = invalid_number.to_s.split("")
    (0..9).each do |option|
      new_num = num.push(option.to_s)
      if new(integer(new_num)).valid?
        return integer(num)
      end
      num.pop
    end
  end

  def self.integer(num)
    num.join("").to_i
  end
end
