require_relative '../lib/directions'

describe Directions do

  describe "#get_name" do
    before do
      @result = Directions.get_name(180)
    end
    it "should return direction name based on degrees" do
      expect(@result).to eq('south')
    end
    it "should return a String" do
      expect(@result).to be_instance_of(String)
    end
  end

  describe "#get_degrees" do
    before do
      @result = Directions.get_degrees('north')
    end
    it "should return degrees based on a direction name" do
      expect(@result).to eq(0)
    end
    it "should return an Integer" do
      expect(@result).to be_instance_of(Fixnum)
    end
  end

end
