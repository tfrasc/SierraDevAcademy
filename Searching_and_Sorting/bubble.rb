def bubble_sort(arr)
  arr
  arr.length.times do |i|
    j = i
    highest = arr[i]
    highestIndex = i
    while j < arr.length
      if arr[j] > highest
        highest = arr[j]
        highestIndex = j
      end
      j += 1
    end
    arr.delete_at(highestIndex)
    arr.unshift(highest)
  end
  arr
end

#testing
arr = [0,6,11,31,69,1000,0,12, 12]
newArr = bubble_sort(arr)
puts newArr
