require 'board'

class Game

  def initialize(size = 10)
    @board = Board.new(size)
  end

  def get_pick
    row, col = nil
    while row.nil? || col.nil?

    end

    pick(row, col)
  end

  def pick(row, col)
    @board[row, col].flip!
  end

  def play
  end

end
