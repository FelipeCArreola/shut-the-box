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
    @tiles = Array.new(:number_of_tiles) {|num_of_tiles| Tiles.new(num_of_tiles+1) }
    @gameRunning = true
    puts "Let's play SHUT THE BOX!\n"

    # --- compact to a function: turn>?
    # print- table status

    roll_dice

    ## print dice 
  end  

  public
  # Roll each die in array "Dice"
  def roll_dice
    @dice.each do |die| 
      # reset roll value of die
      die.reset
      # roll and assign value
      die.roll
    end
  end

  def turn
    puts "------------------\nRolling dice..."
    roll_dice
    ## print dice 

  end

  def print_dice_rolls

  end

  def gameRunning?
    @gameRunning
  end

end


