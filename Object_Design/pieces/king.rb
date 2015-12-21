class King < Piece
  def possible_moves
    @diffs = [[row - 1, col], [row - 1, col + 1], [row - 1, col - 1], [row, col - 1]]
          +  [[row + 1, col], [row + 1, col + 1], [row + 1, col - 1], [row, col + 1]]
  end
end
