# Adds colors to the String class
class String
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end
end

# Responsible for collecting information and displaying it
class Interface
  attr_accessor :count
  @count = 0

  # returns the board
  def self.display(param)
    @parameter = param
    @centerdiv = ' ¦ '.yellow
    @leftdiv = '¦ '.yellow
    @rowdiv = "\n -----------".yellow
    "\n  #{@parameter[0]}#{@centerdiv}#{@parameter[1]} #{@leftdiv}#{@parameter[2]}  #{@rowdiv}\n  #{@parameter[3]}#{@centerdiv}#{@parameter[4]} #{@leftdiv}#{@parameter[5]}  #{@rowdiv}\n  #{@parameter[6]}#{@centerdiv}#{@parameter[7]} #{@leftdiv}#{@parameter[8]}  \n "
  end

  # Checks if there is a winner, if there is, it finishes the game and announces the winner.
  def self.victory_check(winner, player1, player2)
    @winner = winner
    @player1 = player1
    @player2 = player2
    @turn = @count
    if @winner == 1 && @turn < 9
      Interface.finisher
      "\n#{player1} Wins! \n"
    elsif @winner == 2 && @turn < 9
      Interface.finisher
      "\n#{player2} Wins! \n"
    elsif @turn == 9
      "\n DRAW \n".green
    end
  end

  # Finishes the game after turn 9
  def self.count_giver
    @count
  end

  def self.game_ending(param)
    @param = param
    return true if @param != 9
    return false if @param == 9
  end

  # Finishes the game after victory
  def self.finisher
    @count = 9
  end

  # Increaser
  def self.increaser
    @count += 1
  end

  # Assignes turns
  def self.turn_odd
    if @count.odd?
      true
    else
      false
    end
  end
end

# Creates a board object which is an array from 1 to 9
class GameBoard
  attr_accessor :board
  def initialize
    @board = Array(1..9)
  end
end

# Creates an object for each new player with name and mark (X or O)
class Players
  attr_reader :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

# Makes the moves
class MovesInput
  # Implementes the chosen move
  def self.making_move(board, move, mark)
    @move = move
    @move -= 1
    @mark = mark
    board[@move] = @mark
  end

  # Checks if the move input is valid
  def self.valid_check(input)
    @input = input
    return false until @input.match(/[1-9]/) && @input.length < 2
  end

  # Checks if the move has already been chosen
  def self.repeat_check(board, input)
    @index = input.to_i
    @index -= 1
    return false if board[@index].is_a? String
  end

  def self.universal_check(board, move)
    @move = move
    @board = board
    if MovesInput.valid_check(@move) == false || MovesInput.repeat_check(@board, @move) == false
      false
    else
      true
    end
  end
end

# Checks for winning conditions and provides an output accordingly
class WinChecks
  def self.check(board, index1, index2, index3)
    @board = board
    @index1 = index1
    @index2 = index2
    @index3 = index3
    @linecheck = [@board[@index1], @board[index2], @board[@index3]]
    if @linecheck.all? { |x| x == 'X'.blue }
      1
    elsif @linecheck.all? { |o| o == 'O'.pink }
      2
    else
      0
    end
  end

  def self.global(board)
    @board = board
    @lines = [[0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]]
    @check_array = []
    @lines.each { |set| @check_array << WinChecks.check(@board, set[0], set[1], set[2]) }
    return 1 if @check_array.any? { |x| x == 1 }
    return 2 if @check_array.any? { |o| o == 2 }
    return 0 if @check_array.all? { :zero? }
  end
end
