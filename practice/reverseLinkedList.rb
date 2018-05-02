# require './rubyLinkedHelpers.rb'
require '../01b_hash_map_lru_cache/lib/p04_linked_list.rb'
require './rubyLinkedHelpers.rb'
# create a linked list
list = createList([1,2,3,4,5])
# printList(list)

class LinkedList
    # O(n) time and O(n) space
    def reverse_brute 
        arr = []
        each do |node|
            arr.push(node.val)
        end 

        i = arr.length-1
        each do |node|
            node.val = arr[i]
            i-=1
        end 
    end 

    def reverse_n_plus 
        # O(n) time

        # get length
        length = 0
        each do |node|
            length += 1
        end 

        # swap from ends -- doubly linked list
        # O(n/2)
        i = 0
        curr = @head
        last = @tail
        while i < length/2 
            curr.val, last.val = last.val, curr.val
            curr = curr.next
            last = last.prev
            i += 1 
        end 
        
    end 

    def reverse 

        # O(n)

        # get second to last node
        node = @tail.prev
        # detach tail and make it the new head
        @head = @tail 
        @head.prev = nil
        @head.next = nil

        # iterate from from new tail (node) and attach to new head (curr) 
        curr = @head
        while node
            curr.next = node 
            curr = curr.next
            node = node.prev
        end 
        @tail = curr
        @tail.next = nil
    end

end 



list.reverse
printList(list)