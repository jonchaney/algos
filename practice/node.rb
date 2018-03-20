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