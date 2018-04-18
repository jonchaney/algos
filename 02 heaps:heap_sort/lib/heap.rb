class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @count = 0
  end

  def count
    @count
  end

  def extract
    @store[0], @store[@count - 1] = @store[@count - 1], @store[0]
    val = @store.pop
    @count -= 1
    BinaryMinHeap.heapify_down(@store, 0, @store.length, &prc)
    val
  end

  def peek
    @store.first
  end

  def push(val)
    @store.push(val)
    @count += 1
    BinaryMinHeap.heapify_up(@store, @count - 1, @store.length, &prc)
  end

  def self.child_indices(len, parent)
    left_child = (2 * parent) + 1
    right_child = (2 * parent) + 2
    if left_child >= len && right_child < len
      result = [right_child]
    elsif right_child >= len && left_child < len
      result = [left_child]
    elsif left_child < len && right_child < len
      result = [left_child, right_child]
    end
    result
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index.zero?
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent, len = array.length, &prc)
    unless prc  
      prc = Proc.new do |el1, el2|
        el1 > el2
      end
    end
    children = BinaryMinHeap.child_indices(len, parent)
    return nil if children.nil?
    left_child = children[0]
    right_child = children[1]
    if prc.call(array[parent], array[left_child])
      array[parent], array[left_child] = array[left_child], array[parent]
      BinaryMinHeap.heapify_down(array, parent + 1, len, &prc)
    elsif right_child
      if prc.call(array[parent], array[right_child])
        array[parent], array[right_child] = array[right_child], array[parent]
        BinaryMinHeap.heapify_down(array, parent + 1, len, &prc)
      end
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    unless prc
      prc = Proc.new do |el1, el2|
        el1 > el2
      end
    end
    return nil if child_idx.zero?
    parent = BinaryMinHeap.parent_index(child_idx)
    if prc.call(array[parent], array[child_idx])
      array[parent], array[child_idx] = array[child_idx], array[parent]
      BinaryMinHeap.heapify_up(array, parent, len, &prc)
    end 
    array
  end
end