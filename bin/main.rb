#!/usr/bin/env ruby

#this goes in the logic

def vcheck(arr)
  $winner = 0
  column =[]
  vind1 = 0
  vind2 = 3
  vind3 = 6
  while vind1 != 3
    column << arr[vind1]
    column << arr[vind2]
    column << arr[vind3]

    if column.all? { |x| x == 'X'.blue}
      $winner = 1
    elsif column.all? { |o| o == 'O'.pink }
      $winner = 2
    end
    column =[]
    vind1 += 1
    vind2 += 1
    vind3 += 1
  end
  return $winner
end

def hcheck(arr)
  $winner = 0
  row =[]
  hind1 = 0
  hind2 = 1
  hind3 = 2
  while hind1 < 7
    row << arr[hind1]
    row << arr[hind2]
    row << arr[hind3]

    if row.all? { |x| x == 'X'.blue}
      $winner = 1
    elsif row.all? { |o| o == 'O'.pink }
      $winner = 2
    end
      row =[]
    hind1 += 3
    hind2 += 3
    hind3 += 3
  end
  return $winner
end

def dcheck(arr)
  $winner = 0
  diagonal =[]
  dind1 = 0
  dind2 = 4
  dind3 = 8
  while dind1 < 7
    diagonal << arr[dind1]
    diagonal << arr[dind2]
    diagonal << arr[dind3]

    if diagonal.all? { |x| x == 'X'.blue}
      $winner = 1
    elsif diagonal.all? { |o| o == 'O'.pink }
      $winner = 2
    end
    diagonal =[]
    dind1 += 6
    dind3 -= 6
  end
  return $winner
end

#input checking methods
def valid_check(param)
  until param.match(/[1-9]/) && param.length < 2
    return false
  end
end

def repeat_check(param)
  index = param.to_i
  index -=1
  if $board[index].is_a? String
    return false
  end
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


#this one goes in main

#colors
class String
  # colorization
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
#playing ends


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