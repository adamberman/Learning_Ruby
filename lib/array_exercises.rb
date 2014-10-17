class Array
  
  def my_unique
    answer = []
    each do |object|
      answer << object unless answer.include?(object)
    end
    
    answer
  end
  
  def two_sum
    answer = []
    each_with_index do |num1, idx1|
      each_with_index do |num2, idx2|
        next if idx1 >= idx2
        answer << [idx1, idx2] if num1 + num2 == 0
      end
    end
    answer
  end
end

class Towers
  
  WINNING_COMBO = [3, 2, 1]
  
  attr_accessor :towers
  
  def initialize
    @towers = [[3, 2, 1], [], []]
  end
  
  def user_input
    puts "Tell us the tower to pick from:"
    from = gets.chomp.to_i
    puts "Tell us the tower to place this:"
    to = gets.chomp.to_i
    
    [from, to]
  end
  
  def move_disk(move_array)
    towers[move_array[1]] << towers[move_array[0]].pop
  end
  
  def play
    move_disk(user_input)
    
  end
  
  def game_over?
    towers[1] == WINNING_COMBO || towers[2] == WINNING_COMBO 
  end
end

def my_transpose(arr)
  transpose = Array.new(arr.count) { Array.new(arr.count) }
  arr.each_with_index do |row, idx1|
    row.each_with_index do |num, idx2|
      transpose[idx2][idx1] = num
    end
  end
  transpose
end

def stock_picker(prices)
  answer = []
  greatest_profit = 0
  prices.each_with_index do |price, idx|
    prices[(idx + 1)..-1].each_with_index do |price2, idx2|
      if price2 - price > greatest_profit
        answer = [idx, idx + idx2]
        greatest_profit = price2 - price
      end
    end
  end
  p answer
  answer
end
