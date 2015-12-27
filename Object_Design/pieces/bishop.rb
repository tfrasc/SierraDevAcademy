require_relative 'piece.rb'

WHITE_BISHOP = "\u2657".encode('utf-8')
BLACK_BISHOP = "\u265D".encode('utf-8')

class Bishop < Piece
  def initialize(color, pos)
    @color = color
    @pos = pos
    if @color == :black
      @symbol = BLACK_BISHOP
    else
      @symbol = WHITE_BISHOP
    end
  end
  
  def possible_moves(board)
    i = 1
    row, col = @pos
    @diffs = []
    while i < 8 && board[[row + i, col + i]] != nil && board[[row + i, col + i]].color == :empty
      @diffs.push([row + i, col + i])
      i += 1
    end
    i = 1
    while i < 8 && board[[row + i, col - i]] != nil && board[[row + i, col - i]].color == :empty
      @diffs.push([row + i, col - i])
      i += 1
    end
    i = 1
    while i < 8 && board[[row - i, col + i]] != nil && board[[row - i, col + i]].color == :empty
      @diffs.push([row - i, col + i])
      i += 1
    end
    i = 1
    while i < 8 && board[[row - i, col - i]] != nil && board[[row - i, col - i]].color == :empty
      @diffs.push([row - i, col - i])
      i += 1
    end
    @diffs
  end
end
