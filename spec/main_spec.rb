require_relative '../lib/logic'

# Class Interface
RSpec.describe Interface do
  describe '#display' do
    it 'displays the board' do
      game = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      outie = Interface.display(game)
      expect(outie).to be_a(String)
    end
  end

  describe '#game_ending' do
    it 'returns true if the parameter != 9' do
      boolie = Interface.game_ending(8)
      expect(boolie).to eql(true)
    end

    it 'returns true if the parameter != 9' do
      boolie = Interface.game_ending(9)
      expect(boolie).to eql(false)
    end
  end

  describe '#count_giver' do
    it 'returns @count which is an integer' do
      testing = Interface.count_giver
      expect(testing).to be_a(Integer)
    end

    it 'returns @count as a starting point of 0' do
      testing = Interface.count_giver
      expect(testing).to eql(0)
    end

    it 'returns @count which is not a String' do
      testing = Interface.count_giver
      expect(testing).not_to be_a(String)
    end

    it 'returns @count which is not a Float' do
      testing = Interface.count_giver
      expect(testing).not_to be_a(Float)
    end
  end

  describe '#increaser' do
    it 'increases @count by one' do
      Interface.increaser
      count1 = Interface.count_giver
      expect(count1).to eql(1)
    end

    it 'increases @count by one' do
      Interface.increaser
      Interface.increaser
      count1 = Interface.count_giver
      expect(count1).to eql(3)
    end
  end

  describe '#finisher' do
    it 'makes @count to be an integer' do
      Interface.finisher
      count1 = Interface.count_giver
      expect(count1).to be_a(Integer)
    end

    it 'makes @count to be 9' do
      Interface.finisher
      count1 = Interface.count_giver
      expect(count1).to eql(9)
    end
  end

  describe '#turn_odd' do
    it 'returns true if @count has an odd value' do
      boolie = Interface.turn_odd
      expect(boolie).to eql(true)
    end

    it 'returns false if @count has an even value' do
      Interface.increaser
      boolie = Interface.turn_odd
      expect(boolie).to eql(false)
    end
  end
end

# Class String
RSpec.describe String do
  describe '#colorize' do
    it 'changes a string color' do
      colored = 'test string'.colorize(31)
      expect(colored).to eql("\e[31mtest string\e[0m")
    end
  end

  describe '#red' do
    it 'makes a string red' do
      colored = 'test string'.red
      expect(colored).to eql('test string'.colorize(31))
    end
  end

  describe '#green' do
    it 'makes a string green' do
      colored = 'test string'.green
      expect(colored).to eql('test string'.colorize(32))
    end
  end

  describe '#yellow' do
    it 'makes a string yellow' do
      colored = 'test string'.yellow
      expect(colored).to eql('test string'.colorize(33))
    end
  end

  describe '#blue' do
    it 'makes a string blue' do
      colored = 'test string'.blue
      expect(colored).to eql('test string'.colorize(34))
    end
  end

  describe '#pink' do
    it 'makes a string pink' do
      colored = 'test string'.pink
      expect(colored).to eql('test string'.colorize(35))
    end
  end
end

