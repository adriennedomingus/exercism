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
      mapped = in_threes.map do |section|
        hundreds(section.join.to_i)
      end
      with_delimeter = mapped.map.with_index do |section, index|
        if section != ""
          "#{section} #{DELIMETERS[index]}"
        end
      end
      with_delimeter.delete_if { |char| char == " " || char == nil}.reverse.join(" ").rstrip
    end
  end

  def hundreds(numb)
    if numb == 000
      ""
    elsif SMALL_NUMBERS[numb]
      SMALL_NUMBERS[numb]
    elsif TENS[numb]
      TENS[numb]
    elsif numb < 100
      tens(numb)
    else
      num = []
      split = numb.to_s.chars
      num.unshift(SMALL_NUMBERS[split[0].to_i])
      num << "hundred"
      num << tens(split[1..-1].join.to_i)
      num.delete_if { |char| char == ""}.join(" ")
    end
  end

  def tens(numb)
    if numb == 00
      ""
    elsif TENS[numb]
      TENS[numb]
    else
      split = numb.to_s.chars
      num = []
      num << SMALL_NUMBERS[split[-1].to_i]
      split[-1] = "0"
      split = split.join.to_i
      num.unshift(TENS[split]).join("-")
    end
  end
end
