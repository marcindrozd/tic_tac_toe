# Tic Tac Toe

require 'pry'

PLAYER_MARK = "X"
COMPUTER_MARK = "O"

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
  # replace the values with either X or O
  # hash.key(value) => returns key
  board[board.key(value)] = mark
end

def reset_board
  # reset board to default values if play again // refactor into loop
  board[:a] = 1
  board[:b] = 2
  board[:c] = 3
  board[:d] = 4
  board[:e] = 5
  board[:f] = 6
  board[:g] = 7
  board[:h] = 8
  board[:i] = 9
end

def switch_player
  # if Player then current player = Computer
  # if Computer then current player = Player
end

def check_winner
  # current player
end

def player_move
  # take the input and update the board
  puts "Enter the number from the board to make your move:"
  move = gets.chomp if valid_move?
end

def computer_move
  # build array of possible moves and select one randomly
  # select board.values if value != "X"
end

def valid_move?(move, board)
  # check if value exists if not = invalid move
  # e.g. board.values.include? "1"
  board.values.include?(move)
end

def win?(board)
# check if values of winning condition are the same
# check if all values have been replaced with either X or Y for draw
# win if value of a = b = c
#         d = e = f
#         g = h = i
#         a = d = g
#         b = e = h
#         c = f = i
#         a = e = i
#         c = e = g
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
  if !move_possible?(board)
    puts "It's a tie!"
    break
  end
  draw_board(board)
  # check if any moves are still possible
  while true
    puts "Enter the number from the board to make your move:"
    move = gets.chomp
    break if valid_move?(move, board)
    puts "You cannot put your mark there! Please enter empty 1-9 field!"
  end
  # update_board
  update_board(move, "X", board)
  # check_win
  draw_board(board)
  if win?(board)
    puts "Player wins!"
    break
  end
  # computer move
  # check if any moves are still possible
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
    puts "Computer wins!"
    break
  end
end

