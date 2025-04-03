require_relative 'player'
require_relative 'playingBoard'

def setUpGame()
  # Create the board first
  playingBoard = Board.new()

  # create the player board
  # create the two players by defining
  player1 = Player.new("Player 1", 'X', playingBoard)
  player2 = Player.new("Player 2", 'O', playingBoard)

  # Actually play the game
  playGame(player1, player2, playingBoard)

end

def playGame(player1, player2, board)
  # Actual logic of the game
  # first display the board
  board.displayBoard

  # game would call
  x, y = player1.get_move

  board.place_piece(x, y, player1.piece)

  board.displayBoard

  x, y = player1.get_move
  board.place_piece(x, y, player1.piece)
  board.displayBoard

  x, y = player1.get_move
  board.place_piece(x, y, player1.piece)
  board.displayBoard

  board.check_otherdiagonal
end

# Run the game
setUpGame()