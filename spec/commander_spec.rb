require_relative '../lib/commander'
require_relative '../lib/table'
require_relative '../lib/robot'

describe Commander do

  before do
    @table = Table.new(5)
    @robot = Robot.new
    @commander = Commander.new(@table, @robot)
  end

  describe "#place" do
    it "should place the robot on the table" do
      @commander.place(2,3,'WEST')
      expect(@robot.current_position).to eq([2,3])
      expect(@robot.direction).to eq(270)
    end
  end

  describe "#move" do
    it "should not move the robot if it is not placed yet" do
      @robot.is_placed = false
      @commander.move
      expect(@robot.current_position).to eq([0,0])
    end
    it "should move the robot one unit forward in the direction it is currently facing" do
      @commander.place(0,0,'NORTH')
      @commander.move
      expect(@robot.current_position).to eq([0,1])
    end
    it "should not move the robot to negative position" do
      @commander.place(0,0,'WEST')
      @commander.move
      expect(@robot.current_position).to eq([0,0])
    end
    it "should not move the robot out of the table" do
      @commander.place(4,0,'EAST')
      @commander.move
      expect(@robot.current_position).to eq([4,0])
    end
  end

  describe "#turn" do
    it "should not turn the robot if it is not placed yet" do
      @robot.is_placed = false
      @commander.turn(90)
      expect(@robot.direction).to eq(0)
    end
    it "should turn the robot" do
      @commander.place(0,0,'NORTH')
      @commander.turn(90)
      expect(@robot.direction).to eq(90)
    end
    it "should reset robot position if it reaches 360 degrees" do
      @commander.place(0,0,'WEST')
      @commander.turn(90)
      expect(@robot.direction).to eq(0)
    end
    it "should set robot position to 270 degrees if it reaches -90 degrees" do
      @commander.place(0,0,'NORTH')
      @commander.turn(-90)
      expect(@robot.direction).to eq(270)
    end
  end

  describe "#execute" do
    it "should execute an existing command" do
      @commander.execute('place 1,3,south')
      expect(@robot.current_position).to eq([1,3])
      expect(@robot.direction).to eq(180)
    end
  end

  describe "#execute_script" do
    it "should execute commands from file" do
      data = 'place 4,4,EAST'
      allow(File).to receive(:read).and_return(data)
      @commander.execute_script(File.read)
      expect(@robot.current_position).to eq([4,4])
      expect(@robot.direction).to eq(90)
    end
  end


end
