WHITE_ROOK = "\u2656".encode('utf-8')
BLACK_ROOK = "\u265C".encode('utf-8')

class Rook < Piece
  def initialize(color, pos)
    @color = color
    @pos = pos
    if @color == :black
      @symbol = BLACK_ROOK
    else
      @symbol = WHITE_ROOK
    end
  end
  
  def possible_moves
    i = 1
    row, col = @pos
    @diffs = []
    while i < 8
      @diffs.push([row + i, col], [row - i, col], [row, col + i], [row, col - i])
      i += 1
    end
    @diffs
  end
end
