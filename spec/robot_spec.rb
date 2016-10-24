require_relative '../lib/robot'

describe Robot do
  subject {Robot.new}

  describe "initialization" do
    it "should be initialized with default values" do
      expect(subject.current_position).to eq([0,0])
      expect(subject.direction).to eq(0)
      expect(subject.is_placed).to be false
    end
  end

  describe "#placed?" do
    it "should return the value of is_placed" do
      expect(subject.placed?).to be false
    end
  end

  describe "#placed" do
    it "should set is_placed to true " do
      subject.place
      expect(subject.is_placed).to be true
    end
  end

  describe "#report_position" do
    it "should return the position and the direction of the robot" do
      subject.current_position = [2,3]
      subject.direction = 180
      expect(subject.report_position).to eq('2,3,SOUTH')
    end
  end

end
