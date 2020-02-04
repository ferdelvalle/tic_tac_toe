# Here is where the game logic goes
# Class - Input checking
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

#Class String
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

#Class linear check

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
