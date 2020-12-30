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
    
    # If over:
    return if ! running?

    # print tile selections
    print_tile_selection (@tiles)

    # Get player choice
    selection = get_choice

    # Close tile(s)
    selection.each{ |choice| @tiles.select { |tile| tile.id == choice and tile.open?} 
       then tile.close 
    }

  end

  # prints out selected array of tiles 
  def print_tile_selection ( array_of_tiles)
    print "|" 
    array_of_tiles.each do |tile|
      print " #{tile.print_tile_display_value} | "
    end
    print "\n"    
  end

  def get_choice
    choices = []
    choices_sum = nil

    # ref: https://stackoverflow.com/questions/20387173/how-do-i-loop-a-request-for-user-input-until-the-user-enters-the-correct-info
    prompt = '> '
    puts "Enter the tabs you wish to flip separated by a space ('q' to quit):\n"
    print prompt
    while user_input = gets.chomp
      case user_input  
      
      # Escape  
      when 'q'
        @gameRunning = false
        break

      # User_input within tile range  
      when 1..9
        tile_choice = @tiles.find{|tile| tile.numberID==user_input and tile.open?}
        
        # Verify that chosen tile is open, if not then redo
        if tile_choice.nil?
          puts "Selection: #{user_input} is closed\n"
          redo  
        end
       
        # if tile already selected, move to next selection
        if choices.include?(tile_choice)
          puts "Selection: #{user_input} already selected for this round, select another tile\n"
          next
        end

        # Entered selection is okay: add choice to array-choices 
        choices.append(tile_choice)
        choices_sum += tile_choice 

        # Choice_sum greater than roll sum
        if choices_sum > dice_sum
          puts "Selection- Greater than your dice rolls: #{dice_sum}"
          choices.clear
          redo
        end

        # Detect if another move is okay
        if choices_sum == dice_sum
          print "Ok, flipping " + print_tile_selection(choices) 
          break
        end

      # User_input not valid  
      else
        puts "Sorry, that's not a valid move"
        print prompt
      end
      
    end
    
    # return array of acceptable choices
    return choices

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

  def running?
    @gameRunning == true
  end

  def print_game_over
    
  end

end


