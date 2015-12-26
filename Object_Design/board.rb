class Board
  attr_accessor :grid

  def initialize
    @base_grid, @grid = [], []
    set_base_grid
    set_grid
  end

  def set_base_grid
    i, j = 0, 0
    while i < 8
      @grid.push([])
      @base_grid.push([])
      while j < 8
        @grid[i].push(Piece.new(:empty, [i, j]))
        @base_grid[i].push(Piece.new(:empty, [i, j]))
        j += 1
      end
    j = 0
    i += 1
    end
  end

  def set_grid
    i = 0
    @grid[0][0] = Rook.new(:black, [0, 0])
    @grid[0][1] = Knight.new(:black, [0, 1])
    @grid[0][2] = Bishop.new(:black, [0, 2])
    @grid[0][3] = Queen.new(:black, [0, 3])
    @grid[0][4] = King.new(:black, [0, 4])
    @grid[0][5] = Bishop.new(:black, [0, 5])
    @grid[0][6] = Knight.new(:black, [0, 6])
    @grid[0][7] = Rook.new(:black, [0, 7])
    @grid[7][0] = Rook.new(:white, [7, 0])
    @grid[7][1] = Knight.new(:white, [7, 1])
    @grid[7][2] = Bishop.new(:white, [7, 2])
    @grid[7][3] = Queen.new(:white, [7, 3])
    @grid[7][4] = King.new(:white, [7, 4])
    @grid[7][5] = Bishop.new(:white, [7, 5])
    @grid[7][6] = Knight.new(:white, [7, 6])
    @grid[7][7] = Rook.new(:white, [7, 7])

    while i < 8
      @grid[1][i] = Pawn.new(:black, [1, i])
      i += 1
    end
    i = 0
    while i < 8
      @grid[6][i] = Pawn.new(:white, [6, i])
      i += 1
    end
  end

  def [](pos)
    row, col = pos
    @grid[row - 1][col - 1]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row - 1][col - 1] = piece
    @grid[row - 1][col - 1].pos = [row - 1, col - 1]
  end
  
  def clear_space(pos)
    row, col = pos
    @grid[row - 1][col - 1] = @base_grid[row - 1][col - 1]
  end

  def deep_dup
  end

  def display
    i, j = 0, 0
    puts "\n  1 2 3 4 5 6 7 8"
    @grid.each do |row|
      print i + 1
      row.each do |piece|
        print " #{piece.symbol}"
        j += 1
      end
      puts
      j = 0
      i += 1
    end
    puts "\n"
  end

  def check?(current_color)
    king_pos = []
    @grid.each do |row|
      row.each do |piece|
        if(piece.color == current_color && piece.class == King)
          king_pos = piece.pos
          break
        end
      end
    end
    @grid.each do |row|
      row.each do |piece|
        if(piece.color != :empty && piece.color != current_color && piece.possible_moves.include?(king_pos))
          puts "{current_color} is in check!"
          return true
        end
      end
    end
    false
  end

  def checkmate?(current_color)
    if check?(current_color)
    
    end
  end
end
