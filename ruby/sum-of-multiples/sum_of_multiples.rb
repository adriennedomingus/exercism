class SumOfMultiples

  def initialize(*args)
    @args = args
  end

  def self.to(number)
    range = (0..number - 1).to_a
    multiples = range.select do |num|
      num % 3 == 0 || num % 5 == 0
    end
    multiples.reduce(:+)
  end

  def to(number)
    range = (0..number - 1).to_a
    multiples = range.select do |num|
      @args.any? { |arg| num % arg == 0}
    end
    multiples.reduce(:+)
  end
end
