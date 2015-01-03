# Tic Tac Toe

require 'pry'

PLAYER_MARK = "X"
COMPUTER_MARK = "O"

board = {
  a: "1", b: "2", c: "3", 
  d: "4", e: "5", f: "6", 
  g: "7", h: "8", i: "9"
}

board_drawing = """
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

def win?
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
end

loop do
  draw_board(board)
  while true
    puts "Enter the number from the board to make your move:"
    move = gets.chomp
    break if valid_move?(move, board)
    puts "You cannot put your mark there! Please enter empty 1-9 field!"
  end
  puts "now other player moves"
  # update_board
  update_board(move, "X", board)
  # check_win
end

# while !win? # or loop do
#   player_move
#   check_winner # if win? break
#   update and draw board
#   switch_player
#   computer_move
#   check_winner # if win? break
#   update and draw board
#   switch_player # is it really necessary then? player and computer move should be enough
#   perhaps nest another loop checking for play_again if yes = reset board
# end
