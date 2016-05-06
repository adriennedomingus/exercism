class Board

  VALID = [" ", "*", "+", "-", "|"]

  def self.transform(starting_board)
    if valid_board?(starting_board)
      transform_board(starting_board)
    else
      raise ValueError
    end
  end

  def self.transform_board(starting_board)
    split(starting_board).map.with_index do |row, row_index|
      row.map.with_index do |space, space_index|
        space == " " ? count_mines(starting_board, row, row_index, space, space_index) : space
      end.join("")
    end
  end

  def self.count_mines(starting_board, row, row_index, space, space_index)
    bordering_units = [row[space_index - 1], row[space_index + 1], starting_board[row_index - 1][space_index], starting_board[row_index + 1][space_index], starting_board[row_index + 1][space_index - 1], starting_board[row_index + 1][space_index + 1], starting_board[row_index - 1][space_index - 1], starting_board[row_index - 1][space_index + 1]]
    count = bordering_units.select { |unit| unit == "*" }.count
    count == 0 ? space : count
  end

  def self.split(starting_board)
    starting_board.map { |row| row.chars }
  end

  def self.valid_board?(starting_board)
    all_lines_same_length?(starting_board) && all_valid_characters?(starting_board) && valid_border?(starting_board)
  end

  def self.all_lines_same_length?(starting_board)
    starting_board.all? { |row| row.length == starting_board[0].length }
  end

  def self.all_valid_characters?(starting_board)
    starting_board.flatten.join("").chars.all? { |val| VALID.include?(val) }
  end

  def self.valid_border?(starting_board)
    starting_board[0].match(Regexp.new(/[+]-*[+]/)) && starting_board[-1].match(Regexp.new(/[+]-*[+]/))\
  end
end

class ValueError < StandardError
end
