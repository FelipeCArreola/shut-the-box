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
    print_dice_rolls

    ## print dice 

  end

  def print_tiles
    print "|" 
    @tiles.each do |tile|
      print " #{tile.print_tile_display_value} | "
    end
    puts ""    
  end

  def get_choice
    puts "Enter the tabs you wish to flip separated by a space ('q' to quit):\n"

    choices = Array.new

    loop do
      # TODO- grab choice
    end
      
 

    # "Score: #{}" 

    # "Sorry, that's not a valid move"

    # "Ok, flipping |e|e|" '[in accending order]'

  end



  def open_tiles
    temp_arry = []
    # temp_arry = @tiles.map{|tile| tile if tile.open?}.collect
    # temp_arry = @tiles.select{|tile| tile.statusOpen == true}.collect
    temp_arry = @tiles.select{|tile| tile if tile.open?}.collect
    temp_arry
  end

  def open_tiles_sum
    sum = 0
    open_tiles.each do |tile|
      sum += (tile.numberID + 1)
    end
    sum
  end

  # Checks for possible choices 
  def check_combinations
    choices = []
    size = open_tiles.length
    # TODO-make an array comparing possible choices of sum of dice rolled~ 
    #     ref: combinations -? 
  end
  

  def print_dice_rolls
    puts "Current Roll: #{@dice[0].rollValue}, #{@dice[1].rollValue}"
  end

  end

  def gameRunning?
    @gameRunning
  end

end


