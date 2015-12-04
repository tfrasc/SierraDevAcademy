def fibbonacci(n)
  if n == 0 or n == 1
    return n
  else
    return fibbonacci(n - 1) + fibbonacci(n - 2)
  end
end

puts fibbonacci(1)  #1
puts fibbonacci(2)  #1
puts fibbonacci(3)  #2
puts fibbonacci(4)  #3
puts fibbonacci(5)  #5
puts fibbonacci(6)  #8