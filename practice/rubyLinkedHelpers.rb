require '../01b_hash_map_lru_cache/lib/p04_linked_list.rb'

# create linked list
def createLinkedList(arr)
    head = Node.new
    curr = head
    arr.each_with_index do |el, idx|
        curr.value = el  
        next if idx == arr.length-1
        curr.next = Node.new
        curr = curr.next
    end 

    head
end 

# create linked list 2
def createList(arr)
    list = LinkedList.new
    arr.each_with_index do |el, idx|
        list.append(idx, el)
    end 
    list
end 

def printList(list)
    list.each do |el|
        p el.val
    end 
end 

# print linked list
def printLinkedList(head)
    curr = head
    while curr
        p curr.value
        curr = curr.next
    end 
end 

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
        def append(node) 
        self.next = node
    end 
  
    def remove
        @prev.next = @next
        @next.prev = @prev
    end
  end