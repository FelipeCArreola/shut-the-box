class Tiles

  # Instance variables
  @numberID     # integer value ID
  @statusOpen   # Boolean: True: Open; False: Closed
  
  # Instance methods
  def initialize(number)
    @numberID = number
    @statusOpen = true
  end
  
  protected
  attr_reader :numberID, :statusOpen

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

end
