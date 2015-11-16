class Temperature
  def initialize(options = {})
  	@opt = {:f => options[:f], :c => options[:c]}.merge(options)
  end

  def self.from_celsius(num)
  	if @opt == nil
  		Temperature.new({:c => num})
  	else
  		return @opt[:c] = num
  	end
  end

  def self.from_fahrenheit(num)
  	if @opt == nil
  		Temperature.new({:f => num})
  	else
  		return @opt[:f] = num
  	end
  end

  def in_fahrenheit
	if @opt[:f] == nil
		return (@opt[:c] * 9.0 / 5.0 + 32.0)
	end
	return @opt[:f]
  end

  def in_celsius
   	if @opt[:f] == nil
   		return @opt[:c]
   	end
  	return ((@opt[:f] - 32.0) * (5.0 / 9.0))
  end
end

class Celsius < Temperature
	def initialize(num)
		@temp = num
	end

	def in_celsius
		return @temp
	end

	def in_fahrenheit
		return (@temp * 9.0 / 5.0 + 32.0)
	end
end

class Fahrenheit < Temperature
	def initialize(num)
		@temp = num
	end

	def in_celsius
		return ((@temp - 32.0) * (5.0 / 9.0))
	end

	def in_fahrenheit
		return @temp
	end
end