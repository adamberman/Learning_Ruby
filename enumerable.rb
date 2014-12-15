def multiply_by_two(array)
  array.map { |number| number * 2 }
end

class Array
  def my_each
    i = 0
    while i < self.count
      yield(self[i])
      i += 1
    end
  end
end

def median(array)
  array.sort!
  if array.count.even?
    even_median(array)
  else
    odd_median(array)
  end
end

def even_median(array)
  (array[array.count / 2] + array[(array.count / 2) - 1]).to_f / 2
end

def odd_median(array)
  array[array.count / 2]
end

def concatenate(array)
  array.inject { |concatenation, string| concatenation += string }
end
    