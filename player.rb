class Player
  attr_accessor :name, :piece
  def initialize(name, piece, board)
    @name = name
    @piece = piece
    @board = board
  end

  # Ask for coords and check if they are valid
  # If not then keep trying until coords are valid
  def get_move
    # First time asking, if valid then we place
    puts "#{@name}, enter coordinates to place your #{@piece} (row column):"
    input = gets.strip
    row, column = input.split.map(&:to_i)
    valid = validate_move(row, column)

    # If not valid on first attempt then keep asking until valid
    until valid == true
      puts "#{@name}, enter coordinates to place your #{@piece} (row column):"
      input = gets.strip
      row, column = input.split.map(&:to_i)
      valid = validate_move(row, column)
    end

    return input.split.map(&:to_i)
  end

  # calls board class function to validate user input
  def validate_move(x,y)
    @board.validate_move(x,y)
  end
end