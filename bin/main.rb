#!/usr/bin/env ruby

require_relative '../lib/gamelogic.rb'

class Player
  attr_reader :val , :name
  def initialize(name, val)
    @name = name
    @val = val
  end

  def validate
    return true if @name =~ /\w/

    false
  end
end

class Cell
  attr_accessor :value
  def initialize(value)
    @value = value.to_s
  end

  def check_cell
    return false if @value == 'x' || @value == 'o'

    true
  end
end

public

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
  return false if param > 8 || param < 0

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
board_3x3.display_board
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
  cell_number = (gets.chomp.to_i) - 1
  until validate(cell_number)
    puts 'Invalid Input, please select an available cell from the board (1-9)'
    cell_number = (gets.chomp.to_i) - 1
  end
  until choose_cell(cell_number, board)
    cell_number = (gets.chomp.to_i) - 1
    until validate(cell_number)
      puts 'Invalid Input, please select an available cell from the board (1-9)'
      cell_number = (gets.chomp.to_i) - 1
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
  board_3x3.display_board
end
puts "#{first_player.name} is the winner"