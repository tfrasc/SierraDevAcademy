def sum_less_than(n)
  if n == 1
    return 0
  else
    return (n - 1) + sum_less_than(n - 1)
  end
end

puts sum_less_than(3)
puts sum_less_than(5)
