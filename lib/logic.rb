# Here is where the game logic goes

# module board

board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
count = 0
GAME_FINISHED = false

def print_board(param)
  puts "  #{param[0]}  | #{param[1]} | #{param[2]}  "
  puts '--------------'
  puts "  #{param[3]}  | #{param[4]} | #{param[5]}  "
  puts '--------------'
  puts "  #{param[6]}  | #{param[7]} | #{param[8]}  "
end
# ends module board

#class mechanics

# include module board

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
  # here logic should chech if someone has won
  GAME_FINISHED = true if count == 9 || if finisher = 1
end

# class checkers
def vcheck(arr)
  winner = 0
  column =[]
  vind1 = 0
  vind2 = 3
  vind3 = 6
  while vind1 != 3
    column << arr[vind1]
    column << arr[vind2]
    column << arr[vind3]

    if column.all? { |x| x == "X"}
      winner = 1
    elsif column.all? { |o| o == "O" }
      winner = 2
    end
    column =[]
    vind1 += 1
    vind2 += 1
    vind3 += 1
    puts "no vertical" if winner == 0
  end
end

def hcheck(arr)
  winner = 0
  row =[]
  hind1 = 0
  hind2 = 1
  hind3 = 2
  while hind1 < 7
    row << arr[hind1]
    row << arr[hind2]
    row << arr[hind3]

    if row.all? { |x| x == "X"}
      winner = 1
    elsif row.all? { |o| o == "O" }
      winner = 2
    end
      row =[]
    hind1 += 3
    hind2 += 3
    hind3 += 3
    puts "no horizontal " if winner == 0
  end
end

def dcheck(arr)
  winner = 0
  diagonal =[]
  dind1 = 0
  dind2 = 4
  dind3 = 8
  while dind1 < 7
    diagonal << arr[dind1]
    diagonal << arr[dind2]
    diagonal << arr[dind3]

    if diagonal.all? { |x| x == "X"}
      winner = 1
    elsif diagonal.all? { |o| o == "O" }
      winner = 2
    end
    diagonal =[]
    dind1 += 6
    dind3 -= 6
    puts "no diagonal" if winner == 0
  end
end
#ends class checkers




