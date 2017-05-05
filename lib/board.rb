require_relative './ai_player'

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) }
    @grid.each do |row|
      row.map! do |cell|
        '-'
      end
    end
  end

  def add_token(pos, symbol)
    row, col = pos
    @grid[row][col] = symbol
  end

  def render
    @grid.each do |row|
      puts row.join('|')
    end
  end

  def full?
    @grid.each do |row|
      row.each do |cell|
        return false if cell == '-'
      end
    end

    return true
  end
end

def play_turn
  is_valid = false
  until is_valid
    puts "Please enter a move eg. 1,2"
    player_move = gets.chomp
    begin
      player_move.split(',')
      return player_move[0..1]
    rescue
      puts "please enter a different move"
    end
  end
end

if __FILE__ == $0
  b = Board.new
  ai = AIPlayer.new(b)

  # b.render
  # b.add_token([0,1], :X)
  # b.render
  # print "\n"
  # ai.make_move
  # ai.make_move
  # b.render

  until b.full?
    move = play_turn
    p move
    b.add_token(move, :X)
    b.render
    print "/n"
    ai.make_move unless b.full?
    b.render
    print "/n"
  end
end
