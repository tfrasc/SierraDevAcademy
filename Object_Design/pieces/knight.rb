class Knight < Piece
  def possible_moves
    @diffs = [[row + 2, col - 1], [row + 2, col + 1], [row + 1, col - 2], [row + 1, col + 2]]
                  + [[row - 2, col - 1], [row - 2, col + 1], [row - 1, col - 2], [row - 1, col + 2]]
  end
end
