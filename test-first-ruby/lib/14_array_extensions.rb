class Array
	def sum
		@val = 0
		if self.length == 0
			return @val
		end
		self.each do |x|
			@val += x
		end
		return @val
	end

	def square
		@val = 0
		if self.length == 0
			return self
		end
		sqr = self.map do |x|
			x *= x
		end
		return sqr
	end

	def square!
		@val = 0
		if self.length == 0
			return self
		end
		self.map! do |x|
			x *= x
		end
		return self
	end
end