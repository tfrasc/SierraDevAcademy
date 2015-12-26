BLACK_SQUARE = "\u25A1".encode('utf-8')
WHITE_SQUARE = "\u25A0".encode('utf-8')

class Piece
  attr_reader :symbol, :color
  attr_accessor :pos
  
  def initialize(color, pos)
    @color = color
    @pos = pos
    if @color == :black
      @symbol = BLACK_SQUARE
    else
      @symbol = WHITE_SQUARE
    end
  end

  def moves
    @diffs.each do |space|
      space.each do |coord|
        if coord > 7 || coord < 0
          @diffs.delete(space)
        end
      end
    end
    @diffs
  end
end
