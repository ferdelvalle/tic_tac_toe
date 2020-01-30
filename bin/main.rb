#!/usr/bin/env ruby
puts "Hello world!"
# here goes the interface
board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
count = 0
input = 0
GameFinished = 1

puts "What is the name of the first player?"
player1 =  gets.chomp!

puts "What is the name of the second player?"
player2 =  gets.chomp!

puts "  #{board[0]}  | #{board[1]} | #{board[2]}  "
puts "--------------"
puts "  #{board[3]}  | #{board[4]} | #{board[5]}  "
puts "--------------"
puts "  #{board[6]}  | #{board[7]} | #{board[8]}  "

# here goes code needed for the milestone but that otherwise
# would be in the logic

# this also has to check if the input is an integer between 1 and 9 and if the position has been already been chosen ask for another input
while GameFinished == false do
  count += 1
  if count % 2 == 1
    puts "what is #{player1}'s move?"
    input = gets.chomp!.to_i
    input -= 1
    board[input] = "X"
  else 
    puts "what is #{player2}'s move?"
    input = gets.chomp!.to_i
    input -= 1 
    board[input] = "O"
  end
end

  puts "  #{board[0]}  | #{board[1]} | #{board[2]}  "
  puts "--------------"
  puts "  #{board[3]}  | #{board[4]} | #{board[5]}  "
  puts "--------------"
  puts "  #{board[6]}  | #{board[7]} | #{board[8]}  "
  
  GameFinished = true if count == 10
end
