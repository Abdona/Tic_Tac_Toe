require './lib/board'
require './lib/player'
require './lib/cell'

describe Board do
  describe '#check_win' do
    it 'Check winning cases vertical x' do
      board = Board.new(%w[x x x o x o x o x])
      expect(board.check_win).to eql('x')
    end
    it 'Check winning cases horizontal x' do
      board = Board.new(%w[x o o x o o x o x])
      expect(board.check_win).to eql('x')
    end
    it 'Check winning cases diagonal x' do
      board = Board.new(%w[x o 2 o x 4 6 7 x])
      expect(board.check_win).to eql('x')
    end
    it 'Check winning cases vertical o' do
      board = Board.new(%w[o o o x o x o x o])
      expect(board.check_win).to eql('o')
    end
    it 'Check winning cases horizontal o' do
      board = Board.new(%w[o x x o x x o x o])
      expect(board.check_win).to eql('o')
    end
    it 'Check winning cases diagonal o' do
      board = Board.new(%w[o x 2 x o 4 6 7 o])
      expect(board.check_win).to eql('o')
    end
    it 'check draw cases' do
      board = Board.new(%w[x o x x o o o x x])
      expect(board.check_win).to eql(false)
    end
  end
end

describe Player do
  describe '#validate' do
    it 'check name validation-expected true' do
      player = Player.new('Abdulrahman', 'x')
      expect(player.validate).to eql(true)
    end
    it 'check name validation-expected fale' do
      player = Player.new('   ', 'o')
      expect(player.validate).to eql(false)
    end
    it 'check name validation-expected false' do
      player = Player.new('', 'o')
      expect(player.validate).to eql(false)
    end
  end
end

describe Cell do
  describe '#check_cell' do
    it 'check cell validation-expected false' do
      cell = Cell.new('x')
      expect(cell.check_cell).to eql(false)
    end
    it 'check name validation-expected fale' do
      cell = Cell.new('o')
      expect(cell.check_cell).to eql(false)
    end
    it 'check name validation-expected true' do
      cell = Cell.new('1')
      expect(cell.check_cell).to eql(true)
    end
    it 'check name validation-expected true' do
      cell = Cell.new('')
      expect(cell.check_cell).to eql(true)
    end
  end
end
