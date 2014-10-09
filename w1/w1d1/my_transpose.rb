def my_transpose(array)
  transpose = Array.new(array[0].count) { Array.new(array.count) }

  (0...array.count).each do |i|
    (0...array[i].count).each do |j|
      transpose[j][i] = array[i][j]
    end
  end
  transpose
end