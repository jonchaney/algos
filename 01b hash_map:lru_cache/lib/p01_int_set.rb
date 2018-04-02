class MaxIntSet
  def initialize(max)
    @set = Array.new(max)
  end

  def insert(num)
    is_valid?(num)
    @set.push(num % @set.length) unless @set.include?(num) 
  end

  def remove(num)
    @set.delete(num)
  end

  def include?(num)
    @set.include?(num)
  end

  private

  def is_valid?(num)
    raise 'Out of bounds' if num > @set.length || num < 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num) unless self[num].include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    @count +=1
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end