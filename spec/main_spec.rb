require_relative '../lib/logic'
# Main

# Class Interface

# Fer =(

RSpec.describe Interface do
  describe '#display' do
    it 'displays the game board' do
      expect().to eql()
    end
  end

  describe '#collect_move' do
    it 'gets an invalid move (character) and displays an error' do
      expect().to eql()
    end

    it 'gets an invalid move (integer > 9) and displays an error' do
      expect().to eql()
    end

    it 'gets an invalid move (repeated) and displays an error' do
      expect().to eql()
    end

    it 'gets an valid move and returns that move as integer' do
      expect().to eql()
    end

    it 'gets an valid move and returns that move as integer with a length < 2' do
      expect().to eql()
    end
  end

  # Tenny

  describe '#game_ending' do
    it 'returns true if @count != 9' do
      expect().to eql()
    end

    it 'returns nil if @count == 9' do
      expect().to eql()
    end
  end

  describe '#finisher' do
    it 'sets @count to 9' do
      expect().to eql()
    end
  end

  describe '#increaser' do
    it 'increases @count by one' do
      expect().to eql()
    end
  end

  describe '#turn_odd' do
    it 'returns true if @count is an odd number' do
      expect().to eql()
    end

    it 'returns nil if @count is an even number' do
      expect().to eql()
    end
  end

  describe '#victory_check' do
    it 'prints player 1 won if @winner == 1 && @count < 9' do
      expect().to eql()
    end

    it 'invokes Interface.finisher if @winner == 1 && @count < 9' do
      expect().to eql()
    end

    it 'prints "player 2 won" if @winner == 2 && @count < 9' do
      expect().to eql()
    end

    it 'invokes Interface.finisher if @winner == 2 && @count < 9' do
      expect().to eql()
    end

    it 'prints DRAW if @count == 9' do
      expect().to eql()
    end
  end
end

# Logic

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

    it 'returns false if the move input is an integer' do
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
  end

  describe '#vertical' do
    it 'returns 0 if positions 1, 4 and 7 are not equaly marked' do
      game = [1, 2, 3, markx, 5, 6, 7, 8, 9]
      winner = WinChecks.vertical(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 2, 5 and 8 are not equaly marked' do
      game = [1, 2, 3, 4, 5, 6, 7, markx, 9]
      winner = WinChecks.vertical(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 3, 6 and 9 are not equaly marked' do
      game = [1, 2, markx, 4, 5, 6, 7, 8, 9]
      winner = WinChecks.vertical(game)
      expect(winner).to eql(0)
    end

    it 'returns 1 if positions 1, 4 and 7 are marked with a blue X' do
      game = [markx, 2, 3, markx, 5, 6, markx, 8, 9]
      winner = WinChecks.vertical(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 2, 5 and 8 are marked with a blue X' do
      game = [1, markx, 3, 4, markx, 6, 7, markx, 9]
      winner = WinChecks.vertical(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 3, 6 and 9 are marked with a blue X' do
      game = [1, 2, markx, 4, 5, markx, 7, 8, markx]
      winner = WinChecks.vertical(game)
      expect(winner).to eql(1)
    end

    it 'returns 2 if positions 1, 4 and 7 are marked with a pink O' do
      game = [marko, 2, 3, marko, 5, 6, marko, 8, 9]
      winner = WinChecks.vertical(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 2, 5 and 8 are marked with a pink O' do
      game = [1, marko, 3, 4, marko, 6, 7, marko, 9]
      winner = WinChecks.vertical(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 3, 6 and 9 are marked with a pink O' do
      game = [1, 2, marko, 4, 5, marko, 7, 8, marko]
      winner = WinChecks.vertical(game)
      expect(winner).to eql(2)
    end
  end

  describe '#horizontal' do
    it 'returns 0 if positions 1, 2 and 3 are not equaly marked' do
      game = [marko, 2, markx, marko, 5, 6, 7, 8, 9]
      winner = WinChecks.horizontal(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 4, 5 and 6 are not equaly marked' do
      game = [1, 2, 3, marko, markx, 6, 7, 8, 9]
      winner = WinChecks.horizontal(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 7, 8 and 9 are not equaly marked' do
      game = [1, 2, 3, 4, 5, 6, 7, marko, markx]
      winner = WinChecks.horizontal(game)
      expect(winner).to eql(0)
    end

    it 'returns 1 if positions 1, 2 and 3 are marked with a blue X' do
      game = [markx, markx, markx, 4, 5, 6, 7, 8, 9]
      winner = WinChecks.horizontal(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 4, 5 and 6 are marked with a blue X' do
      game = [1, 2, 3, markx, markx, markx, 7, 8, 9]
      winner = WinChecks.horizontal(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 7, 8 and 9 are marked with a blue X' do
      game = [1, 2, 3, 4, 5, 6, markx, markx, markx]
      winner = WinChecks.horizontal(game)
      expect(winner).to eql(1)
    end

    it 'returns 2 if positions 1, 2 and 3 are marked with a pink O' do
      game = [marko, marko, marko, 4, 5, 6, 7, 8, 9]
      winner = WinChecks.horizontal(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 4, 5 and 6 are marked with a pink O' do
      game = [1, 2, 3, marko, marko, marko, 7, 8, 9]
      winner = WinChecks.horizontal(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 7, 8 and 9 are marked with a pink O' do
      game = [1, 2, 3, 4, 5, 6, marko, marko, marko]
      winner = WinChecks.horizontal(game)
      expect(winner).to eql(2)
    end
  end

  describe '#diagonal' do
    it 'returns 0 if positions 1, 5 and 9 are not equaly marked' do
      game = [markx, 2, 3, 4, marko, 6, 7, 8, 9]
      winner = WinChecks.diagonal(game)
      expect(winner).to eql(0)
    end

    it 'returns 0 if positions 7, 5 and 3 are not equaly marked' do
      game = [1, 2, 3, 4, 5, 6, marko, markx, 9]
      winner = WinChecks.diagonal(game)
      expect(winner).to eql(0)
    end

    it 'returns 1 if positions 1, 5 and 9 are marked with a blue X' do
      game = [markx, 2, 3, 4, markx, 6, 7, 8, markx]
      winner = WinChecks.diagonal(game)
      expect(winner).to eql(1)
    end

    it 'returns 1 if positions 7, 5 and 3 are marked with a blue X' do
      game = [1, 2, markx, 4, markx, 6, markx, 8, 9]
      winner = WinChecks.diagonal(game)
      expect(winner).to eql(1)
    end

    it 'returns 2 if positions 1, 5 and 9 are marked with a pink O' do
      game = [marko, 2, 3, 4, marko, 6, 7, 8, marko]
      winner = WinChecks.diagonal(game)
      expect(winner).to eql(2)
    end

    it 'returns 2 if positions 3, 5 and 7 are marked with a pink O' do
      game = [1, 2, marko, 4, marko, 6, marko, 8, 9]
      winner = WinChecks.diagonal(game)
      expect(winner).to eql(2)
    end
  end
end
