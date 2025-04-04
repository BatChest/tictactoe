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

  # Check each row in the grid if all are the same character
  #  # If no row is the same we siginfy this by returning blank
  def check_row
    @grid.each do |row|
      if row.all? {|str| str == 'X'} && row[0] != '-'
        return 'X'
      elsif row.all? {|str| str == 'O'} && row[0] != '-'
        return 'O'
      end
    end
    return ''
  end

  # check each column if all three character are the same
  # If no col is the same we siginfy this by returning blank
  def check_vertical
    (0...@grid[0].size).each do |col_index|
      column = @grid.map { |row| row[col_index] }

      if column.all? {|str| str == 'X'} && column[0] != '-'
        return 'X'
      elsif column.all? {|str| str == 'O'} && column[0] != '-'
        return 'O'
      end
    end
    return ''
  end

  # Check the diagonal indexes by creating array of the current values at those specific indexes
  # checks the new array if the three values all match to either 'X' or 'O'
  # If diagaonal is not the same we siginfy this by returning blank
  def check_digaonal
    main_diagonal = [[0,0], [1,1], [2,2]]
    diagonal_values = []

    main_diagonal.each do |pos|
      row, col = pos
      diagonal_values << @grid[row][col]
    end
    if diagonal_values.all? {|s| s == 'X'}
      return 'X'
    elsif diagonal_values.all? {|s| s == 'O'}
      return 'O'
    end
    return ''
  end

  # Does the same as the above but just the other direction
  # If diagaonal is not the same we siginfy this by returning blank
  def check_otherdiagonal
    other_diagonal = [[0,2], [1,1], [2,0]]
    other_values = []

    other_diagonal.each do |pos|
      row, col = pos
      other_values << @grid[row][col]
    end
    if other_values.all? {|s| s == 'X'}
      return 'X'
    elsif other_values.all? {|s| s == 'O'}
      return 'O'
    end
    return ''
  end

  # A spot is empty if it has a '-' char
  # So if ther are no '-' chars then the board is full
  def check_if_boardfull
    # flatten the grid into single array of cells
    @grid.flatten.include?('-') ? false : 'tie'
  end
end