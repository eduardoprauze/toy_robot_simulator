class Commander
  require_relative 'limits_validator'
  require_relative 'directions'

  def initialize(table,robot)
    @table = table
    @robot = robot
    @validator = LimitsValidator.new(@table)
  end

  def place(x,y,f)
    x = x.to_i
    y = y.to_i
    if @validator.valid_position?(x,y)
      @robot.current_position = [x, y]
      @robot.direction = Directions.get_degrees(f)
      @robot.place unless @robot.is_placed
    else
      puts "Sorry, this is not a valid position."
    end
  end

  def move
    return unless @robot.placed?
    direction = @robot.direction
    if @validator.valid_move?(@robot.current_position, direction)
      case direction
      when 0, 180
          @robot.current_position[1] += direction == 0 ? 1 : -1
        when 90, 270
          @robot.current_position[0] += direction == 90 ? 1 : -1
      end
    else
      puts "Out of bounds."
    end
  end

  def left
    turn(-90)
  end

  def right
    turn(90)
  end

  def turn(value)
    return unless @robot.placed?
    @robot.direction += value
    @robot.direction = 0 if @robot.direction == 360
    @robot.direction = 270 if @robot.direction == -90
  end

  def report
    return unless @robot.placed?
    puts @robot.report_position
  end

  def execute(cmd)
    cmd = cmd.strip.downcase
    op, args = cmd.split(/\s+/, 2)
    args = args.split(/\s*,\s*/) if args
    if Commander.public_method_defined?(op)
      send(op, *args)
    else
      puts "Invalid command."
    end
  end

  def execute_script(io)
    io.each_line do |line|
      execute(line)
    end
  end

end
