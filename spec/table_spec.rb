require_relative '../lib/table'

describe Table do
  
  describe "#validate!" do
    it 'should raise an error if x is negative' do
      expect { Table.new(-3,3) }.to raise_error(ArgumentError)
    end
    it 'should raise an error if y is negative' do
      expect { Table.new(3,-3) }.to raise_error(ArgumentError)
    end
    it 'should not raise error if params are ok' do
      expect { Table.new(3,3) }.not_to raise_error
    end
  end

end
