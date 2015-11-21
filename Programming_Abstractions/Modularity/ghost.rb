class HumanPlayer
  attr_reader :name, :ghost

  def initialize(name)
    @name = name
    @ghost = -1
  end
end

class ComputerPlayer
  attr_reader :name, :ghost

  def initialize(name)
    @name = name
    @ghost = -1
  end
end

class Game
  attr_accessor :words, :players

  def initialize()
    @words = []
    @players = []
  end

  def play
    word = ""
    continue = true
    while continue
      @players.each do |p|
        if p.class == HumanPlayer
          puts "#{p.name} please choose a letter"
          letter = gets.chomp.upcase
          while ![*('A'..'Z')].include?(letter)
            puts "#INVALID: #{p.name} please choose a letter between 'A' and 'Z'"
            letter = gets.chomp.upcase
          end
          word += letter
        else
          letter = [*('A'..'Z')].sample(1).join
          puts "#{p.name} chooses #{letter}"
          word += letter
        end
        checkForWord(p,word)
      end
      display
    end
  end

  def checkForWord(player, word)

  end

  def display
    i = 0
    ghost = "GHOST"
    @players.each do |p|
      print "\n#{p.name}: "
      while i <= p.ghost and p.ghost > -1
        print ghost[i]
      end
      puts "\n"
    end
  end
end

i = 0
ghost = "GHOST"
game = Game.new

puts "\nTyler's GHOST Game!\n===================\n"


#load all words from file in array
File.open("words.txt", "r") do |f|
  puts "Loading words file...\n"
  f.each_line do |line|
    game.words.push(line)
  end
  puts "Done!\n\n"
end

#get amounts of players
puts "How many human players will be playing?"
humans = gets.chomp.to_i
puts "How many computer players will be playing?"
computers = gets.chomp.to_i

#create and push human players
while i < humans
  puts "What is Player #{i+1}'s name?"
  name = gets.chomp
  game.players.push(HumanPlayer.new(name))
  i += 1
end
i = 0

#create and push computer players
while i < computers
  game.players.push(ComputerPlayer.new("Computer #{i+1}"))
  i += 1
end

game.play