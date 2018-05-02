class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
      @prev.next = @next
      @next.prev = @prev
  end
end

class LinkedList
  include Enumerable
  
  def initialize
    @head = nil
    @tail = nil
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.nil?
  end

  def get(key)
    curr = @head 
    while curr 
      return curr.val if curr.key == key
      curr = curr.next
    end 
  end

  def include?(key)
    curr = @head 
    while curr 
      return true if (curr.key == key) 
      curr = curr.next
    end
    false  
  end

  def append(key, val)
    if @head.nil?
      @head = Node.new(key, val)
      @tail = @head
      node = @head
    else 
      node = Node.new(key, val)
      @tail.next = node
      node.prev = @tail
      @tail = node
    end
    node
  end

  def update(key, val)
    curr = @head 
    while curr 
      if (curr.key == key) 
        curr.val = val
        break
      end
      curr = curr.next
    end  
  end

  def remove(key)
    curr = @head 
    if curr.key == key 
      @head = @head.next
    else 
      while curr 
        if (curr.key == key) 
          curr.remove
          curr = @tail
        end
        curr = curr.next
      end
    end  
  end

  def each
    curr = @head
    while curr 
      yield curr
      curr = curr.next
    end 
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end

end