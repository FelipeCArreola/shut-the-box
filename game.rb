class Game

  require_relative "dice.rb"
  require_relative "tiles.rb"

  # Instance variables
  
  # Array of dice
  @dice
  # Array of tile objects           
  @tiles
  # Boolean: True: game-Running; False: game-Over          
  @gameRunning     

  # Instance methods
  def initialize(:number_of_dice 2, :number_of_tiles 9)
    @dice = Array.new(:number_of_dice) {|num_of_dice| Dice.new(num_of_dice +1) }    
    @tiles = Array.new(:number_of_tiles) {|num_of_tiles| Tiles.new(num_of_tiles +1) }
    @gameRunning = true
    puts "Let's play SHUT THE BOX!\n"

    # --- compact to a function: turn>?
    # print- table status
    # roll_dice
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
    puts "Rolling dice..."
    
    # Roll & Print dice roll
    roll_dice
    print_dice_rolls

    # Game Over: yes or no?
    check_game_over

    # Get player choice
    choices = []


  end

  def print_tiles
    print "|" 
    @tiles.each do |tile|
      print " #{tile.print_tile_display_value} | "
    end
    print "\n"    
  end

  def get_choice
    puts "Enter the tabs you wish to flip separated by a space ('q' to quit):\n"

    choices = Array.new

    # ref: https://stackoverflow.com/questions/20387173/how-do-i-loop-a-request-for-user-input-until-the-user-enters-the-correct-info
    prompt = '> '
    while user_input = gets.chomp
      case user_input
      print prompt  
      when 'q'
        @gameRunning = false
        break
      when 1..9
        tile_choice = @tiles.find{|tile| tile.numberID==user_input and tile.open?}
        
        # TODO- work on while loop--
        tile_choice.nil? ? redo : 

      else
        puts "Sorry, that's not a valid move"
        print prompt
      end
      
    end
    
      
 

    # "Score: #{}" 

    # "Sorry, that's not a valid move"

    # "Ok, flipping |e|e|" '[in accending order]'

  end



  def open_tiles
    # Return an array of `Open` tiles
    temp_arry = []
    # temp_arry = @tiles.map{|tile| tile if tile.open?}.collect
    # temp_arry = @tiles.select{|tile| tile.statusOpen == true}.collect
    temp_arry = @tiles.select{|tile| tile if tile.open?}.collect
    temp_arry
  end

  def open_tiles_sum
    sum = 0
    open_tiles.each do |tile|
      sum += tile.numberID
    end
    sum
  end

  def check_game_over
    # Logic: check if dice sum exists in the possible combinations of tiles
    @gameRunning = check_combinations.include?(dice_sum)
  end

  # Checks possible tile choices 
  def check_combinations
    # returns possible sums of combinations from open-tiles 
    sums = []
    size = open_tiles.length
    while size > 0
      # ref: https://www.geeksforgeeks.org/ruby-array-combination-operation/
      combinations = open_tiles.combination(size).to_a
      combinations.each { |combos| sums.append(
        combos.inject(0){ |sum, tile| sum + tile.numberID}
      )}
      size -= 1
    end
    sums.uniq!.sort!
  end
  
  def dice_sum
    # Return dice sum value
    @dice.inject(0){ |sum, die| sum + die.rollValue}
  end  

  def print_dice_rolls
    puts "Current Roll: #{@dice[0].rollValue}, #{@dice[1].rollValue}"
  end

  end

  def gameRunning?
    @gameRunning
  end

end


