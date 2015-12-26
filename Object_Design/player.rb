class Player
  attr_reader :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end
  
  def get_from
    puts "#{@name}, please choose a #{@color} piece to move."
    print "Row: "
    row = gets.chomp.to_i
    print "Column: "
    col = gets.chomp.to_i
    [row, col]
  end
  
  def get_to
    puts "#{name}, please choose a space to move your piece to."
    print "Row: "
    row = gets.chomp.to_i
    print "Column: "
    col = gets.chomp.to_i
    [row, col]
  end
end
