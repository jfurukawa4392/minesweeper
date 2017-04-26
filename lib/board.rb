require_relative 'tile'

class Board

  attr_reader :size

  def initialize(size = 10)
    # Array set to always be square
    @size = size
    @grid = Array.new(size) { Array.new(size) }
    @mine_pos = []
    self.setup
  end

  def setup
    # fill board with blank tiles
    @grid.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        self[row_idx, col_idx] = Tile.new
      end
    end

    # set random tiles as mines
    @size.times do |num|
      self.place_mine!
    end
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, val)
    @grid[row][col] = val
  end

  def place_mine!
    range = [-1, 0, 1]

    #place a new mine with no repeats in position
    row, col = rand(@size), rand(@size)
    while @mine_pos.include?([row, col])
      row, col = rand(@size), rand(@size)
    end

    @grid[row][col] = Tile.new('M')

    range.each do |dx|
      range.each do |dy|
        if self.out_of_bounds?(row + dx, col + dy) ||
          self[row + dx, col + dy].value == 'M'
          next
        end
        self[row + dx, col + dy].value += 1
      end
    end

    @mine_pos.push([row, col])
  end

  def render
    @grid.each do |row|
      row.each do |cell|
        print "#{cell.flipped ? cell.value : '8'}"
      end
      print "\n"
    end
    nil
  end

  def out_of_bounds?(row, col)
    (row.between?(0,9) && col.between?(0,9)) ? false : true
  end

  def flip(row, col)
    range = [1,2,3]
    self[row, col].flip!
    range.each do |dx|
      range.each do |dy|
      end
    end
  end
end
