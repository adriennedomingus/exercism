class Say

  TENS = {
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety'
  }

  SMALL_NUMBERS = {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',
  }

  DELIMETERS = ["", "thousand", "million", "billion"]

  attr_reader :number

  def initialize(number)
    @number = number
    if number < 0 || number > 999999999999
      raise ArgumentError
    end
  end

  def in_english
    if number == 0
      'zero'
    else
      in_threes = []
      split = number.to_s.chars
      until split.empty?
        in_threes << split.pop(3)
      end
      in_threes.map do |section|
        hundreds(section.join.to_i)
      end.map.with_index do |section, index|
        if section != ""
          "#{section} #{DELIMETERS[index]}"
        end
      end.delete_if { |char| char == " " || char == nil}.reverse.join(" ").rstrip
    end
  end

  def hundreds(number)
    if number == 000
      ""
    elsif SMALL_NUMBERS[number]
      SMALL_NUMBERS[number]
    elsif number < 100
      tens(number)
    else
      split = number.to_s.chars
      "#{SMALL_NUMBERS[split[0].to_i]} hundred #{tens(split[1..-1].join.to_i)}"
    end
  end

  def tens(number)
    unless number == 00
      if TENS[number]
        TENS[number]
      else
        english = [SMALL_NUMBERS[number.to_s.chars[-1].to_i]]
        english.unshift(TENS[((number / 10) * 10)]).join("-")
      end
    end
  end
end
