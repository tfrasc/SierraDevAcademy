class Board
  attr_accessor :squares
  
  def initialize
    @squares = []
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
    if @squares[row][col] == " "
      @squares[row][col] = symbol
    else
      raise "Square already filled, choose a new one"
    end
    
    def showBoard
      
    end
  end
end

board = Board.new

board.squares[2][2] = "X"
#board.playSquare(2,2,"69")