def factorial(n)
  if n == 1 or n == 0
    return 1
  else
    return n * factorial(n - 1)
  end
end

puts factorial(0)
puts factorial(3)
puts factorial(5)
