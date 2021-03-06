# implement an algorithm to determine if a string had all unique characters.
# What if you cannot use additional data structures?

# brute force with additional data structure
# a hash is used instead of an array to make look up O(1), but more space is used as a result
# O(n)

def is_unique_with_hash?(str)
  hash = {}
  str.each_char do |ch|
    if hash[ch]
      return false
    else 
      hash[ch] = true
    end 
  end 
  true
end 

p is_unique_with_hash?("n")
p is_unique_with_hash?("jon")
p is_unique_with_hash?("jonn")

# no extra space used
# O(n^2/2) == O(n^2)
def is_unique_no_extra_space?(str)
  i = 0
  while i < str.length 
    j = i+1
    while j < str.length 
      if str[i] == str[j]
        return false
      end 
      j+=1
    end 
    i+=1
  end   
  true
end 

p is_unique_no_extra_space?("n")
p is_unique_no_extra_space?("jon")
p is_unique_no_extra_space?("jonn")

# can we do better? if the string only contains letters we can sort the string and check for adjacent
# characters
# this method does not use extra space
# O(n log n) 
def is_unique?(str)
  str = str.chars.sort
  str.each_with_index do |letter, idx|
    next if idx == str.length
    return false if str[idx] == str[idx++1]
  end 
  true
end 

p is_unique?("n")
p is_unique?("jon")
p is_unique?("jonn")