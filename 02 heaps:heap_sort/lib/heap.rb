class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @count = 0
    @prc ||= Proc.new { |el1, el2| el1 <=> el2 }
  end

  def count
    @count
  end

  def extract
    @store[0], @store[@count - 1] = @store[@count - 1], @store[0]
    val = @store.pop
    @count -= 1
    BinaryMinHeap.heapify_down(@store, 0)
    val
  end

  def peek
    @store.first
  end

  def push(val)
    @store.push(val)
    @count += 1
    BinaryMinHeap.heapify_up(@store, @count - 1)
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
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    children = BinaryMinHeap.child_indices(len, parent)
    return nil if children.nil?
    left_idx = children[0]
    right_idx = children[1]

    return array if children.all? { |child| prc.call(array[parent], array[child]) == -1 }
    
    if children.length == 1 
      swap_idx = left_idx
    else 
      swap_idx = prc.call(array[left_idx], array[right_idx]) == -1 ? left_idx : right_idx
    end 

    array[parent], array[swap_idx] = array[swap_idx], array[parent]
    BinaryMinHeap.heapify_down(array, swap_idx, len, &prc)

    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return nil if child_idx.zero?
    parent = BinaryMinHeap.parent_index(child_idx)
    if prc.call(array[parent], array[child_idx]) >= 0
      array[parent], array[child_idx] = array[child_idx], array[parent]
      BinaryMinHeap.heapify_up(array, parent, len, &prc)
    end
    array
  end
end