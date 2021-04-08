# game_logic
# ##game board eg. 3x3 board
class Board
  attr_writer :board_cell

  def initialize(board_cell)
    @board2d = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] # #2d array [[1,2,3][4,5,6][7,8,9]]
    @board_cell = board_cell # #1d array [1,2,3,4,5,6,7,8,9]
  end

  private

  def to_2d
    for i in (0...3)
      for j in (0...3)
        @board2d[i][j] = @board_cell[j + (i * 3)]
      end
    end
  end

  public

  def check_win
    to_2d
    x = %w[x x x]
    o = %w[o o o]
    for i in @board2d # #check horizontal
      return 'x' if i == x
      return 'o' if i == o
    end
    for i in @board2d.transpose # #check vertical
      return 'x' if i == x
      return 'o' if i == o
    end
    check_diagonal
  end
  
  private
  def check_diagonal
    return @board2d[1][1] if @board2d[1][1] == @board2d[0][0] && @board2d[1][1] == @board2d[2][2] # ##check diagonal
    return @board2d[1][1] if @board2d[1][1] == @board2d[0][2] && @board2d[1][1] == @board2d[2][0]

    false
  end
end
