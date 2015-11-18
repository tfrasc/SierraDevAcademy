class Tower
  attr_reader :name
  attr_accessor :stack

  def initialize(name)
  	@name = name
    @stack = []
   end

  def push(ring)
    @stack.push(ring)
  end

  def pop
    @stack.pop
  end
end

class Ring
 # attr_reader :size

  def initialize(size)
    @size = size
  end

  def size
    @size
  end
end

def display(t1, t2, t3)
  print "\nTower 1:\t"
  t1.stack.each do |ring|
    if ring != nil
      print ring.size, "\t"
    end
  end
  puts

  print "\nTower 2:\t"
  t2.stack.each do |ring|
    if ring != nil
      print ring.size, "\t"
    end
  end
  puts

  print "\nTower 3:\t"
  t3.stack.each do |ring|
    if ring != nil
      print ring.size, "\t"
    end
  end
  puts "\n\n"
end

#create 3 towers
t1 = Tower.new('1')
t2 = Tower.new('2')
t3 = Tower.new('3')

#create 4 rings
r1 = Ring.new(1)
r2 = Ring.new(2)
r3 = Ring.new(3)
r4 = Ring.new(4)

#push all rings onto first ring
t1.stack.push(r4)
t1.stack.push(r3)
t1.stack.push(r2)
t1.stack.push(r1)

from = nil
to = nil
puts "\nWelcome to Tyler's Tower's of Hanoi!
     Move all rings to tower 3!
      =======================\n"

#loop until exit
#get pop tower or exit
while from != "X" and from != "x"
  display(t1, t2, t3)

  puts "Choose a tower ('1','2',or '3') to pop from or 'x' to exit"
  from = gets.chomp

  #ensure valid pop tower chosen
  while from != "1" and from != "2" and from != "3" and from != "x" and from != "X"
    puts "\nINVALID: Choose a tower ('1','2',or '3') to pop from or ('x') to exit"
    from = gets.chomp
  end

  #get push tower
  if from != "x" and from != "X"
    puts "Choose a new stack ('1','2',or '3') to push onto"
    to = gets.chomp
  end

  #ensure valid push tower
  while to != "1" and to != "2" and to != "3" and from != "x" and from != "X"
    puts "\nINVALID: enter a stack ('1','2',or '3') to push onto"
    to = gets.chomp
  end 
  while to == from
    puts "\nINVALID: Cannot move to same stack, choose ('1', '2', or '3')"
    to = gets.chomp
  end

  if from == "X" or from == "x"
    puts "Thanks for playing :)\n\n"
  else
    #set pop tower
    if from == "1"
      from = t1
    elsif from == "2"
      from = t2
    else
      from = t3
    end

    #set push tower
    if to == "1"
      to = t1
    elsif to == "2"
      to = t2
    else
      to = t3
    end

    #check tower statuses
    if from.stack == []
      puts "\nINVALID: You're popping from an empty tower"
    else
      if to.stack != []
        if from.stack[-1].size > to.stack[-1].size
          puts "\nINVALID: You're pushing onto a tower with a ring of smaller size"
        else 
          #execute pull and push
          to.push(from.pop)
        end
      else
       #execute pull and push
        to.push(from.pop)
      end
    end

    #check for win
    if t3.stack == [r4, r3, r2, r1]
      display(t1, t2, t3)
      puts "Congrats! You're a winner!!! :)\n\n"
      #to exit
      from = "x" 
    end
  end
end