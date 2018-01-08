# Given a doubly linked list, like the one you built, reverse it.
# You can assume that this method is monkey patching the LinkedList class
# that you built, so any methods and instance variables in that class 
# are available to you.

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
    original_first = original_first
    pointer = @head 
    until original_first == last 
      new_last = last.prev
      new_first = last 

      pointer.next = new_first 
      new_first.prev = pointer 

      @tail.prev = new_last
      new_last.next = @tail
      pointer = new_first 
    end
    
    pointer.next = last 
    last.prev = pointer
    end 
  end   
end 

