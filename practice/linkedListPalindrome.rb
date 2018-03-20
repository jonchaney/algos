# implement a function to determine if a linked list is a palindrome
require './rubyLinkedHelpers.rb'

head = createLinkedList(["r", "a", "c", "e", "c","a","r"])
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


p isPalindrome?(head)
