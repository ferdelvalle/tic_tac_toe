#!/usr/bin/env ruby
board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
count = 0
GAME_FINISHED = false

puts 'What is the name of the first player?'
player1 = gets.chomp!

puts 'What is the name of the second player?'
player2 = gets.chomp!

def print_board(param)
  puts "  #{param[0]}  | #{param[1]} | #{param[2]}  "
  puts '--------------'
  puts "  #{param[3]}  | #{param[4]} | #{param[5]}  "
  puts '--------------'
  puts "  #{param[6]}  | #{param[7]} | #{param[8]}  "
end

print_board(board)

while GAME_FINISHED == false
  count += 1
  if count.odd?
    puts "what is #{player1}'s move?"
    # logic has to check if the position has already been chosen by a player and if so, ask for another move
    # Logic should also make sure the input is an integer between 1 to 9, if not, ask for a valid input
    input = gets.chomp!.to_i
    input -= 1
    board[input] = 'X'
  else
    puts "what is #{player2}'s move?"
    # logic has to check if the position has already been chosen by a player and if so, ask for another move
    # Logic should also make sure the input is an integer between 1 to 9, if not, ask for a valid input
    input = gets.chomp!.to_i
    input -= 1
    board[input] = 'O'
  end
  print_board(board)
  # here logic should chech if someone has won
  GAME_FINISHED = true if count == 10
end
