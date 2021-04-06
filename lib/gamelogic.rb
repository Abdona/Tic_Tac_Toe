# game_logic
# ##game board eg. 3x3 board
class Board
  attr_writer :board_cell
  def initialize(board_cell)
    @board2d = [[1,2,3],[4,5,6],[7,8,9]] ##2d array [[1,2,3][4,5,6][7,8,9]]
    @board_cell = board_cell ##1d array [1,2,3,4,5,6,7,8,9]
  end

  def to_2d
    for i in (0...3)
        for j in (0...3)
            @board2d [i][j] = @board_cell [j + (i*3)]
        end
        # @board_cell1.shift(3)
    end
     print @board2d
    # print @board_cell
  end

  public

  def display_board
    puts '+---+---+---+'
    puts "| #{@board_cell[0]} | #{@board_cell[1]} | #{@board_cell[2]} | "
    puts '+---+---+---+'
    puts "| #{@board_cell[3]} | #{@board_cell[4]} | #{@board_cell[5]} |"
    puts '+---+---+---+'
    puts "| #{@board_cell[6]} | #{@board_cell[7]} | #{@board_cell[8]} |"
    puts '+---+---+---+'
  end
  
  def check_vertical_horinzontal
    x = ['x','x','x']
    o = ['o','o','o']
    for i in @board2d
        if i == x
            return 'x'
        elsif i == o
            return 'o'
        end
    end
    for i in @board2d.transpose
      if i == x
          return 'x'
      elsif i == o
          return 'o'
      end
    end
    return false
  end
end

