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

# Logic

# Creates a board object which is an array from 1 to 9
class GameBoard
  attr_accessor :board
  def initialize
    @board = Array(1..9)
  end
end

# Creates an object for each new player with name and mark (X or O)
class Players
  attr_reader :name
  attr_reader :mark
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
end

# Checks for winning conditions and provides an output accordingly
class WinChecks
  def self.global(board)
    @board = board
    @revision = []
    @revision << WinChecks.vertical(@board)
    @revision << WinChecks.horizontal(@board)
    @revision << WinChecks.diagonal(@board)
    if @revision.any? { |i| i == 1 }
      1
    elsif @revision.any? { |i| i == 2 }
      2
    else
      0
    end
  end

  def self.vertical(board)
    @board = board
    @winner = 0
    @column = []
    @vind1 = 0
    @vind2 = 3
    @vind3 = 6
    while @vind1 != 3
      @column << @board[@vind1]
      @column << @board[@vind2]
      @column << @board[@vind3]

      if @column.all? { |x| x == 'X'.blue }
        @winner = 1
      elsif @column.all? { |o| o == 'O'.pink }
        @winner = 2
      end
      @column = []
      @vind1 += 1
      @vind2 += 1
      @vind3 += 1
    end
    @winner
  end

  def self.horizontal(board)
    @board = board
    @winner = 0
    @row = []
    @hind1 = 0
    @hind2 = 1
    @hind3 = 2
    while @hind1 < 7
      @row << @board[@hind1]
      @row << @board[@hind2]
      @row << @board[@hind3]

      if @row.all? { |x| x == 'X'.blue }
        @winner = 1
      elsif @row.all? { |o| o == 'O'.pink }
        @winner = 2
      end
      row = []
      @hind1 += 3
      @hind2 += 3
      @hind3 += 3
    end
    @winner
  end

  def self.diagonal(board)
    @board = board
    @winner = 0
    @diagonal = []
    @dind1 = 0
    @dind2 = 4
    @dind3 = 8
    while @dind1 < 7
      @diagonal << @board[@dind1]
      @diagonal << @board[@dind2]
      @diagonal << @board[@dind3]

      if @diagonal.all? { |x| x == 'X'.blue }
        @winner = 1
      elsif @diagonal.all? { |o| o == 'O'.pink }
        @winner = 2
      end
      @diagonal = []
      @dind1 += 6
      @dind3 -= 6
    end
    @winner
  end
end
