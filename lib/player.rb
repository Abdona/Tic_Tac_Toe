class Player
  attr_reader :val, :name

  def initialize(name, val)
    @name = name
    @val = val
  end

  def validate
    return true if @name =~ /\w/

    false
  end
end
