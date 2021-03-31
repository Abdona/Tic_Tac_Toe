#!/usr/bin/env ruby
puts "Welcome to Tic Tac Toe"
puts "please enter first player name"
first_player = gets.chomp
puts "please enter second player name"
second_player = gets.chomp
class Cell
    def initialize(value)
        @value = value
    end
    def prnt
        return @value
    end
end

sq11 = Cell.new(1)
sq12 = Cell.new(2)
sq13 = Cell.new(3)

sq21 = Cell.new(4)
sq22 = Cell.new(5)
sq23 = Cell.new(6)

sq31 = Cell.new(7)
sq32 = Cell.new(8)
sq33 = Cell.new(9)

puts "+---+---+---+
| #{sq11.prnt} | #{sq12.prnt} | #{sq13.prnt} |
+---+---+---+
| #{sq21.prnt} | #{sq22.prnt} | #{sq23.prnt} |
+---+---+---+
| #{sq31.prnt} | #{sq32.prnt} | #{sq33.prnt} |
+---+---+---+
"
