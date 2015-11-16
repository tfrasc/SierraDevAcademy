class RPNCalculator
	def initialize
		@arr = []
		@empty = true
		@value = 0.0
	end

	def push(num)
		@empty = false
		@arr = @arr.push(num)
	end

	def plus
		if @empty 
			raise "calculator is empty"
		end
		if @value == 0.0
			return @value = (@arr.pop + @arr.pop)
		end
		@value += @arr.pop
	end

	def minus 
		if @empty 
			raise "calculator is empty"
		end
		if @value == 0.0
			return @value = (-@arr.pop + @arr.pop)
		end
		@value -= @arr.pop
	end

	def divide
		if @empty 
			raise "calculator is empty"
		end
		first = @arr.pop
		if @value == 0.0
			return @value = (@arr.pop.to_f / first.to_f)
		end
		@value = (@arr.pop.to_f / first.to_f)
	end

	def times
		if @empty 
			raise "calculator is empty"
		end
		if @value == 0.0
			return @value = (@arr.pop * @arr.pop)
		end
		@value *= @arr.pop
	end

	def tokens(string)
		return string.split(' ')
	end

	def value
		return @value
	end
end
