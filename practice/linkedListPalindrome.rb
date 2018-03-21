# implement a function to determine if a linked list is a palindrome
require './rubyLinkedHelpers.rb'

head = createLinkedList(["d","a","d","a","d"])
# printLinkedList(head)


# O(n) time and O(n) space
def isPalindrome?(head)
    letters = []
    curr = head
    odd = 0
    length = 0
    # O(n) time
    while curr.next
        letters.push(curr.value)
        curr = curr.next
    end 

    # O(n/2) time
    i = 0
    j = letters.length-1
    while i != j
        return false if letters[i] != letters[j]
        i+=1
        j-=1
    end 
    true
end 

# this solution uses the runner technique
# O(n) time and O(n/2) space

def isPalindromeRunner?(head)
    slow = head
    fast = head
    stack = [] # only use push and pop methods to imitate a stack

    while fast && fast.next
        stack.push(slow.value)
        slow = slow.next
        fast = fast.next.next
    end
    
    # if it has odd num of elements, skip middle element
    if fast.nil?
        stack.pop
    end

    while slow
        top = stack.pop
        return false if top != slow.value  
        slow = slow.next
    end 
    true
end 


p isPalindrome?(head)
p isPalindromeRunner?(head)
