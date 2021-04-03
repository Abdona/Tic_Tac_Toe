#!/usr/bin/env ruby
class Player
  def initialize(name, val)
    @name = name
    @val = val
  end

  def getter_val
    @val
  end
end

class Cell
  def initialize(value)
    @value = value.to_s
  end

  def prnt
    @value
  end

  def check_cell
    return false if @value == 'x' || @value == 'o'

    true
  end

  def change_cell(parm)
    @value = parm
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

sq11 = Cell.new('1')
sq12 = Cell.new('2')
sq13 = Cell.new('3')

sq21 = Cell.new('4')
sq22 = Cell.new('5')
sq23 = Cell.new('6')

sq31 = Cell.new('7')
sq32 = Cell.new('8')
sq33 = Cell.new('9')
board = ['0', sq11, sq12, sq13, sq21, sq22, sq23, sq31, sq32, sq33]

puts "+---+---+---+
| #{sq11.prnt} | #{sq12.prnt} | #{sq13.prnt} |
+---+---+---+
| #{sq21.prnt} | #{sq22.prnt} | #{sq23.prnt} |
+---+---+---+
| #{sq31.prnt} | #{sq32.prnt} | #{sq33.prnt} |
+---+---+---+
"
value = %w[o x]
r_val = rand(2)
puts 'Welcome to Tic Tac Toe'
puts 'please enter first player name'
first_player = Player.new(gets.chomp, value[r_val])
puts 'please enter second player name'
second_player = Player.new(gets.chomp, value.reject { |itm| itm == value[r_val] })
i = 0
player_turn = 'one'

while i < 9
  i += 1
  puts "player #{player_turn} turn"
  cell_number = gets.chomp.to_i
  until choose_cell(cell_number, board)
    cell_number = gets.chomp.to_i
    choose_cell(cell_number, board)
  end

  if player_turn == 'one'
    board[cell_number].change_cell(first_player.getter_val)
  else
    board[cell_number].change_cell(second_player.getter_val)
  end
  player_turn = player_turn.next_player

  puts "+---+---+---+
| #{sq11.prnt} | #{sq12.prnt} | #{sq13.prnt} |
+---+---+---+
| #{sq21.prnt} | #{sq22.prnt} | #{sq23.prnt} |
+---+---+---+
| #{sq31.prnt} | #{sq32.prnt} | #{sq33.prnt} |
+---+---+---+
"
end
