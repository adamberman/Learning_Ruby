require_relative '../lib/array_exercises'

describe Array do
  subject(:arr) { Array.new }
    
  describe "#my_unique" do
  let(:arr1) { [1, 2, 2, 3, 1] }
    it "should create a new array" do
      arr2 = arr1.my_unique
      expect(arr1).not_to equal(arr2)
    end
    
    it "should have no duplicate elements" do
      arr2 = arr1.my_unique
      expect(arr2).to eq([1,2,3])
    end
  end
  
  describe "two_sum" do
    let(:arr1) { [-1, 0, 2, -2, 1] }
    it "should create a new array" do
      arr2 = arr1.two_sum
      expect(arr1).not_to equal(arr2)
    end
    
    it "should output correct indeces" do
      arr2 = arr1.two_sum
      expect(arr2).to eq([[0, 4], [2, 3]])
    end
  end
end

describe Towers do
  describe "towers of hanoi" do
    it "should init with 3 towers" do
      towers
    end
    it "tower 1 should init with 3 disks"
    it "should ask for user input"
    it "should win if 3 disks are at a different tower"
    it "should check to see if game is over"
  end
end

