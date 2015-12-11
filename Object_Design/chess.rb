#colorize
#chess unicode
BLACK_SQUARE = "\u25A1".encode('utf-8')
WHITE_SQUARE = "\u25A0".encode('utf-8')
WHITE_KING = "\u2654".encode('utf-8')
BLACK_KING = "\u265A".encode('utf-8')
WHITE_QUEEN = "\u2655".encode('utf-8')
BLACK_QUEEN = "\u265B".encode('utf-8')
WHITE_ROOK = "\u2656".encode('utf-8')
BLACK_ROOK = "\u265C".encode('utf-8')
WHITE_BISHOP = "\u2657".encode('utf-8')
BLACK_BISHOP = "\u265D".encode('utf-8')
WHITE_KNIGHT = "\u2658".encode('utf-8')
BLACK_KNIGHT = "\u265E".encode('utf-8')
WHITE_PAWN = "\u2659".encode('utf-8')
BLACK_PAWN = "\u265F".encode('utf-8')

class Game
  def initialize(player1, player2, board)
    @player1 = player1
    @current_player = player1
    @player2 = player2
    @board = board
  end

  def play
    while !board.check? || !board.checkmate?

    end
  end
end

class Board
  def initialize
    @grid = []
    set_grid
  end

  def set_grid
    i, j = 0, 0
    current_char = BLACK_SQUARE
    next_char = WHITE_SQUARE
    while i < 8
      @grid.push([])
      while j < 8
        @grid[i].push(current_char)
      j += 1
      current_char, next_char = next_char, current_char
      end
    current_char, next_char = next_char, current_char
    j = 0
    i += 1
    end
  end

  def display
    i, j = 0, 0
    puts "\n  1 2 3 4 5 6 7 8"
    @grid.each do |row|
      print i
      row.each do |col|
        print " #{col}"
        j += 1
      end
      puts
      j = 0
      i += 1
    end
    puts "\n"
  end

  def check?
    #here or on piece moves?
  end

  def checkmate?
    #here or on piece moves?
  end
end

class Player
  def initialize(name, color)
    @name = name
    @color = color
  end
end

class Piece
  def initialize(symbol, color, row, col)
    @symbol = symbol
    @color = color
    @row = row
    @col = col
  end
end

module Stepable
  def moves

  end
end

class Pawn < Piece
  include Stepable

  def promote
    #make piece a Queen
  end

  def possible_moves

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

player1 = Player.new("Tyler", "Black")
player2 = Player.new("Pancho", "Turqoise")
board = Board.new

game = Game.new(player1, player2, board)

board.display