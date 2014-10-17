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
  
  describe "#two_sum" do
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
  subject(:game) { Towers.new }
  
  describe "towers of hanoi" do
    it "should init with 3 towers" do
      expect(game.towers.count).to eq(3)
    end
  
    it "tower 1 should init with 3 disks" do
      expect(game.towers[0].count).to eq(3)
    end
  end
  
  describe "move disk" do  
  
    it "should move disk" do
      game.move_disk([0, 1])
      expect(game.towers).to eq([[3, 2], [1], []])
    end
  
  end

  describe "game over?" do

    it "should return that the game is over if the game is won" do
      game.towers = [[], [], [3, 2, 1]]
      expect(game.game_over?).to be_true
    end
  
    it "should return that the game is not over if the game is not won" do
      game.towers = [[], [3], [2, 1]]
      expect(game.game_over?).to be_false
    end
  end  
end

describe "my_transpose" do
  let(:output) { my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]]) }
  
  it "should return an array" do
    expect(output).to be_a_kind_of(Array) 
  end
  
  it "should return the transpose" do
    expect(output).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe "stock picker" do
  let(:output) { stock_picker([5, 2, 3, 8, 7, 1, 9]) }
  
  it "should return an array" do
    expect(output).to be_a_kind_of(Array) 
  end
  
  it "should buy before selling" do
    expect(output[0]).to be < output[1]
  end
  
  it "should choose the most profitable buy and sell date"
  
end
