#!/usr/bin/env ruby

require_relative '../lib/board'
require_relative '../lib/player'
require_relative '../lib/cell'

public

def display_board(param)
  puts '+---+---+---+'
  puts "| #{param[0]} | #{param[1]} | #{param[2]} | "
  puts '+---+---+---+'
  puts "| #{param[3]} | #{param[4]} | #{param[5]} |"
  puts '+---+---+---+'
  puts "| #{param[6]} | #{param[7]} | #{param[8]} |"
  puts '+---+---+---+'
end

def next_player
  return 'two' if self == 'one'

  'one'
end

def choose_cell(parm, boar_parm)
  if boar_parm[parm].check_cell
    true
  else
    puts "you can't play in this cell"
    false
  end
end

def validate(param)
  return false if param > 8 || param.negative?

  true
end

sq11 = Cell.new('1')
sq12 = Cell.new('2')
sq13 = Cell.new('3')

sq21 = Cell.new('4')
sq22 = Cell.new('5')
sq23 = Cell.new('6')

sq31 = Cell.new('7')
sq32 = Cell.new('8')
sq33 = Cell.new('9')
board1 = [sq11.value, sq12.value, sq13.value, sq21.value, sq22.value, sq23.value, sq31.value, sq32.value, sq33.value]

board = [sq11, sq12, sq13, sq21, sq22, sq23, sq31, sq32, sq33]

board_3x3 = Board.new(board1)
display_board(board1)
value = %w[o x]
r_val = rand(2)
puts 'Welcome to Tic Tac Toe'
puts 'please enter first player name'
first_player = Player.new(gets.chomp, value[r_val])
until first_player.validate
  puts 'please enter a valid player name'
  first_player = Player.new(gets.chomp, value[r_val])
end
puts 'please enter second player name'
second_player = Player.new(gets.chomp, value.reject { |itm| itm == value[r_val] }[0])
until second_player.validate
  puts 'please enter a valid player name'
  second_player = Player.new(gets.chomp, value.reject { |itm| itm == value[r_val] }[0])
end
i = 0
player_turn = 'one'

out1 = "#{first_player.name} will play with #{value[r_val]} and"
out2 = " #{second_player.name} will play with #{value.reject do |itm|
  itm == value[r_val]
end [0]} "

puts out1 + out2

while i < 9
  i += 1
  puts player_turn == 'one' ? "It's #{first_player.name}'s' turn!" : "It's #{second_player.name}'s' turn!"
  puts 'please select an available cell from the board (1-9)'
  cell_number = gets.chomp.to_i - 1
  until validate(cell_number)
    puts 'Invalid Input, please select an available cell from the board (1-9)'
    cell_number = gets.chomp.to_i - 1
  end
  until choose_cell(cell_number, board)
    cell_number = gets.chomp.to_i - 1
    until validate(cell_number)
      puts 'Invalid Input, please select an available cell from the board (1-9)'
      cell_number = gets.chomp.to_i - 1
    end
    choose_cell(cell_number, board)
  end

  if player_turn == 'one'
    board[cell_number].value = first_player.val
    board1[cell_number] = first_player.val
  else
    board[cell_number].value = second_player.val
    board1[cell_number] = second_player.val
  end
  player_turn = player_turn.next_player
  display_board(board1)
  board_3x3.to_2d
  win_result = board_3x3.check_win
  break if win_result
end
outt1 = "#{first_player.name} is the winner"
outt2 = "#{second_player.name} is the winner"
if win_result == first_player.val
  puts outt1
else
  puts(win_result == second_player.val ? outt2 : 'Game is draw')
end
