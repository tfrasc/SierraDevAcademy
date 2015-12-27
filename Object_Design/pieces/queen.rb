WHITE_QUEEN = "\u2655".encode('utf-8')
BLACK_QUEEN = "\u265B".encode('utf-8')

class Queen < Piece

  def initialize(color, pos)
    @color = color
    @pos = pos
    if @color == :black
      @symbol = BLACK_QUEEN
    else
      @symbol = WHITE_QUEEN
    end
  end
  
  def possible_moves(board)
    i = 1
    row, col = @pos
    @diffs = []
    while i < 8
      @diffs.push([row + i, col], [row - i, col], [row, col + i], [row, col - i])
      @diffs.push([row + i, col + i], [row + i, col - i], [row - i, col + i], [row - i, col - i])
      i += 1
    end
    @diffs
  end
end
