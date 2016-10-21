require_relative 'lib/commander'
require_relative 'lib/table'
require_relative 'lib/robot'

def create_objects
  table = Table.new(5)
  robot = Robot.new
  @commander = Commander.new(table, robot)
end

def run
  create_objects
  puts "Welcome to the toy robot simulator!"

  #Reads commands from file
  @commander.execute_script(File.read('toy_robot_script.txt'))

end


run
