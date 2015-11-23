require 'yaml'

class Board
  attr_accessor :squares, :cats
  
  def initialize
    @squares = []
    @cats = false
    setSquares
  end
  
  def setSquares
    i = 0
    while i < 3
      @squares[i] = [" ", " ", " "]
      i += 1
    end
  end
  
  def playSquare(row, col, symbol)
    if @squares[row - 1][col - 1] == " "
      @squares[row - 1][col - 1] = symbol
      true
    else
      puts "\nINVALID: Square already filled, choose a new one"
      false
    end
  end
    
  def showBoard
    i, j = 0, 0
    puts
    while i < 3
      while j < 3
        print "  ", @squares[i][j], "  "
        if j < 2
          print "|"
        end
        j += 1
      end        
      if i < 2
        puts "\n------------------"
      end
      i += 1
      j = 0
    end
    puts "\n\n"
  end

  def checkForWin
    win = false
    win = threeInARow
    if !win
      win = catsGame
    end
    win
  end

  def catsGame
    i, j = 0, 0
    full = true
    while i < 3
      while j < 3
        if @squares[i][j] == " "
          full = false
        end
        j += 1
      end
      j = 0
      i += 1
    end
    if full 
      showBoard
      puts "Board full, Cat's Game!\n\n"
      @cats = true
      return full
    end
    false
  end

  def threeInARow
    i = 0
    while i < 3
      #three down
      if @squares[0][i] == @squares[1][i] and @squares[0][i] == @squares[2][i] and @squares[0][i] != " "
        showBoard
        puts "Three in a row in column #{i + 1}!"
        return true
      #three across
      elsif @squares[i][0] == @squares[i][1] and @squares[i][0] == @squares[i][2] and @squares[i][0] != " "
        showBoard
        puts "Three in a row in row #{i + 1}!"
        return true
      #diagonal down right
      elsif @squares[0][0] == @squares[1][1] and @squares[0][0] == @squares[2][2] and @squares[0][0] != " "
        showBoard
        puts "Three in a row down right diagonal!"
        return true
      #diagonal down left
      elsif @squares[0][2] == @squares[1][1] and @squares[0][2] == @squares[2][0] and @squares[0][2] != " "
        showBoard
        puts "Three in a row down left diagonal!"
        return true
      end
      i += 1
    end
    false
  end
end

class Player
  attr_reader :number
  attr_accessor :symbol

  def initialize(symbol, number)
    @symbol = symbol
    @number = number
  end
end

class Computer
  attr_reader :number
  attr_accessor :symbol, :row, :col

  def initialize(symbol, number)
    @symbol = symbol
    @number = number
    @row = 0
    @col = 0
  end

  def defense(squares)
    i, j = 0, 0
    move = false
    move = rowDefense(squares)
    if !move
      move = colDefense(squares)
    end
    if !move
      move = diagDefense(squares)
    end
    if !move
      while i < 3
        while j < 3
          if squares[i][j] == " "
            @row = i
            @col = j
            break
          end
        j += 1
        end
      i += 1
      j = 0
      end
    end
  end

  def rowDefense(squares)
    i = 0
    while i < 3
      #col 3 is vulnerable
      if squares[i][0] == squares[i][1] and squares[i][2] == " " and squares[i][0] != " " and squares[i][0] != @symbol
        @row = i
        @col = 2
        return true
      #col 2 is vulnerable
      elsif squares[i][0] == squares[i][2] and squares[i][1] == " " and squares[i][0] != " " and squares[i][0] != @symbol
        @row = i
        @col = 1
        return true
      #col 1 is vulnerable
      elsif squares[i][1] == squares[i][2] and squares[i][0] == " " and squares[i][1] != " " and squares[i][1] != @symbol
        @row = i
        @col = 0
        return true
      end
    i += 1
    end
    false
  end

  def colDefense(squares)
    i = 0
    while i < 3
      #row 3 is vulnerable
      if squares[0][i] == squares[1][i] and squares[2][i] == " " and squares[0][i] != " " and squares[0][i] != @symbol
        @row = 2
        @col = i
        return true
      #row 2 is vulnerable
      elsif squares[0][i] == squares[2][i] and squares[1][i] == " " and squares[0][i] != " " and squares[0][i] != @symbol
        @row = 1
        @col = i
        return true
      #row 1 is vulnerable
      elsif squares[1][i] == squares[2][i] and squares[0][i] == " " and squares[1][i] != " " and squares[1][i] != @symbol
        @row = 0
        @col = i
        return true
      end
    i += 1
    end
    false
  end

  def diagDefense(squares)
    #top left is vulnerable
    if squares[1][1] == squares[2][2] and squares[0][0] == " " and squares[1][1] != " " and squares[1][1] != @symbol
      @row = 0
      @col = 0
      return true
    #middle is vulnerable (left diag)
    elsif squares[0][0] == squares[2][2] and squares[1][1] == " " and squares[0][0] != " " and squares[0][0] != @symbol
      @row = 1
      @col = 1
      return true
    #bottom right is vulnerable
    elsif squares[0][0] == squares[1][1] and squares[2][2] == " " and squares[0][0] != " " and squares[0][0] != @symbol
      @row = 2
      @col = 2
      return true
    #top right is vulernable
    elsif squares[1][1] == squares[2][0] and squares[0][2] == " " and squares[1][1] != " " and squares[1][1] != @symbol
      @row = 0
      @col = 2
      return true
    #middle is vulnerable (right diag)
    elsif squares[0][2] == squares[2][0] and squares[1][1] == " " and squares[0][2] != " " and squares[0][2] != @symbol
      @row = 1
      @col = 1
      return true
    #bottom left is vulnerable
    elsif squares[0][2] == squares[1][1] and squares[2][0] == " " and squares[0][2] != " " and squares[0][2] != @symbol
      @row = 2
      @col = 0
      return true
    end
    false
  end
