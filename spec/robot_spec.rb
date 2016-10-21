require_relative '../lib/robot'

describe Robot do
  before do
    @robot = Robot.new
  end
  describe "initialization" do
    it "should be initialized with default values" do
      expect(@robot.current_position).to eq([0,0])
      expect(@robot.direction).to eq(0)
      expect(@robot.is_placed).to be false
    end
  end

  describe "#placed?" do
    it "should return the value of is_placed" do
      expect(@robot.placed?).to be false
    end
  end

  describe "#placed" do
    it "should set is_placed to true " do
      @robot.place
      expect(@robot.is_placed).to be true
    end
  end

  describe "#report_position" do
    it "should return the position and the direction of the robot" do
      @robot.current_position = [2,3]
      @robot.direction = 180
      expect(@robot.report_position).to eq('2,3,SOUTH')
    end
  end

end
