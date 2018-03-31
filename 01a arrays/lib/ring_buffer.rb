require_relative "static_array"
class RingBuffer
  attr_reader :length

  def initialize
    self.store = StaticArray.new(8)
    self.start_idx = 0
    self.length = 0
    self.capacity = 8
  end

  # O(1)
  def [](index)
    raise 'index out of bounds' if index >= self.length
    store[(self.start_idx + index) % self.capacity]
  end
  
  # O(1)
  def []=(index, val)
    self.store[(self.start_idx + index) % self.capacity] = val
  end

 # O(1)
  def pop
    raise 'index out of bounds' if self.length == 0
    val = self[length-1]
    self.length -= 1
    val 
  end

  # O(1) ammortized
  def push(val)
    resize! if self.length == self.capacity
    self[self.length] = val
    self.length+=1 
  end

  # O(1)
  def shift
    raise 'index out of bounds' if self.length == 0
    val = self[0]
    self.start_idx = (self.start_idx + 1) % self.capacity
    self.length -= 1
    val
  end

  # O(1) ammortized
  def unshift(val)
    resize! if self.length == self.capacity
    self.length += 1
    if self.start_idx == 0 
      self.start_idx = self.capacity-1
    else
      self.start_idx -= 1
    end 
    self[0] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def resize!
    new_store = StaticArray.new(self.capacity*2)
    i = 0 
    while i < self.length
      new_store[i] = self[i]
      i+=1
    end
    self.store = new_store
    self.capacity *= 2
    self.start_idx = 0
  end
end
