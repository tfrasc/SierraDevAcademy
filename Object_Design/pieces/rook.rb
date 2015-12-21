class Rook < Piece
  def possible_moves
    i = 1
    @diffs = []
    while i < 8
      @diffs.push([row + i, col], [row - i, col], [row, col + i], [row, col - i])
      i += 1
    end
    @diffs
  end
end
