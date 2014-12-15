i = 251
loop do
  break if i % 7 == 0
  i += 1
end
#print i

def factors(number)
  (1..number).each { |divisor| puts divisor if number % divisor == 0 }
end

#factors(4)

def bubble_sort(array)
  sorted = false
  until sorted #is_sorted?(array)
    sorted = true
    (array.size - 1).times do |i|
      if array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
        sorted = false
      end
    end
  end
  array
end

def is_sorted?(array)
  (array.size - 1).times { |i| return false if array[i] > array[i+1] }
  true
end
# p bubble_sort([0, 1, 4, 3, 2])

def substrings(string)
  solution = []
  (0...string.length).each do |i|
    (i...string.length).each { |j| solution << string[i..j] }
  end
  solution
end

# p substrings("cat")
# p substrings("hello")

def subwords(string)
  words = []
  File.foreach('dictionary.txt') { |line| words << line.chomp }
  all_substrings = substrings(string)
  all_substrings.select { |word| words.include?(word) }
end

p subwords("hello")