class Board
  attr_accessor :board
  def initialize
    @grid = Array.new(3) { Array.new(3, '-')}
  end

  def displayBoard
    @grid.each do |row|
      puts row.join(' | ')
    end
  end

  # Places the current player piece on the board
  def place_piece(x, y, piece)
    puts "Placing #{piece} at position #{x},#{y}"
    if @grid[x][y] == '-'
      @grid[x][y] = piece
      return true
    else
      return false
    end
  end

  # Checks if spot is free or within bounds
  def validate_move(x,y)
    return false unless x.between?(0, 2) && y.between?(0, 2)

    @grid[x][y] == '-'
  end
end