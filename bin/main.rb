#!/usr/bin/env ruby
require_relative '../lib/logic'
#Class interface
#Board pringing method
def print_board(param)
  print "\n  #{param[0]}"
  print " ¦ ".yellow
  print "#{param[1]}"
  print " ¦ ".yellow
  print "#{param[2]} \n "
  puts '-----------'.yellow
  print "  #{param[3]}"
  print " ¦ ".yellow
  print "#{param[4]}"
  print " ¦ ".yellow
  print "#{param[5]} \n "
  puts '-----------'.yellow
  print "  #{param[6]}"
  print " ¦ ".yellow
  print "#{param[7]}"
  print " ¦ ".yellow
  print "#{param[8]}  \n "
end

#Input checking methods
def error_entry(parameter)
  while valid_check(parameter) == false
    puts "number 1-9 only".red
    parameter = gets.chomp!
  end
  $valid_input = parameter
end

def repeat_entry (parameter)
  while repeat_check(parameter) == false
    puts "that has already been done!".red
    parameter = gets.chomp!
    error_entry(parameter)    
  end
  $final_input = parameter
end

# victory checking methods
def victory_check(param)
  if param == 1
    $count = 9
    print "\n #{$player1}"
    print " wins!".green
  elsif param == 2
    $count = 9
    print "\n #{$player2}"
    print" wins!".green
  end
end

#playing method
def playing (player, mark)
  puts "\n what is #{player}'s move?"
  entry = gets.chomp!
  error_entry(entry)
  repeat_entry($valid_input)
  $input = $final_input.to_i
  $input -= 1
  $board[$input] = mark
end

#this is the game

$board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
$count = 0
puts "Welcome to Tic Tac Toe by Tenny and Fer"

puts "\nWhat is the name of the first player?".blue
$player1 = gets.chomp!.blue

puts "\nWhat is the name of the second player?".pink
$player2 = gets.chomp!.pink

print_board($board)

while $count != 9
  $count += 1
  if $count.odd?
    playing($player1, 'X'.blue)
  else
    playing($player2, 'O'.pink)
  end
  print_board($board)
  vcheck($board)
  victory_check($winner)
  hcheck($board)
  victory_check($winner)
  dcheck($board)
  victory_check($winner)
end