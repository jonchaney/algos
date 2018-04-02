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
    resize! if @count == num_buckets
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

  def resize!
    new_store = Array.new(num_buckets*2) { Array.new }
    i = 0 
    while i < @store.length
      j = 0
      while j < @store[i].length
        val = @store[i][j]
        new_store[val % new_store.length].push(val)
        j += 1
      end 
      i +=1
    end 
    @store = new_store
  end
end