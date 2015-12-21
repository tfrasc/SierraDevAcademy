require_relative 'board.rb'
require_relative 'pieces.rb'
require_relative 'player.rb'

#colorize
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
    puts "Player 2's color is White"
    @player2 = Player.new(name, "White")
  end
  
  def get_piece
    puts "#{@current_player.name}, please choose a #{@current_player.color} piece to move."
    print "Row: "
    @piece_row = gets.chomp.to_i
    print "Column: "
    @piece_col = gets.chomp.to_i
    while !valid_piece?
      print "Row: "
      @piece_row = gets.chomp.to_i
      print "Column: "
      @piece_col = gets.chomp.to_i  
    end
  end
  
  def valid_piece?
    if @piece_row > 8 || @piece_col > 8 || @piece_row < 1 || @piece_col < 1
      puts "INVALID: Row or Column outside of bounds."
      return false
    elsif @board[@piece_row - 1, @piece_col - 1].color != @current_player.color
      puts "INVALID: Piece is incorrect color."
      return false
    end
    true
  end 
  
  def get_move
    puts "#{@current_player.name}, please choose a space to move your piece to."
    print "Row: "
    @move_row = gets.chomp.to_i
    print "Column: "
    @move_col = gets.chomp.to_i
    while !valid_move?
      print "Row: "
      @move_row = gets.chomp.to_i
      print "Column: "
      @move_col = gets.chomp.to_i
    end
    @board[@move_row - 1, @move_col - 1] = @board[@piece_row - 1, @piece_col - 1]
    @board.clear_space(@piece_row - 1, @piece_col - 1)
  end

  def valid_move?
    piece = @board[@piece_row - 1, @piece_col - 1]
    if piece.possible_moves.include?([@move_row - 1, @move_col - 1])
      return true
    else
      puts "INVALID: move invalid"
      false
    end
  end

  def play
    while !@board.check? || !@board.checkmate?
      @board.display
      get_piece
      get_move
    end
  end
end

board = Board.new
game = Game.new(board)
game.play
