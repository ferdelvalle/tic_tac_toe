#!/usr/bin/env ruby
require_relative '../lib/logic'

#Responsible for collecting information and displaying it
class Interface
  # Prints the board
  def self.display(param)
    @parameter = param
    print "\n  #{@parameter[0]}"
    print " ¦ ".yellow
    print "#{@parameter[1]}"
    print " ¦ ".yellow
    print "#{@parameter[2]} \n "
    puts '-----------'.yellow
    print "  #{@parameter[3]}"
    print " ¦ ".yellow
    print "#{@parameter[4]}"
    print " ¦ ".yellow
    print "#{@parameter[5]} \n "
    puts '-----------'.yellow
    print "  #{@parameter[6]}"
    print " ¦ ".yellow
    print "#{@parameter[7]}"
    print " ¦ ".yellow
    print "#{@parameter[8]}  \n "
  end

  # Asks for a player's move, check if it's valid and if it is, returns it as integer
  def self.collect_move(move, board)
    @move = move
    @board = board
    while MovesInput.valid_check(@move) == false || MovesInput.repeat_check(@board, @move) == false
      puts "Invalid input or space already taken".red
      @move = gets.chomp!
    end
    return @move.to_i
  end

  # Checks if there is a winner, if there is, it finishes the game and announces the winner.
  def self.victory_check (winner, player1, player2)
    @winner = winner
    @player1 = player1
    @player2 = player2
    if @winner == 1
      print "\n#{player1}"" Wins!".green
      $count = 9
    elsif @winner == 2
      print "\n#{player2}"" Wins!".green
      $count = 9
    end
  end
end

# Game

puts "Wellcome to Tic Tac Toe by Tenny and Fer".green
game = GameBoard.new
puts "\nWhat is the name of the first player?".blue
player1 =  Players.new(gets.chomp.blue , "X".blue)
puts "\nWhat is the name of the second player?".pink
player2 =  Players.new(gets.chomp.pink , "O".pink)
$count = 0
Interface.display(game.board)
while $count !=9
  $count +=1
  if $count.odd?
    # Player 1 move
    puts "\n What is #{player1.name}'s move?'"
    MovesInput.making_move(game.board, Interface.collect_move(gets.chomp, game.board), player1.mark)
  else
    #player 2 move
    puts "\n What is #{player2.name}'s move?'"
    MovesInput.making_move(game.board, Interface.collect_move(gets.chomp, game.board), player2.mark)
  end
  Interface.display(game.board)
  Interface.victory_check(WinChecks.global(game.board), player1.name, player2.name)
end