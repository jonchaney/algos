# Given two strings write a method to deteremine if one is a permutation of the other

# time complexity: O(nlogn)
def check_permutation_first(str1, str2)
  return false if str1.length != str2.length
  str1 = str1.chars.sort # convert to arr: O(n), sort: O(logn)
  str2 = str2.chars.sort # convert to arr: O(n), sort: O(logn)
  str1 == str2 # compare for equality: O(n)
end

# p check_permutation_first("bca", "bac")

# optimized approach
# uses a hash (extra space), but time complexity is O(n)
def check_permutation(str1, str2)
  return false if str1.length != str2.length
  # put str1 into a hash -- O(n)
  hash = {}
  str1.each_char do |el|
    hash[el] = true
  end 

  # check if str2 has all the same charaters as str1 using the hash
  # O(n)
  str2.each_char do |el|
    return false if !hash[el]
  end 
  true
end

p check_permutation("baa", "bac")