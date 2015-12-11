require_relative 'board.rb'
require_relative 'pieces.rb'
require_relative 'player.rb'

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
  def initialize(board)
    get_players
    @current_player = @player1
    @board = board
  end

  def get_players
    print "\nPlease enter Player 1's name: "
    name = gets.chomp
    puts "Player 1's color is Black"
    @player1 = Player.new(name, "Black")
    print "Please enter Player 2's name: "
    name = gets.chomp
    puts "Player 2's color is Black"
    @player2 = Player.new(name, "White")
  end

  def play
    while !board.check? || !board.checkmate?
      
    end
  end
end

board = Board.new
game = Game.new(board)

board.display
