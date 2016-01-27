class PhoneNumber
  attr_reader :number

  VALID_CHARACTERS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

  def initialize(number)
    @number = clean_nubmer(number)
  end

  def clean_nubmer(number)
    number.gsub!(/\W/, "")
    if number.chars.any? { |digit| !VALID_CHARACTERS.include?(digit) }
      '0000000000'
    elsif number.length == 11 && number.start_with?("1")
      number.chars[1..-1].join
    elsif number.length != 10
      '0000000000'
    else
      number
    end
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..-1]}"
  end
end
