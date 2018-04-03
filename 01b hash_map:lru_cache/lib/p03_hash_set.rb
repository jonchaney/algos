require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @count += 1
    resize! if @count == num_buckets
    self[key].push(key)
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    @count -= 1 if self[key].delete(key)
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(@store.length*2) { Array.new }
    @store.each do |arr| 
      arr.each do |val|
        new_store[val.hash % new_store.length].push(val)
      end 
    end
    @store = new_store
  end
end