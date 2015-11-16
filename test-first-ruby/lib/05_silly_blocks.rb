def reverser
  input_str = yield

  input_str.split.map do |word|
    word.reverse
  end.join(" ")
end

def adder(inc = 1)
  num = yield
  num += inc
end

def repeater(num = 1)
  num.times do
    yield
  end
end