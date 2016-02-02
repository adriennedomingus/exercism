VERSION = 1

  class Squares

    attr_reader :numbers

    def initialize(number)
      @numbers = 0.upto(number)
    end

    def square_of_sums
      numbers.reduce(:+) ** 2
    end

    def sum_of_squares
      numbers.map { |number| number ** 2 }.reduce(:+)
    end

    def difference
      square_of_sums - sum_of_squares
    end
  end
