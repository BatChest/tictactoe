class Game
  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  # main loop for playing the game
  def play
    game_state = game_over

    until game_state == 'X' || game_state == 'O'
      switch_player
      game_state = game_over
    end
  end

  def switch_player
    x1,y1 = @player1.get_move
    @board.place_piece(x1, y1, @player1.piece)
    @board.displayBoard

    x2,y2 = @player2.get_move
    @board.place_piece(x2, y2, @player2.piece)
    @board.displayBoard
  end

  def game_over
    winning_piece = ''
    while winning_piece == ''
      winning_piece = @board.check_row
      winning_piece = @board.check_vertical
      winning_piece = @board.check_digaonal
      winning_piece = @board.check_otherdiagonal
    end
    return winning_piece
  end
end