class Pawn < Piece
  include Stepable
  @first = true

  def promote
    #make piece a Queen
  end

  def possible_moves
    @diffs = [[row - 1, col], [row - 2, col], [row - 1, col + 1], [row - 1, row - 1]]
          +  [[row + 1, col], [row + 2, col], [row + 1, col + 1], [row + 1, row - 1]]
  end
end
