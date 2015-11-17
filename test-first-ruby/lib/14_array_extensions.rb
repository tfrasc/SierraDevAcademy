class Array
  def sum
    @val = 0
    if self.length == 0
      return @val
    end
    self.each do |x|
      @val += x
    end
    @val
  end

  def square
    @val = 0
    if self.length == 0
      return self
    end
    sqr = self.map do |x|
      x *= x
    end
    sqr
  end

  def square!
    @val = 0
    if self.length == 0
      return self
    end
    self.map! do |x|
      x *= x
    end
    self
  end
end
