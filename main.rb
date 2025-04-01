require_relative 'player'
require_relative 'playingBoard'

def setUpGame()
  # create the player board
  # create the two players by defining
  player1 = Player.new("Player 1", 'X')
  player2 = Player.new("Player 2", 'O')

  playingBoard = Board.new()

  # Actually play the game
  playGame(player1, player2, playingBoard)

end

def playGame(player1, player2, board)
  # Actual logic of the game
  # first display the board
  board.displayBoard
end

# Run the game
setUpGame()