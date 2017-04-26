require 'board'

class Game

  def initialize(size = 10)
    @board = Board.new(size)
    @game_over = false
  end

  def get_pick
    row, col = nil
    until row.between?(0, @board.size) || col.between?(0, @board.size)
      puts "pick a cell eg. 2,2"
      row, col = gets.chomp.split(",")
    end

    [row, col]
  end

  def pick
    row, col = get_pick
    @board.flip(row, col)
    if @board[row, col].value == 'M'
      @game_over = true
      puts "YOU LOSE!!!"
    else

    end

  end

  def play
    until @game_over
      @board.render
      self.pick
    end
  end
end
