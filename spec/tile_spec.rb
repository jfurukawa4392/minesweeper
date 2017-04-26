require 'rspec'
require 'tile'

describe 'Tile' do

  describe '#initialize' do

    it 'starts out unflipped' do
      expect(Tile.new.flipped).to be false
    end

    it 'has a default value of 0 after being flipped' do
      tile = Tile.new
      tile.flip!
      expect(tile.value).to eq(0)
    end
  end
end
