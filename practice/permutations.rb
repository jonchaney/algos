require 'byebug'

def permutations(arr)
  return [[]] if arr.empty?
  perms = []
  arr.length.times do |i|
    el = arr[i]
    rest = arr.take(i) + arr.drop(i + 1)
    new_perms = permutations(rest).map { |perm| perm.unshift(el) }
    perms.concat(new_perms)
  end
  perms
end

p permutations("abc".chars)

# p [1,2,3].permutation.to_a