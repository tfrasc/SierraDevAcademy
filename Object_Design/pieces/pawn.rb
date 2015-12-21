class Pawn < Piece
  include Stepable
  @first = true

  def promote
    #make piece a Queen
  end

  def possible_moves
    if @color == "BLACK"
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
    @diffs
  end
end
