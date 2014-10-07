class MyHashSet
  def initialize
    @store = Hash.new(false)
  end
  
  def insert(el)
    @store[el] = true
  end
  
  def include?(el)
    @store[el]
  end
  
  def delete(el)
    @store[el] = false
  end
  
  def to_a
    @store.select { |key, value| value }.keys
  end
  
  def union(other_set)
    self.to_a.concat(other_set.to_a)
  end
  
  def intersect(other_set)
    self.to_a.select { |el| other_set.to_a.include?(el) }
  end
  
  def minus(other_set)
    self.to_a.reject { |el| other_set.to_a.include?(el) }
  end
end