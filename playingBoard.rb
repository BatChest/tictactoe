class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, '-')}
  end

  def displayBoard
    @grid.each do |row|
      puts row.join(' | ')
      puts "----------" unless row == @grid.last
    end
  end
end