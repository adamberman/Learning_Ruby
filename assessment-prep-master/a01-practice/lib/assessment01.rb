def is_prime?(num)
	(2...num).all? { |divisor| num % divisor != 0 }
end

def primes(count)
	solution = []
	i = 2
	until solution.length == count
		solution << i if is_prime?(i)
		i += 1
	end
	solution
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
def factorials_rec(num)
	return [1] if num == 1
	factorials_arr = factorials_rec(num - 1)
	factorials_arr << num * factorials_arr[-1]
end

class Array
  def dups
  	solution = Hash.new { |h, k| h[k] = [] }
  	self.each_with_index { |value, i| solution[value] += [i] }
  	solution.select { |key, value| value.length > 1 }
  end
end

class String
  def symmetric_substrings
  	combinations = []
  	(0...length).each do |i|
  		(2...length).each do |j|
  			next unless j > i + 1
  			combinations << self[i..j]
  		end
  	end
  	combinations.select { |combo| combo == combo.reverse }
  end
end

class Array
  def bubble_sort(&blk)
  	self.dup.bubble_sort!(&blk)
  end

  def bubble_sort!(&blk)
  	sorted = false 
  	blk = Proc.new { |x, y| x <=> y } unless blk
   	until sorted == true
  		sorted = true
  		count.times do |i|
  			next if i == count - 1
  			if blk.call(self[i], self[i + 1]) == 1
  				self[i], self[i + 1] = self[i + 1], self[i]
  				sorted = false
  			end
  		end
  	end
  	self
  end
end
