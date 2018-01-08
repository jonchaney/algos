# This class just dumbs down a regular Array to be statically sized.

class StaticArray
  def initialize(length = 0)
    @store = Array.new(length)
    @length = length
  end

  def length 
    @store.length
  end 

  # O(1)
  def [](index)
    overflow(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    overflow(index)
    @store[index] = value
  end

  ## check if array is within bounds
  def overflow(index)
    raise "index out of bounds" unless index.between?(0, @store.length - 1)
  end 

  protected
  attr_accessor :store
end


