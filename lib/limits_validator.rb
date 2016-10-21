class LimitsValidator

  def initialize(table)
    @limit_x = table.size_x
    @limit_y = table.size_y
  end

  def valid_position?(x,y)
    x >=0 && x < @limit_x && y >=0 && y < @limit_y
  end

  def valid_move?(position, direction)
    case direction
    when 0, 180
      new_y = position[1] + (direction == 0 ? 1 : -1)
      new_y >=0 && new_y < @limit_y
    when 90, 270
      new_x = position[0] + (direction == 90 ? 1 : -1)
      new_x >=0 && new_x < @limit_x
    end
  end

end
