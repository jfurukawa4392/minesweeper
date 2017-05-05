class AIPlayer

  def initialize(board = nil)
    @symbol = :O
    @board = board
  end

  def make_move
    raise "Board Full" if @board.full?

    @board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        if cell == '-'
          @board.add_token([row_idx, col_idx], @symbol)
          return
        end
      end
    end
  end

end
