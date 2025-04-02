class Player
  attr_accessor :name, :piece
  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end
  def get_move
    # Ask player for coordinates
    # Return those coordinates for the Game to use
    puts "#{@name}, enter coordinates to place your #{@piece} (row column):"
    input = gets.strip

    return input.split.map(&:to_i)
  end
end