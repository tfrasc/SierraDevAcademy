class HumanPlayer
  attr_reader :name
  attr_accessor :ghost

  def initialize(name)
    @name = name
    @ghost = -1
  end
end

class ComputerPlayer
  attr_reader :name
  attr_accessor :ghost

  def initialize(name)
    @name = name
    @ghost = -1
  end
end

class Game
  attr_accessor :allWords, :currentWords, :players

  def initialize
    @allWords = []
    @currentWords = []
    @players = []
  end

  def play
    word = ""
    @currentWords = @allWords
    i = 0
    continue = true
    display
    while continue
      @players.each do |p|
        if p.class == HumanPlayer
          puts "#{p.name} please choose a letter"
          letter = gets.chomp.upcase
          while ![*('A'..'Z')].include?(letter)
            puts "INVALID: #{p.name} please choose a letter between 'A' and 'Z'"
            letter = gets.chomp.upcase
          end
        else
          letter = [*('A'..'Z')].sample(1).join
          puts "#{p.name} chooses #{letter}"
          gets
        end
        word += letter
        puts "\nWord is: ", word, "\n"
        word = checkForWord(p, word, i)
        continue = checkForLoss
        i += 1
        if word == ""
          i = 0
        end
      end
    end
  end

  def checkForWord(player, word, index)
    ghostArr = "GHOST"
    newWords = []
    found = false
    @currentWords.each do |x|
      if x[index] == word[index]
        newWords.push(x)
        found = true
      end
    end
    if found
      @currentWords = newWords
      word
    else
      player.ghost += 1
      @currentWords = @allWords
      puts "#{word} not found! #{player.name} receives letter #{ghostArr[player.ghost]}!"
      display
      word = ""
    end
  end
  
  def checkForLoss
    @players.each do |p|
      if p.ghost == 4
        puts "\n#{p.name} is ELIMINATED!\n\n"
        @players.delete(p)
        if @players.length < 2
          puts "\n#{@players[0].name} is the WINNER!\n\n"
          return false
        end
      end
    end
    true
  end

  def display
    i = 0
    ghost = "GHOST"
    puts "\n\nStatus\n------"
    @players.each do |p|
      print "\n#{p.name}: "
      while i <= p.ghost and p.ghost > -1
        print ghost[i]
        i += 1
      end
      puts "\n\n"
      i = 0
    end
  end
end

game = Game.new
i = 0
ready = false

puts "\nTyler's GHOST Game!\n===================\n"


#load all words from file in array
File.open("words.txt", "r") do |f|
  puts "Loading words file...\n"
  f.each_line do |line|
    game.allWords.push(line)
  end
  puts "Done!\n\n"
end

while !ready
  #get amounts of players
  puts "How many human players will be playing?"
  humans = gets.chomp.to_i
  puts "How many computer players will be playing?"
  computers = gets.chomp.to_i
  
  #check if enough players to play
  if humans + computers < 2
    puts "You must have at least 2 players to play"
  else
    ready = true
  end
end

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

#start game
game.play


