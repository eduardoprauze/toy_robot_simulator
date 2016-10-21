class Robot
  require_relative 'directions'
  attr_accessor :current_position, :direction, :is_placed

  def initialize
    @direction = 0
    @current_position = [0,0]
    @is_placed = false
  end

  def placed?
    @is_placed ? true : (puts "Robot is not placed yet."; false)
  end

  def place
    @is_placed = true
  end

  def report_position
    [@current_position, Directions.get_name(@direction).upcase].join(",")
  end


end
