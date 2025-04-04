require_relative 'player'
require_relative 'playingBoard'
require_relative 'gameClass'

def setUpGame()
  # Create the playing board first
  playingBoard = Board.new()

  # create the two players
  player1 = Player.new("Player 1", 'X', playingBoard)
  player2 = Player.new("Player 2", 'O', playingBoard)

  # Create the game with players and board
  game = Game.new(player1, player2, playingBoard)

  # start the game
  game.play
end

# Run the game
setUpGame()