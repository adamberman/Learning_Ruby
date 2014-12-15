def is_prime?(num)
  (2...num).none? { |factor| num % factor == 0 }
end

def primes(count)
  primes = []

  i = 2
  until primes.count >= count
    primes << i if is_prime?(i)

    i += 1
  end

  primes
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
def factorials_rec(num)
  return [1] if num == 1

  facs = factorials_rec(num - 1)
  facs << facs.last * num

  facs
end

class Array
  def dups
    positions = Hash.new { |h, k| h[k] = [] }

    each_with_index do |item, index|
      positions[item] << index
    end

    positions.select { |key, val| val.count > 1 }
  end
end

class String
  def symmetric_substrings
    symm_subs = []

    length.times do |start_pos|
      (2..(length - start_pos)).each do |len|
        substr = self[start_pos...(start_pos + len)]
        symm_subs << substr if substr == substr.reverse
      end
    end

    symm_subs
  end
end

class Array
  def bubble_sort(&blk)
    self.dup.bubble_sort!(&blk)
  end

  def bubble_sort!(&blk)
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    blk = Proc.new { |x, y| x <=> y } unless blk

    sorted = false
    until sorted
      sorted = true

      count.times do |i|
        next if i == count - 1

        if blk.call(self[i], self[i + 1]) == 1
          # Parallel assignment; use it when swapping.
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end

    self
  end
end
