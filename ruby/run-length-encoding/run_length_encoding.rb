class RunLengthEncoding
  def self.encode(input)
    result = []
    input.chars.each do |character|
      if result.last != character
        result << 1
        result << character
      else
        result[-2] += 1
      end
    end
    result.delete(1)
    result.join
  end

  def self.decode(input)
    parsed = format_string_for_decoding(input)
    output = ""
    parsed.each_with_index do |element, index|
      if element.class == Fixnum
        output << parsed[index + 1] * (element.to_i - 1)
      else
        output << element
      end
    end
    output
  end

  def self.format_string_for_decoding(input)
    parsed = []
    split = input.chars
    split.each_with_index do |element, index|
      if element.to_i != 0 && split[index + 1].to_i != 0
        parsed << "#{element}#{split[index + 1]}".to_i
        split.delete_at(index + 1)
      elsif element.to_i != 0
        parsed << element.to_i
      else
        parsed << element
      end
    end
    parsed
  end
end

module BookKeeping
  VERSION = 2
end
