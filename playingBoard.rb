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

  def check_row
    @grid.each do |row|
      if row.all? {|str| str == 'X'} && row[0] != '-'
        puts "Player with #{row[0]} wins!"
      end
    end
  end

  def check_vertical
    (0...@grid[0].size).each do |col_index|
      column = @grid.map { |row| row[col_index] }

      if column.all? {|str| str == 'X'} && column[0] != '-'
        puts "Player with #{column[0]} wins!"
      end
    end
  end

  def check_digaonal
    main_diagonal = [[0,0], [1,1], [2,2]]
    diagonal_values = []

    main_diagonal.each do |pos|
      row, col = pos
      diagonal_values << @grid[row][col]
    end
    if diagonal_values.all? {|s| s == 'X'}
      puts "Player 1 wins!"
    elsif diagonal_values.all? {|s| s == 'O'}
      puts "Player 2 wins!"
    end
  end

  def check_otherdiagonal
    other_diagonal = [[0,2], [1,1], [2,0]]
    other_values = []

    other_diagonal.each do |pos|
      row, col = pos
      other_values << @grid[row][col]
    end
    if other_values.all? {|s| s == 'X'}
      puts "Player 1 wins!"
    elsif other_values.all? {|s| s == 'O'}
      puts "Player 2 wins!"
    end
  end

end