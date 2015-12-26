WHITE_KING = "\u2654".encode('utf-8')
BLACK_KING = "\u265A".encode('utf-8')

class King < Piece

  def initialize(color, pos)
    @color = color
    @pos = pos
    if @color == :black
      @symbol = BLACK_KING
    else
      @symbol = WHITE_KING
    end
  end
  
  def possible_moves
    row, col = @pos
    @diffs = [[row - 1, col], [row - 1, col + 1], [row - 1, col - 1], [row, col - 1],
              [row + 1, col], [row + 1, col + 1], [row + 1, col - 1], [row, col + 1]]
  end
end
