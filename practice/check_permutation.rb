# Given two strings write a method to deteremine if one is a permutation of the other

# time complexity: O(nlogn)
def check_permutation_first(str1, str2)
  return false if str1.length != str2.length
  str1 = str1.chars.sort # convert to arr: O(n), sort: O(logn)
  str2 = str2.chars.sort # convert to arr: O(n), sort: O(logn)
  str1 == str2 # compare for equality: O(n)
end

p check_permutation("bca", "bac")

# optimized approach, uses space, O(n)
def check_permutation(str1, str2)
  
end