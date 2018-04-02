## given a doubly linked list, reverse it

class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key, val)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

end

class LinkedList
  attr_accessor :head, :tail
  include Enumerable
  def initialize
    @head = nil
    @tail = nil
  end

  def reverse 
    
  end   
end 

