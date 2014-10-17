require_relative '../lib/array_exercises'

describe Array do
  subject(:arr) { Array.new }
    
  describe "#my_unique" do
  let(:arr1) { Array.new { [1,2,2,3,1]} }
    it "should create an array" do
      arr2 = arr1.my_unique
      expect(arr1).not_to equal(arr2)
    end
    
    it "should have no duplicate elements"
  end
end

