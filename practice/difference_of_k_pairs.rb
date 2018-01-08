def difference_of_k_pairs(arr, k)
  diff = {}
  result = []

  # O(n)
  arr.each_with_index do |val,idx|
    diff[val] = idx
  end 

  # O(n)
  arr.each do |val|
    if diff[val + k]
      result.push([val,val+k])
    end 
  end 
  p result
end 

# O(2n) == O(n)

difference_of_k_pairs([1,7,5,9,2,12,3],2)