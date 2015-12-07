class Game
  def play

  end
end

class Board
  def initialize
    @spaces = []
  end

  def display

  end

  def check_for_mate
    #here or on piece moves?
  end

  def check_for_checkmate
    #here or on piece moves?
  end
end

class Player
  def initialize(name, color)
    @name = name
    @color = color
    #@king = [row][col] for check/checkmate?
  end
end

class Piece
  
  def initialize(symbol, color)
    @symbol = symbol
    @color = color
  end
end

class Pawn < Piece
  def promote
    #make piece a Queen
  end

  def first_move
    #choose 1 or 2 spaces
  end
end

class Knight < Piece

end

class King < Piece

end

class Queen < Piece

end

class Rook < Piece

end

class Bishop < Piece

end
