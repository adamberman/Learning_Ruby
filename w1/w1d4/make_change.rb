def make_change(amount, coins = [25, 10, 5, 1])
	return [] if amount == 0
	coins = coins.sort.reverse
	final_combo = nil
	coins.each_with_index do |coin, index|
		next if coin > amount
		remainder = amount - coin
		combination = make_change(remainder, coins.drop(index))
		next if combination.nil?
		this_combination = [coin] + combination
		final_combo = this_combination if final_combo.nil? || final_combo.length > this_combination.length
	end
	final_combo
end


#p make_change(39)
#p make_change(14, [10, 7, 1])


def merge_sort(array)
	return array if array.length <= 1
	midpoint = (array.length / 2)
	half1 = array[0...midpoint]
	half2 = array[midpoint..-1]
	merge(merge_sort(half1), merge_sort(half2))
end

def merge(array1, array2)
	final_array = []
	until array1.empty? || array2.empty?
		if array1[0] > array2[0]
			final_array << array2.shift
		else
			final_array << array1.shift
		end
	end
	final_array + array1 + array2
end

p merge_sort([0, 3, 2, 1, 6, 4, 2, 1, 2, 4, 3, 8]) 