class Piece
  attr_reader :symbol, :color
  attr_accessor :row, :col
  
  def initialize(symbol, color, row, col)
    @symbol = symbol
    @color = color
    @row = row
    @col = col
  end
end

module Stepable
  def moves(board)
    @diffs.each do |space|
      space.each do |coord|
        if coord > 7 || coord < 0 #|| board.grid.include?(space)
          diffs.delete(space)
        end
      end
    end
    @diffs
  end
end
