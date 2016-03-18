class Palindromes
  attr_reader :range, :max_factor, :min_factor

  def initialize(options)
    if options[:min_factor] == nil
      options[:min_factor] = 1
    end
    @range = options[:min_factor]..options[:max_factor]
  end

  def generate
    products = []
    range.each do |x|
      range.each do |y|
        products << x * y
      end
    end
    products.select { |product| product.to_s.reverse == product.to_s }
  end

  def largest
    Palindrome.new(generate.sort.last, range)
  end

  def smallest
    Palindrome.new(generate.first, range)
  end
end

class Palindrome
  attr_reader :value, :range

  def initialize(value, range)
    @value = value
    @range = range
  end

  def factors
    factors = range.select { |possible_product| value % possible_product == 0 }
    factors.select { |product| range.include? (value / product)}.map do |factor|
      [factor, value / factor].sort
    end.uniq
  end
end
