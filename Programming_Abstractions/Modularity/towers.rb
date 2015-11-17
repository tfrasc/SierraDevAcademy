class Tower
  attr_reader :name

  def initialize(name)
  	@name = name
   end
end

class Ring
  attr_reader :size

  def initialize(size)
    @size = size
  end
end

t1 = Tower.new('a')
t2 = Tower.new('b')
t2 = Tower.new('c')

r1 = Ring.new(1)
r2 = Ring.new(2)
r3 = Ring.new(3)
r4 = Ring.new(4)

puts t1.name