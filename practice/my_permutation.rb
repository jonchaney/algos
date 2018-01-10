# find the permutations of a given str
# brute force iterative
def my_permutations_brute_force(str)
  arr = str.chars
  result = []
  arr.length.times do |idx1| 
    sub_str = arr[0...idx1] + arr[idx1+1..-1]
    arr.length.times do |idx2|
      perm = sub_str[0...idx2] + [arr[idx1]] + sub_str[idx2..-1]
      result.push(perm) if !result.include?(perm)
      result.push(perm.reverse) if !result.include?(perm.reverse)
    end 
  end 
  result
end 

p my_permutations_brute_force("abc")

# from cracking the coding interview, from java into ruby.
# modified to push perms into an array
def cracking_the_coding_permutations(str)
  arr = []
  permutation(str, "", arr)
end 

def permutation(str, prefix,arr)
  if str.length == 0
    arr.push(prefix)
  else 
    idx = 0
    while idx < str.length
      rem = str[0...idx] + str[idx+1..-1]
      permutation(rem, prefix + str[idx], arr)
      idx+=1
    end 
  end 
  arr
end 


p cracking_the_coding_permutations("abc")