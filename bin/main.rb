#!/usr/bin/env ruby
require_relative '../lib/logic'

# Game

puts 'Wellcome to Tic Tac Toe by Tenny and Fer'.green
game = GameBoard.new
puts "\n What is the name of the first player?".blue
player1 = Players.new(gets.chomp.blue, 'X'.blue)
puts "\n What is the name of the second player?".pink
player2 = Players.new(gets.chomp.pink, 'O'.pink)
print Interface.display(game.board)

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
  print Interface.display(game.board)
  print Interface.victory_check(WinChecks.global(game.board), player1.name, player2.name)
end
