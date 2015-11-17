class Temperature
  def initialize(options = {})
    @opt = {f: options[:f], c: options[:c]}.merge(options)
  end

  def self.from_celsius(num)
    if @opt[:c] == nil
      Temperature.new({:c => num})
    else
      @opt[:c] = num
    end
  end

  def self.from_fahrenheit(num)
    if @opt[:f] == nil
      Temperature.new({:f => num})
    else
      @opt[:f] = num
    end
  end

  def in_fahrenheit
    if @opt[:f] == nil
      return (@opt[:c] * 9.0 / 5.0 + 32.0)
    end
    @opt[:f]
  end

  def in_celsius
    if @opt[:f] == nil
      return @opt[:c]
    end
    ((@opt[:f] - 32.0) * (5.0 / 9.0))
  end
end

class Celsius < Temperature
  def initialize(num)
    @temp = num
  end

  def in_celsius
    @temp
  end

  def in_fahrenheit
    (@temp * 9.0 / 5.0 + 32.0)
  end
end

class Fahrenheit < Temperature
  def initialize(num)
    @temp = num
  end

  def in_celsius
    ((@temp - 32.0) * (5.0 / 9.0))
  end

  def in_fahrenheit
    @temp
  end
end
