WHITE_PAWN = "\u2659".encode('utf-8')
BLACK_PAWN = "\u265F".encode('utf-8')

class Pawn < Piece
  @first = true

  def initialize(color, pos)
    @color = color
    @pos = pos
    if @color == :black
      @symbol = BLACK_PAWN
    else
      @symbol = WHITE_PAWN
    end
  end

  def promote
    #make piece a Queen
  end

  def possible_moves
    row, col = @pos
    if @color == :black
      @diffs = [[row + 1, col], [row + 1, col + 1], [row + 1, col - 1]]
      if @first
        @diffs += [row + 2, col]
      end
    else
      @diffs = [[row - 1, col], [row - 1, col + 1], [row - 1, col - 1]]
      if @first
        @diffs += [row - 2, col]
      end
    end
    moves
    @diffs
  end
end
