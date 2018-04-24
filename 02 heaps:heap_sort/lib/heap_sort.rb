require_relative "heap"

class Array
  def heap_sort!
    prc = Proc.new do |el1, el2|
      -1 * (el1 <=> el2)
    end

    # heapify the array to a max heap
    i = 0
    while i < length
      BinaryMinHeap.heapify_up(self, i, self.length, &prc)
      i+=1
    end 
    
    len = length-1
    while len >= 0
      self[0], self[len] = self[len], self[0]
      len -= 1
      BinaryMinHeap.heapify_down(self, 0, len, &prc)
    end

  end
end