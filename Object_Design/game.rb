require_relative 'board.rb'
require_relative 'pieces.rb'
require_relative 'player.rb'

class Game
  def initialize(board)
    get_players
    @current_player = @player1
    @waiting_player = @player2
    @board = board
  end

  def get_players
    print "\nPlease enter Player 1's name: "
    name = gets.chomp
    puts "Player 1's color is black"
    @player1 = Player.new(name, :black)
    print "Please enter Player 2's name: "
    name = gets.chomp
    puts "Player 2's color is white"
    @player2 = Player.new(name, :white)
  end
  
  def valid_from?(from)
    row, col = from
    if row > 8 || col > 8 || row < 1 || col < 1
      puts "INVALID: Row or Column outside of bounds."
      return false
    elsif @board[from].color != @current_player.color
      puts "INVALID: Piece is incorrect color."
      return false
    end
    true
  end 

  def valid_to?(from, to)
    row, col = to
    piece = @board[from]
    if piece.possible_moves.include?([row - 1, col - 1])
      return true
    else
      puts "INVALID: move not possible."
      false
    end
  end

  def play
    while !@board.check?(@current_player.color) || !@board.checkmate?(@current_player.color)
      @board.display
      from = @current_player.get_from
      while !valid_from?(from)
        pos = @current_player.get_from
      end
      to = @current_player.get_to
      while !valid_to?(from, to)
        pos = @current_player.get_to
      end
      @board[from] = @board[to]
      @board.clear_space(from)
    end
  end
end

board = Board.new
game = Game.new(board)
game.play
