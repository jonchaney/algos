require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @length = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index >= length 
    store[index]
  end

  # O(1)
  def []=(index, value)
    raise "index out of bounds" if index >= length
    store[index] = value
  end

  # O(1)
  def pop
    val = store[@length-1]
    @length -= 1
    val
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length == @capacity
    store[length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    val = self[0]
    i = 1
    while i < @length
      store[i-1] = store[i]
      i+=1
    end 
    @length -= 1
    val
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if @length == @capacity
    @length += 1
     
    i = @length-1
    while i > 0
      store[i] = store[i-1]
      i-=1
    end
    
    self[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(@capacity*2)
    i = 0
    while i < @length
      new_store[i] = self[i]
      i+=1
    end 
    @capacity *= 2
    @store = new_store
  end
end

