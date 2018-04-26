require './rubyLinkedHelpers.rb'

# create intersecting linked lists
head_one = createLinkedList(["d","a","d","a","d"])
# head_two = createLinkedList(["d","a","d","a","d"])
head_two = Node.new
head_two.value = "b"
head_two.next = Node.new("a")
# head_two.next.next = Node.new('b')
head_two.next.next = head_one.next.next
# puts 'List One'
printLinkedList(head_one)
puts 'List Two'
printLinkedList(head_two)

def intersection(head_one, head_two)
    # get lengths of lists -- O(n)
    len_one = getLength(head_one)
    len_two = getLength(head_two)
    # check for intersection
    if len_one == len_two
        node_one = head_one 
        node_two = head_two
        while node_one.next != node_two.next
            node_one = node_one.next
            node_two = node_two.next
        end 
        result = node_one
    elsif len_one > len_two
        intersect = len_one - len_two
        i = 1
        node = head_one
        while i < (len_two - intersect)
            node = node.next
            i += 1
        end
        result = node
    else 
        intersect = len_two - len_one
        i = 1
        node = head_two
        while i < (len_one - intersect)
            node = node.next
            i += 1
        end
        result = node
    end 
    return result.value ? result : false
end

def check_intersection(len_one, len_two, node)

end

def getLength(node)
    length = 0
    while node.next
        length += 1
        node = node.next
    end 
    return length
end 

def intersectionBetter(head_one, head_two)
    return false if head_one.nil? || head_two.nil?

    # get tails and lengths
    tail_one = head_one
    len_one = 0
    while tail_one.next
        tail_one = tail_one.next 
        len_one += 1
    end 
    
    tail_two = head_two
    len_two = 0
    while tail_two.next
        tail_two = tail_two.next 
        len_two += 1
    end 

    # if same length iterate over lists until at same pointer
    if (len_one == len_two) 
        while head_one != head_two
            head_one = head_one.next
            head_two = head_two.next
        end 
        return head_one
    end 

    return false if tail_one != tail_two

    shorter = len_one < len_two ? head_one : head_two
    longer = len_one > len_two ? head_one : head_two

    # advance the longer pointer by difference in lengths
    i = 0
    while i < (len_one - len_two).abs
        longer = longer.next
        i+=1
    end 

    while shorter != longer
        shorter = shorter.next
        longer = longer.next
    end 


    return longer
end 

p intersectionBetter(head_one, head_two)