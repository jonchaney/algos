# find the permutations of a given str
def my_permutations(str)
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



p my_permutations("abc")