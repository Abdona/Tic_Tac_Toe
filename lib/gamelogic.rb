# game_logic
# ##game board eg. 3x3 board
class Board
  attr_writer :board_cell

  def initialize(board_cell)
    @board_cell = board_cell
  end

  def display_board
    puts '+---+---+---+'
    puts "| #{@board_cell[0]} | #{@board_cell[1]} | #{@board_cell[2]} | "
    puts '+---+---+---+'
    puts "| #{@board_cell[3]} | #{@board_cell[4]} | #{@board_cell[5]} |"
    puts '+---+---+---+'
    puts "| #{@board_cell[6]} | #{@board_cell[7]} | #{@board_cell[8]} |"
    puts '+---+---+---+'
  end
end
