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
  
  attr_accessor :towers
  
  def initialize
    @towers = [[3, 2, 1], [], []]
  end
end
