def reverser(&blk)
  input_str = blk.call

  input_str.split.map do |word|
    word.reverse
  end.join(" ")
end

def adder(inc = 1, &blk)
  num = blk.call
  num += inc
end

def repeater(num = 1, &blk)
  num.times do
    blk.call
  end
end
