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

  def promote(board)
    row, col = @pos
    if (@color == :black && row == 0) || (@color == :white && row == 7)
      board[@pos] = Queen.new(@color, @pos)
    end    
  end

  def possible_moves(board)
    row, col = @pos
    if @color == :black
      @diffs = [[row + 1, col], [row + 1, col + 1], [row + 1, col - 1]]
      if @first && board[[row + 1, col]].color != @color
        @diffs += [row + 2, col]
      end
    else
      @diffs = [[row - 1, col], [row - 1, col + 1], [row - 1, col - 1]]
      if @first && board[[row - 1, col]].color != @color
        @diffs += [row - 2, col]
      end
    end
    @diffs.each do |space|
      if board[space].color == @color
  #      @diffs.delete(space)
      end
    end
    @diffs
  end
end
