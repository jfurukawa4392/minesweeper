class Tile

  attr_reader :flipped
  attr_accessor :value

  def initialize(value = 0)
    @flipped = false
    @value = value
  end

  def flip!
    @flipped = true
  end
end
