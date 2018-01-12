# time complexity O(n+m) -- O(n)
# space complexity, uses an extra array
# this is a good solution
def urlify(str)
  result = ""
  # split the string in to arr, remove white space -- O(n)
  arr = str.split
  i = 0
  # iterate over length of the array -- O(m)
  while i < arr.length
    if i == arr.length-1
      result.concat(arr[i])
    else
      result.concat(arr[i] + "20%")
    end 
    i+=1
  end 
  result
end 

p urlify("Jon Chaney    ")