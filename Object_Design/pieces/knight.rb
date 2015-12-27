WHITE_KNIGHT = "\u2658".encode('utf-8')
BLACK_KNIGHT = "\u265E".encode('utf-8')

class Knight < Piece
  def initialize(color, pos)
    @color = color
    @pos = pos
    if @color == :black
      @symbol = BLACK_KNIGHT
    else
      @symbol = WHITE_KNIGHT
    end
  end
  
  def possible_moves(board)
    row, col = @pos
    @diffs = [[row + 2, col - 1], [row + 2, col + 1], [row + 1, col - 2], [row + 1, col + 2],
             [row - 2, col - 1], [row - 2, col + 1], [row - 1, col - 2], [row - 1, col + 2]]
  end
end
