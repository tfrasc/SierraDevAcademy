class Dictionary
	def initialize

	end

	def entries
		if @data == nil
			return {}
		elsif @data.values == nil
			return @data.keys => nil
		end
		return @data
	end

	def add(opts = {})
		if @data == nil
			return @data = opts
		end
		@data = @data.merge(opts)
	end

	def keywords
		if @data.keys.is_a?(Array)
			return @data.keys
		elsif @data.values.first == nil
			return @data.keys
		elsif @data.is_a?(Hash)
			return @data.keys => @data.values
		end
		return @data.keys => nil
	end
end
