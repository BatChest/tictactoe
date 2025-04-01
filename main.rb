require_relative 'player'

def playgame()
  # create the player board
  # create the two players by defining
  # a player class and instaniate player objects
  # Create the two players
  player1 = Player.new("Player 1")
  player2 = Player.new("Player 2")

  player1.greet
  player2.greet
end