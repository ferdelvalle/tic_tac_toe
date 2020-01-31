#!/usr/bin/env ruby
board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
count = 0
input = 0
GameFinished = false

puts "What is the name of the first player?"
player1 =  gets.chomp!

puts "What is the name of the second player?"
player2 =  gets.chomp!

def printBoard (i)
  puts "  #{i[0]}  | #{i[1]} | #{i[2]}  "
  puts "--------------"
  puts "  #{i[3]}  | #{i[4]} | #{i[5]}  "
  puts "--------------"
  puts "  #{i[6]}  | #{i[7]} | #{i[8]}  "
end

printBoard(board)

while GameFinished == false do
  count += 1
  if count % 2 == 1
    puts "what is #{player1}'s move?"
    # logic has to check if the position has already been chosen by a player and if so, ask for another move
    # Logic should also make sure the input is an integer between 1 to 9, if not, ask for a valid input
    input = gets.chomp!.to_i
    input -= 1
    board[input] = "X"
  else 
    puts "what is #{player2}'s move?"
    # logic has to check if the position has already been chosen by a player and if so, ask for another move
    # Logic should also make sure the input is an integer between 1 to 9, if not, ask for a valid input
    input = gets.chomp!.to_i
    input -= 1 
    board[input] = "O"
  end
  printBoard(board)
  #here logic should chech if someone has won
  GameFinished = true if count == 10
end




