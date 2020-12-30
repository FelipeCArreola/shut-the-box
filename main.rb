require_relative "game.rb"

# Start a new game
game = Game.new

# Make a turn until the game is over
while game.running?
  game.turn
end

# If game over
game.print_game_over