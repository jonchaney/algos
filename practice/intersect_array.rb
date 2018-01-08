def intersect_array(arr1,arr2)
  hash = {}
  count = 0
  
  # O(n)
  arr1.each do |el|
    hash[el] = true
  end 

  # O(n)
  arr2.each do |el|
    if hash[el]
      count+=1
    end 
  end 
  count
end 


# O(n+n) == O(n)
p intersect_array([13,27,35,40,49,55,59],[17,35,39,40,55,58,60])