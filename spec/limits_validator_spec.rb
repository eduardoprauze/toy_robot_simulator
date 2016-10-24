require_relative '../lib/table'
require_relative '../lib/limits_validator'

describe LimitsValidator do

  let(:table){Table.new(5)}
  subject {LimitsValidator.new(table)}

  describe "#valid_position?" do
    it "should return true if a position is valid" do
      result = subject.valid_position?(1,2)
      expect(result).to be true
    end
    it "should return false if x position is negative" do
      result = subject.valid_position?(-1,2)
      expect(result).to be false
    end
    it "should return false if y position is negative" do
      result = subject.valid_position?(1,-2)
      expect(result).to be false
    end
    it "should return false if x position is out of bounds" do
      result = subject.valid_position?(6,2)
      expect(result).to be false
    end
    it "should return false if y position is out of bounds" do
      result = subject.valid_position?(6,2)
      expect(result).to be false
    end
  end

  describe "#valid_move?" do
    it "should return true if a move is valid" do
      result = subject.valid_move?([1,2], 0)
      expect(result).to be true
    end
    it "should return false if the result of a move is a negative x position" do
      result = subject.valid_move?([0,0], 270)
      expect(result).to be false
    end
    it "should return false if the result of a move is a negative y position" do
      result = subject.valid_move?([0,0], 180)
      expect(result).to be false
    end
    it "should return false if the result of a move is an out of bounds x position" do
      result = subject.valid_move?([4,4], 0)
      expect(result).to be false
    end
    it "should return false if the result of a move is an out of bounds y position" do
      result = subject.valid_move?([4,4], 90)
      expect(result).to be false
    end

  end

end