# Class GameBoard
RSpec.describe GameBoard do
  describe '#initialize' do
    it 'creates an array from 1 to 9' do
      game = GameBoard.new
      expect(game.board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end
end

# Class Players
RSpec.describe Players do
  describe '#initialize' do
    let(:player) { Players.new('me', 'X') }
    it 'gets player name and assign to instance variable name' do
      expect(player.name).to eql('me')
    end

    it 'initializes a player with a mark' do
      expect(player.mark).to eql('X')
    end
  end
end

# Class MovesInput
RSpec.describe MovesInput do
  describe '#making_move' do
    let(:board) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
    let(:move) { 7 }
    let(:mark) { 'X' }
    it 'Implements the chosen move' do
      MovesInput.making_move(board, move, mark)
      expect(board).to eql([1, 2, 3, 4, 5, 6, 'X', 8, 9])
    end
  end

  describe '#valid_check' do
    let(:valid) { '1' }
    let(:invalid1) { 'G' }
    let(:invalid2) { '11' }
    it 'returns nil if the move input is an integer between 1 and 9' do
      boolie = MovesInput.valid_check(valid)
      expect(boolie).to eql(nil)
    end

    it 'returns false if the move input is an character' do
      boolie = MovesInput.valid_check(invalid1)
      expect(boolie).to eql(false)
    end

    it 'returns false the move input is an integer of more than one digit' do
      boolie = MovesInput.valid_check(invalid2)
      expect(boolie).to eql(false)
    end
  end

  describe '#repeat_check' do
    let(:game) { [1, 2, 3, 4, 5, 6, 'X', 8, 9] }
    let(:validi) { '4' }
    let(:invalidi) { '7' }
    it 'returns false if a position in the board is a string (already taken)' do
      boolie = MovesInput.repeat_check(game, invalidi)
      expect(boolie).to eql(false)
    end

    it 'returns nil if a position in the board is an integer (untaken)' do
      boolie = MovesInput.repeat_check(game, validi)
      expect(boolie).to eql(nil)
    end
  end

  describe '#universal_check' do
    let(:game) { [1, 2, 3, 4, 5, 6, 'X', 8, 9] }
    let(:validi) { '4' }
    let(:invalidi1) { '7' }
    let(:invalidi2) { 'G' }
    let(:invalidi3) { '77' }
    it 'returns false if a position in the board is a string (already taken)' do
      boolie = MovesInput.universal_check(game, invalidi1)
      expect(boolie).to eql(false)
    end

    it 'returns false if the move input is an character' do
      boolie = MovesInput.universal_check(game, invalidi2)
      expect(boolie).to eql(false)
    end

    it 'returns false the move input is an integer of more than one digit' do
      boolie = MovesInput.universal_check(game, invalidi3)
      expect(boolie).to eql(false)
    end

    it 'returns true if a position in the board is an integer (untaken)' do
      boolie = MovesInput.universal_check(game, validi)
      expect(boolie).to eql(true)
    end
  end
end

# Class WinChecks
RSpec.describe WinChecks do
  let(:markx) { 'X'.blue }
  let(:marko) { 'O'.pink }
  describe '#global' do
    it 'returns 0 if positions 1, 4 and 7 are not equaly marked' do
      game = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 1, 4 and 7 are not equaly marked' do
      game = [1, 2, 3, markx, 5, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 2, 5 and 8 are not equaly marked' do
      game = [1, 2, 3, 4, 5, 6, 7, markx, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 3, 6 and 9 are not equaly marked' do
      game = [1, 2, markx, 4, 5, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 1, 2 and 3 are not equaly marked' do
      game = [marko, 2, markx, marko, 5, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 4, 5 and 6 are not equaly marked' do
      game = [1, 2, 3, marko, markx, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 7, 8 and 9 are not equaly marked' do
      game = [1, 2, 3, 4, 5, 6, 7, marko, markx]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 1, 5 and 9 are not equaly marked' do
      game = [markx, 2, 3, 4, marko, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 7, 5 and 3 are not equaly marked' do
      game = [1, 2, 3, 4, 5, 6, marko, markx, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 1 if positions 1, 4 and 7 are marked with a blue X' do
      game = [markx, 2, 3, markx, 5, 6, markx, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 2, 5 and 8 are marked with a blue X' do
      game = [1, markx, 3, 4, markx, 6, 7, markx, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 3, 6 and 9 are marked with a blue X' do
      game = [1, 2, markx, 4, 5, markx, 7, 8, markx]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 1, 2 and 3 are marked with a blue X' do
      game = [markx, markx, markx, 4, 5, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 4, 5 and 6 are marked with a blue X' do
      game = [1, 2, 3, markx, markx, markx, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 7, 8 and 9 are marked with a blue X' do
      game = [1, 2, 3, 4, 5, 6, markx, markx, markx]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 1, 5 and 9 are marked with a blue X' do
      game = [markx, 2, 3, 4, markx, 6, 7, 8, markx]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 7, 5 and 3 are marked with a blue X' do
      game = [1, 2, markx, 4, markx, 6, markx, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 2 if positions 1, 4 and 7 are marked with a pink O' do
      game = [marko, 2, 3, marko, 5, 6, marko, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 2, 5 and 8 are marked with a pink O' do
      game = [1, marko, 3, 4, marko, 6, 7, marko, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 3, 6 and 9 are marked with a pink O' do
      game = [1, 2, marko, 4, 5, marko, 7, 8, marko]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 1, 2 and 3 are marked with a pink O' do
      game = [marko, marko, marko, 4, 5, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 4, 5 and 6 are marked with a pink O' do
      game = [1, 2, 3, marko, marko, marko, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 7, 8 and 9 are marked with a pink O' do
      game = [1, 2, 3, 4, 5, 6, marko, marko, marko]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 1, 5 and 9 are marked with a pink O' do
      game = [marko, 2, 3, 4, marko, 6, 7, 8, marko]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 3, 5 and 7 are marked with a pink O' do
      game = [1, 2, marko, 4, marko, 6, marko, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 0 if positions 1, 4 and 7 are not equaly marked' do
      game = [1, 2, 3, markx, 5, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 2, 5 and 8 are not equaly marked' do
      game = [1, 2, 3, 4, 5, 6, 7, markx, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 3, 6 and 9 are not equaly marked' do
      game = [1, 2, markx, 4, 5, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 1 if positions 1, 4 and 7 are marked with a blue X' do
      game = [markx, 2, 3, markx, 5, 6, markx, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 2, 5 and 8 are marked with a blue X' do
      game = [1, markx, 3, 4, markx, 6, 7, markx, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 3, 6 and 9 are marked with a blue X' do
      game = [1, 2, markx, 4, 5, markx, 7, 8, markx]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 2 if positions 1, 4 and 7 are marked with a pink O' do
      game = [marko, 2, 3, marko, 5, 6, marko, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 2, 5 and 8 are marked with a pink O' do
      game = [1, marko, 3, 4, marko, 6, 7, marko, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 3, 6 and 9 are marked with a pink O' do
      game = [1, 2, marko, 4, 5, marko, 7, 8, marko]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 0 if positions 1, 2 and 3 are not equaly marked' do
      game = [marko, 2, markx, marko, 5, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 4, 5 and 6 are not equaly marked' do
      game = [1, 2, 3, marko, markx, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 7, 8 and 9 are not equaly marked' do
      game = [1, 2, 3, 4, 5, 6, 7, marko, markx]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 1 if positions 1, 2 and 3 are marked with a blue X' do
      game = [markx, markx, markx, 4, 5, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 4, 5 and 6 are marked with a blue X' do
      game = [1, 2, 3, markx, markx, markx, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 7, 8 and 9 are marked with a blue X' do
      game = [1, 2, 3, 4, 5, 6, markx, markx, markx]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 2 if positions 1, 2 and 3 are marked with a pink O' do
      game = [marko, marko, marko, 4, 5, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 4, 5 and 6 are marked with a pink O' do
      game = [1, 2, 3, marko, marko, marko, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 7, 8 and 9 are marked with a pink O' do
      game = [1, 2, 3, 4, 5, 6, marko, marko, marko]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 0 if positions 1, 5 and 9 are not equaly marked' do
      game = [markx, 2, 3, 4, marko, 6, 7, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 7, 5 and 3 are not equaly marked' do
      game = [1, 2, 3, 4, 5, 6, marko, markx, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(0)
    end

    it 'returns 1 if positions 1, 5 and 9 are marked with a blue X' do
      game = [markx, 2, 3, 4, markx, 6, 7, 8, markx]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 7, 5 and 3 are marked with a blue X' do
      game = [1, 2, markx, 4, markx, 6, markx, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(1)
    end

    it 'returns 2 if positions 1, 5 and 9 are marked with a pink O' do
      game = [marko, 2, 3, 4, marko, 6, 7, 8, marko]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 3, 5 and 7 are marked with a pink O' do
      game = [1, 2, marko, 4, marko, 6, marko, 8, 9]
      winner = WinChecks.global(game)
      expect(winner).to eql(2)
    end
  end
end
