class Game

  require_relative "dice.rb"
  require_relative "tiles.rb"

  # Instance variables
  @dice           # Array of dice
  @tiles          # Array of tile objects
  @gameRunning    # Boolean: True: game-Running; False: game-Over 

  # Instance methods
  def initialize(:number_of_dice 2, :number_of_tiles 9)
    @dice = Array.new(:number_of_dice) {|num_of_dice| Dice.new(num_of_dice+1) }    
    @tiles = Array.new(:number_of_tiles) {|num_of_tiles| Dice.new(num_of_tiles+1) }
    @gameRunning = true
    
  end  

end


