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

  def place_piece(x, y, piece)
    puts "Placing #{piece} at position #{x},#{y}"
    if @grid[x][y] == '-'
      @grid[x][y] = piece
      return true
    else
      return false
    end
  end
end