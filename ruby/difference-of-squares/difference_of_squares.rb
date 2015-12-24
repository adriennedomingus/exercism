VERSION = 1

  class Squares

    def initialize(number)
      @numbers = 0.upto(number)
    end

    def square_of_sums
      sum = @numbers.reduce { |sum, number| sum + number}
      sum ** 2
    end

    def sum_of_squares
      squares = @numbers.reduce { |sum, number| sum + number ** 2}
      squares
    end

    def difference
      square_of_sums - sum_of_squares
    end
  end
