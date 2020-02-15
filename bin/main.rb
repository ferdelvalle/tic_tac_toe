#!/usr/bin/env ruby
require_relative '../lib/logic'

# Responsible for collecting information and displaying it
class Interface
  # Prints the board
  # prints 17 strings
  def self.display(param)
    @parameter = param
    print "\n  #{@parameter[0]}"
    print ' ¦ '.yellow
    print "#{@parameter[1]} "
    print '¦ '.yellow
    print "#{@parameter[2]} \n "
    puts '-----------'.yellow
    print "  #{@parameter[3]}"
    print ' ¦ '.yellow
    print "#{@parameter[4]} "
    print '¦ '.yellow
    print "#{@parameter[5]} \n "
    puts '-----------'.yellow
    print "  #{@parameter[6]}"
    print ' ¦ '.yellow
    print "#{@parameter[7]} "
    print '¦ '.yellow
    print "#{@parameter[8]}  \n "
  end

  # Asks for a player's move, check if it's valid and if it is, returns it as integer
  # this should return either a string "error" or an integer
  def self.collect_move(move, board)
    @move = move
    @board = board
    while MovesInput.valid_check(@move) == false || MovesInput.repeat_check(@board, @move) == false
      puts 'Invalid input or space already taken'.red
      @move = gets.chomp!
    end
    @move.to_i
  end

  # Keeps the turn count
  # return an integer
  attr_accessor :count
  @count = 0

  # Finishes the game after turn 9
  # returns either false if @count < 9 or true if @count = 9
  def self.game_ending
    return true if @count != 9
  end

  # Finishes the game after victoru
  # makes @count == 9
  def self.finisher
    @count = 9
  end

  # Increaser
  # returns input +1
  def self.increaser
    @count += 1
  end

  # Assigned turns
  # returns false if @count % 2 == 0 and true if @count %1 == 1
  def self.turn_odd
    return true if @count.odd?
  end
  # Checks if there is a winner, if there is, it finishes the game and announces the winner.
  # if winner == 1 returns a string and invokes finisher
  # if winner == 2 returns a string and invokes finisher
  # if winner == 0 && @turn == 9, returns a string

  def self.victory_check(winner, player1, player2)
    @winner = winner
    @player1 = player1
    @player2 = player2
    @turn = @count
    if @winner == 1 && @turn < 9
      print "\n#{player1} Wins!"
      Interface.finisher
    elsif @winner == 2 && @turn < 9
      print "\n#{player2} Wins!"
      Interface.finisher
    elsif @turn == 9
      print "\n DRAW".green
    end
  end
end

# Game

puts 'Wellcome to Tic Tac Toe by Tenny and Fer'.green
game = GameBoard.new
puts "\n What is the name of the first player?".blue
player1 = Players.new(gets.chomp.blue, 'X'.blue)
puts "\n What is the name of the second player?".pink
player2 = Players.new(gets.chomp.pink, 'O'.pink)
Interface.display(game.board)

while Interface.game_ending
  Interface.increaser
  if Interface.turn_odd
    # Player 1 move
    puts "\n What is #{player1.name}'s move?"
    MovesInput.making_move(game.board, Interface.collect_move(gets.chomp, game.board), player1.mark)
  else
    # player 2 move
    puts "\n What is #{player2.name}'s move?"
    MovesInput.making_move(game.board, Interface.collect_move(gets.chomp, game.board), player2.mark)
  end
  Interface.display(game.board)
  Interface.victory_check(WinChecks.global(game.board), player1.name, player2.name)
end
