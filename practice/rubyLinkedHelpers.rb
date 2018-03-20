# create linked list

def createLinkedList(arr)
    head = Node.new
    curr = head
    arr.each do |el|
        curr.value = el 
        curr.next = Node.new
        curr = curr.next
    end 
    head
end 

# print linked list
def printLinkedList(head)
    curr = head
    while curr.next
        p curr.value
        curr = curr.next
    end 
end 

class Node
    attr_accessor :value, :next, :prev

    def initialize(value=nil)
        self.value = value
        self.next = nil
        self.prev = nil
    end 

    def append(node) 
        self.next = node
    end 

end 