# Tic Tac Toe

board = {
  a: "1", b: "2", c: "3", 
  d: "4", e: "5", f: "6", 
  g: "7", h: "8", i: "9"
}

def draw_board(board)
  puts """
     |     |     
  #{board[:a]}  |  #{board[:b]}  |  #{board[:c]}   
     |     |
-----+-----+-----
     |     |     
  #{board[:d]}  |  #{board[:e]}  |  #{board[:f]}
     |     |
-----+-----+-----
     |     |     
  #{board[:g]}  |  #{board[:h]}  |  #{board[:i]}
     |     |
"""
end

def update_board(value, mark, board)
  board[board.key(value)] = mark
end

def reset_board(board)
  board[:a] = "1"
  board[:b] = "2"
  board[:c] = "3"
  board[:d] = "4"
  board[:e] = "5"
  board[:f] = "6"
  board[:g] = "7"
  board[:h] = "8"
  board[:i] = "9"
end

def valid_move?(move, board)
  board.values.include?(move)
end

def win?(board)
  if (board[:a] == board[:b] && board[:b] == board[:c]) ||
    (board[:d] == board[:e] && board[:e] == board[:f]) ||
    (board[:g] == board[:h] && board[:h] == board[:i]) ||
    (board[:a] == board[:d] && board[:d] == board[:g]) ||
    (board[:b] == board[:e] && board[:e] == board[:h]) ||
    (board[:c] == board[:f] && board[:f] == board[:i]) ||
    (board[:a] == board[:e] && board[:e] == board[:i]) ||
    (board[:c] == board[:e] && board[:e] == board[:g])
    true
  end
end

def move_possible?(board)
  possible_moves = board.values
  possible_moves.delete("X")
  possible_moves.delete("O")
  !possible_moves.empty?
end

while true
  puts "TIC * TAC * TOE"
  while true
    if !move_possible?(board)
      puts "It's a tie!"
      break
    end
    draw_board(board)

    while true
      puts "Enter the number from the board to make your move:"
      move = gets.chomp
      break if valid_move?(move, board)
      puts "You cannot put your mark there! Please enter empty 1-9 field!"
    end

    update_board(move, "X", board)
    draw_board(board)

    if win?(board)
      puts "Player won!"
      break
    end

    if !move_possible?(board)
      puts "It's a tie!"
      break
    end

    possible_moves = board.values
    possible_moves.delete("X")
    possible_moves.delete("O")
    move = possible_moves.sample
    update_board(move, "O", board)
    draw_board(board)

    if win?(board)
      puts "Computer won!"
      break
    end
  end
  puts "Play again? (y/n)"
  response = gets.chomp.downcase
  break if response != "y"
  reset_board(board)
end

puts "Thank you! Bye!"
