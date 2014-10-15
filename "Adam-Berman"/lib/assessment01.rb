def factors(num)
	(1..num).select { |divisor| num % divisor == 0 }
end

def fibs_rec(count)
	return [0] if count == 1
	return (fibs_rec(count - 1) + [1]) if count == 2
	solution_arr = fibs_rec(count - 1)
	solution_arr + [solution_arr[-1] + solution_arr[-2]]
end

class Array
  def bubble_sort(&prc)
  	self.dup.bubble_sort!(&prc)
  end

  def bubble_sort!(&prc)
  	sorted = false
  	prc = Proc.new { |x, y| x <=> y } unless prc
  	until sorted
  		sorted = true
  		count.times do |i|
  			next if i == count - 1
  			if prc.call(self[i], self[i + 1]) == 1
  				self[i], self[i + 1] = self[i + 1], self[i]
  				sorted = false
  			end
  		end
  	end
  	self
  end
end

class Array
  def two_sum
  	solution = []
  	(0...length).each do |i|
  		(1...length).each do |j|
  			next unless j > i
  			solution << [i, j] if self[i] + self[j] == 0
  		end
  	end
  	solution
  end
end

class String
  def subword_counts(dictionary)
  	solution = Hash.new(0)
  	(0...length).each do |i|
  		(0...length).each do |j|
  			next if j < i
  			solution[self[i..j]] += 1
  		end
  	end
  	solution.select { |key, value| dictionary.include?(key) }
  end
end
