class Tiles

  # Instance variables
  
  # integer value ID
  @numberID     
  # Boolean: True: Open; False: Closed
  @statusOpen   
  
  # Instance methods
  def initialize(number)
    @numberID = number
    @statusOpen = true
  end
  
  protected
  attr_reader :numberID, :statusOpen

  public
  # Opens tile
  def open
    @statusOpen = true
  end

  # Closes tile
  def close
    @statusOpen = false
  end

  # returns status of tile
  def open?
    @statusOpen
  end
  
  # returns status of tile
  def close?
    !@statusOpen
  end

  # returns tile value ID : if open returns the number ID, if closed returns '.'
  def print_tile_display_value
    @statusOpen ? @numberID : '.'
  end

end
