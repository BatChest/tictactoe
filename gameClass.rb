class Game
  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
    @current_player
  end

  # main loop for playing the game
  # gets input, updates board, display, check for winner, repeats until winner or tie
  def play
    # When game firsts start player 1 is always first
    game_state = ''
    @current_player = @player1
    until game_state == 'X' || game_state == 'O' || game_state == 'tie'
      x,y = @current_player.get_move
      @board.place_piece(x,y, @current_player.piece)
      @board.displayBoard
      game_state = game_over
      break if game_state == 'X' || game_state == 'O' || game_state == 'tie'
      @current_player = switch_player(@current_player)
    end
    declare_winner(game_state)
  end

  def switch_player(current_player)
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  # check every win conditions and if either X, O or tie returns that
  # First checks if there is a definate winner first
  # If the board is full and there is no winner we can declare a tie
  def game_over
    winning_piece = @board.check_row
    return winning_piece if winning_piece != ''

    winning_piece = @board.check_vertical
    return winning_piece if winning_piece != ''

    winning_piece = @board.check_digaonal
    return winning_piece if winning_piece != ''

    winning_piece = @board.check_otherdiagonal
    return winning_piece if winning_piece != ''

    winning_piece = @board.check_if_boardfull
    return winning_piece if winning_piece != ''
  end

  # Checks the current game state and matches the final outcome
  def declare_winner(game_state)
    if game_state == 'X'
      puts "The winner is Player 1 (X)"
    elsif game_state == 'O'
      puts "The winner is Player 2 (O)"
    elsif game_state == 'tie'
      puts "Its a tie!"
    end
  end
end