class Table

  attr_reader :size_x, :size_y

  def initialize(x, y = nil)
    @size_x = x
    @size_y = y || x
    validate!
  end

  private
  def validate!
    raise ArgumentError.new("X position must be a positive number") unless @size_x >= 0
    raise ArgumentError.new("Y position must be a positive number") unless @size_y >= 0
  end

end
