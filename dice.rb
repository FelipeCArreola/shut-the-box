class Dice

  # Instance variables
  @numberID     # integer value ID
  @rollValue    # roll value (1-6)
  
  # Instance methods
  def initialize(number)
    @numberID = number
    @rollValue = 0 
  end

  protected
  attr_reader :numberID, :rollValue

  public
  # reset the roll value
  def reset
    @rollValue = 0
  end

  # roll the die and assign value
  def roll
    @rollValue = rand 1..6
  end  

end
