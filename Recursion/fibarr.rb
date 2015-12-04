def fibonacci_array(n)
  if n <= 1
    return n
  else
    x = fibonacci_array(n - 1) + fibonacci_array(n - 2)
    [x, fibonacci_array(n - 1)]
  end
end

puts fibonacci_array(1)
puts fibonacci_array(2)
puts fibonacci_array(3)
puts fibonacci_array(4)
