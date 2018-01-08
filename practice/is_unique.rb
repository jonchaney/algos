# implement an algorithm to determine if a string had all unique characters.
# What if you cannot use additional data structures?

# brute force with additional data structure
# a hash is used instead of an array to make look up O(1), but more space is used as a result
# O(n)

def is_unique_with_hash?(str)
  hash = {}
  str.each_char do |char|
    if hash[char]
      return false
    else 
      hash[char] = true
    end 
  end 
  true
end 

p is_unique_with_hash?("n")

# goal: O(n), no extra space used
def is_unique?(str)
  
end 