require_relative 'piece.rb'

class Bishop < Piece
  def possible_moves
    i = 1
    @diffs = []
    while i < 8
      @diffs.push([row + i, col + i], [row + i, col - i], [row - i, col + i], [row - i, col - i])
      i += 1
    end
    @diffs
  end
end
