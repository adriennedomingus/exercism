VERSION = 1

class Squares

  def initialize(number)
    @number = number
  end

  def square_of_sums(number = @number)
    sum = 0
    while number > 0
      sum += number
      number -= 1
    end
    sum ** 2
  end

  def sum_of_squares(number = @number)
    squares = 0
    while number > 0
      squares += number ** 2
      number -= 1
    end
    squares
  end

  def difference
    square_of_sums - sum_of_squares
  end
end
