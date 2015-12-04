def quicksort(arr, low, high)
  if arr.length > 1
    pivot = arr[arr.length / 2]
    while low <= high
      while arr[low] <= pivot
        low += 1
      end
      while arr[high] > pivot
          high -= 1
      end
      if low <= high
          arr[low], arr[high] = arr[high], arr[low]
          low += 1
          high -= 1
      end
    quicksort(arr, 0, high)
    quicksort(arr, low, arr.length - 1)
    end
  end
end

arr = [1,2,6,5,34,32,7,5]
puts quicksort(arr, 0, arr.length - 1)