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

  def saddle_points
    saddle_points = []
    rows.each_with_index do |row, x|
      row.each_with_index do |item, y|
        saddle_points << [x, y] if saddle_point?(item, x, y)
      end
    end
    saddle_points
  end

  def saddle_point?(item, x, y)
    item == rows[x].max && item == columns[y].min
  end
end
