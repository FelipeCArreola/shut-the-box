class Dice

  # Instance variables
  
  # integer value ID
  @numberID     
  # roll value
  @rollValue    
  
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
