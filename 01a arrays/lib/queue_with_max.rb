# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon m dequeues >> O(n*m).
# Can you do it in O(n) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts!

require_relative 'ring_buffer'

class QueueWithMax
  attr_reader :store, :maxque

  def initialize
    @store = RingBuffer.new
    @maxque = RingBuffer.new
  end

  def enqueue(el)
    @store.push(el)
    update_maxque(el)
  end

  def dequeue
    val = @store.shift
    @maxque.shift if @maxque[0] == val
    val
  end

  def max
    @maxque[0] if @maxque.length > 0
  end

  def update_maxque(el)
    if @maxque.length == 0
      @maxque.push(el)
    else
      # check tail, if tail is greater than element, then insert at tail
      if @maxque[@maxque.length-1] > el 
        @maxque.push(el)
      else
      # remove elements until @maxque is empty or tail is greater than the element
        until @maxque.length == 0 || @maxque[@maxque.length-1] > el 
          @maxque.pop
        end 
        @maxque.push(el)
      end 
    end
  end

  def length
    @store.length
  end
end
