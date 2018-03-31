require_relative "static_array"
class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @start_idx = 0
    @length = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    raise 'index out of bounds' if index >= @length
    store[(@start_idx + index) % @capacity]
  end
  
  # O(1)
  def []=(index, val)
    @store[(@start_idx + index) % @capacity] = val
  end

 # O(1)
  def pop
    raise 'index out of bounds' if @length == 0
    val = self[length-1]
    @length -= 1
    val 
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity
    self[@length] = val
    @length+=1 
  end

  # O(1)
  def shift
    raise 'index out of bounds' if @length == 0
    val = self[0]
    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1
    val
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity
    @length += 1
    @start_idx = ((@start_idx - 1) + @capacity) % @capacity
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def resize!
    new_store = StaticArray.new(@capacity*2)
    i = 0 
    while i < @length
      new_store[i] = self[i]
      i+=1
    end
    @store = new_store
    @capacity *= 2
    @start_idx = 0
  end
end
