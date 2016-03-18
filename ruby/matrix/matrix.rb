class Matrix
  attr_reader :matrix_string

  def initialize(matrix_string)
    @matrix_string = matrix_string
  end

  def rows
    matrix_string.split("\n").map do |row|
      row.split(" ").map(&:to_i)
    end
  end

  def columns
    rows.transpose
  end
end
