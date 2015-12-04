def binary_search(arr, value, low, high)
  if low > high
    return "#{value} not in array"
  elsif arr[(low + high) / 2] == value
    return ((low + high) / 2)
  elsif arr[(low + high) / 2] > value
    binary_search(arr, value, low, (low + high) / 2 - 1)
  elsif arr[(low + high) / 2] < value
    binary_search(arr, value, (low + high) / 2 + 1, high)
  end
end

arr = [0,1,2,3,4,6,7,8,9]

puts binary_search(arr, 7, 0, arr.length - 1)
puts binary_search(arr, 20, 0, arr.length - 1)
