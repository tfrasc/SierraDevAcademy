class Board
  def initialize
    @base_grid = []
    set_base_grid 
    @grid = @base_grid
    set_grid
  end

  def set_base_grid
    i, j = 0, 0
    current_char = BLACK_SQUARE
    next_char = WHITE_SQUARE
    while i < 8
      @base_grid.push([])
      while j < 8
        @base_grid[i].push(Piece.new(current_char, "Empty", i, j))
        j += 1
        current_char, next_char = next_char, current_char
      end
    current_char, next_char = next_char, current_char
    j = 0
    i += 1
    end
  end

  def set_grid
    i = 0
    @grid[0][0] = Rook.new(BLACK_ROOK, "Black", 0, 0)
    @grid[0][1] = Knight.new(BLACK_KNIGHT, "Black", 0, 1)
    @grid[0][2] = Bishop.new(BLACK_BISHOP, "Black", 0, 2)
    @grid[0][3] = Queen.new(BLACK_QUEEN, "Black", 0, 3)
    @grid[0][4] = King.new(BLACK_KING, "Black", 0, 4)
    @grid[0][5] = Bishop.new(BLACK_BISHOP, "Black", 0, 5)
    @grid[0][6] = Knight.new(BLACK_KNIGHT, "Black", 0, 6)
    @grid[0][7] = Rook.new(BLACK_ROOK, "Black", 0, 7)
    @grid[7][0] = Rook.new(WHITE_ROOK, "White", 7, 0)
    @grid[7][1] = Knight.new(WHITE_KNIGHT, "White", 7, 1)
    @grid[7][2] = Bishop.new(WHITE_BISHOP, "White", 7, 2)
    @grid[7][3] = Queen.new(WHITE_QUEEN, "White", 7, 3)
    @grid[7][4] = King.new(WHITE_KING, "White", 7, 4)
    @grid[7][5] = Bishop.new(WHITE_BISHOP, "White", 7, 5)
    @grid[7][6] = Knight.new(WHITE_KNIGHT, "White", 7, 6)
    @grid[7][7] = Rook.new(WHITE_ROOK, "White", 7, 7)

    while i < 8
      @grid[1][i] = Pawn.new(BLACK_PAWN, "Black", 1, i)
      i += 1
    end
    i = 0
    while i < 8
      @grid[6][i] = Pawn.new(WHITE_PAWN, "White", 6, i)
      i += 1
    end
  end

  def deep_dup

  end

  def display
    i, j = 0, 0
    puts "\n  1 2 3 4 5 6 7 8"
    @grid.each do |row|
      print i + 1
      row.each do |col|
        print " #{col.symbol}"
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
