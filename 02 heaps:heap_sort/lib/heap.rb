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
  end

  def peek
    @store.first
  end

  def push(val)
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
    children = BinaryMinHeap.child_indices(len, parent)
    return nil if children.nil?
    left_child = children[0]
    right_child = children[1]
    if array[parent] > array[left_child]
      array[parent], array[left_child] = array[left_child], array[parent]
      BinaryMinHeap.heapify_down(array, parent + 1, len, &prc)
    elsif right_child
      if array[parent] > array[right_child]
        array[parent], array[right_child] = array[right_child], array[parent]
        BinaryMinHeap.heapify_down(array, parent + 1, len, &prc)
      end
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx.zero?
    parent = BinaryMinHeap.parent_index(child_idx)
    array[parent], array[child_idx] = array[child_idx], array[parent]
    BinaryMinHeap.heapify_up(array, parent, len, &prc)
  end
end