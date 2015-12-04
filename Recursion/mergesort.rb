def mergesort(arr)
  if arr.length <= 1
    return arr
  end

  pivot = arr[arr.length / 2]
  arr.delete_at(arr.length / 2)

  lhs = []
  rhs = []
  arr.each do |x|
    if x <= pivot
      lhs.push(x)
    else
      rhs.push(x)
    end
  end

  return mergesort(lhs) + [pivot] + mergesort(rhs)
end


puts mergesort([1,6, 9, 8, 32, 21, 69])
puts mergesort([1, 2, 3, 4, 5])
puts mergesort([5, 4, 3, 2, 1])