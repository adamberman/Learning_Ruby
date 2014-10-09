class Array
  def my_uniq
    new_arr = []
    self.each { |el| new_arr << el unless new_arr.include?(el) }
    new_arr
  end
  
  def two_sum
    solution = []
    (0...self.length).each do |i| 
      (i+1...self.length).each do |j|
        if self[i] + self[j] == 0
          solution << [i, j]
        end
      end
    end
    solution
  end
end