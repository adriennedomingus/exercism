class Queens
  attr_reader :white, :black

  def initialize(positions = {white: [0, 3], black: [7, 3] })
    raise ArgumentError if positions[:white] == positions[:black]
    @white = positions[:white]
    @black = positions[:black]
  end

  def to_s
    set_board.map do |row|
      row.join(" ")
    end.join("\n")
  end

  def set_board
    board = []
    8.times do
      board << ["_", "_", "_", "_", "_", "_", "_", "_"]
    end
    board[white[0]][white[1]] = "W"
    board[black[0]][black[1]] = "B"
    board
  end

  def attack?
    row? || column? || diagonal?
  end

  def column?
    white[1] == black[1]
  end

  def row?
    white[0] == black[0]
  end

  def diagonal?
    (white[0] - black[0]).abs == (white[1] - black[1]).abs
  end
end