end

board = Board.new

puts "\n\nTyler's TicTacToe\n================="

#attempt to load file
print "\nLoad file? 'Y' or 'N': "
loaded = gets.chomp.upcase
while loaded != "Y" and loaded != "N"
  print "INVALID: Load file? 'Y' or 'N': "
  loaded = gets.chomp.upcase
end
if loaded == "Y"
  data = YAML.load_file('ttt.yml')
  if data['currentPlayer'] != nil
    board = data['board']
    currentPlayer = data['currentPlayer']
    waitingPlayer = data['waitingPlayer']
    puts "\nLOADED\n"
    puts "\nCurrent Players's symbol is '#{currentPlayer.symbol}'"
    puts "\nWaiting Players's symbol is '#{waitingPlayer.symbol}'"
    loaded = true
  else
    puts "No file found!"
    loaded = false
  end
else 
  loaded = false
end

#start without loaded file
if !loaded
  print "\nChoose symbol for Player 1: 'X' or 'O': "
  symbol1 = gets.chomp.upcase
  while !["X", "O"].include?(symbol1)
   puts "INVALID: Choose symbol for Player 1: 'X' or 'O': " 
    symbol1 = gets.chomp.upcase
  end
  print "\nIs Player 2 a computer? 'Y' or 'N': "
  isComputer = gets.chomp.upcase
  while !["Y", "N"].include?(isComputer)
   print "INVALID: Is Player 2 a computer? 'Y' or 'N': "
    isComputer = gets.chomp.upcase
  end
  if symbol1 == "X"
    symbol2 = "O"
  else 
    symbol2 = "X"
  end

  puts "\nPlayer 1's symbol is '#{symbol1}'"
  puts "Player 2's symbol is '#{symbol2}'\n"

  player1 = Player.new(symbol1, 1)

  if isComputer == "Y"
    player2 = Computer.new(symbol2, 2)
  else
    player2 = Player.new(symbol2, 2)
  end
  currentPlayer = player1
  waitingPlayer = player2
end
exit = false
played = false

#play until win or exit
while !board.checkForWin and !exit
  board.showBoard

  #if human, prompt for square to play
  if currentPlayer.class != Computer
    print "Player #{currentPlayer.number} choose a row and column to play\nRow: "
    row = gets.chomp.to_i
    while ![1, 2, 3].include?(row)
      print "INVALID: Choose row 1-3 to play: "
      row = gets.chomp.to_i
   end
   print "Col: "
   col = gets.chomp.to_i
   while ![1, 2, 3].include?(col)
      print "INVALID: Choose column 1-3 to play: "
      col = gets.chomp.to_i
    end
    played = board.playSquare(row, col, currentPlayer.symbol)
  #computer decides square to play
  else
    currentPlayer.defense(board.squares)
    puts "Computer plays row #{currentPlayer.row + 1} and column #{currentPlayer.col + 1} \n"
    played = board.playSquare(currentPlayer.row + 1, currentPlayer.col + 1, currentPlayer.symbol)
  end

  #if square played, switch players
  if played
    temp = currentPlayer
    currentPlayer = waitingPlayer
    waitingPlayer = temp


    #save in YAML format
    print "Type 'S' to save and exit"
    save = gets.chomp.upcase
    if save == "S"
      data = {}
      data['board'] = board
      data['currentPlayer'] = currentPlayer
      data['waitingPlayer'] = waitingPlayer
      puts data
      File.open('ttt.yml', 'w') do |f|
        f.write data.to_yaml
      end
      exit = true
    end
  end
end

if !board.cats
  puts "\nPlayer #{currentPlayer.number} is the WINNER!\n\n"
end


