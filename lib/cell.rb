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
