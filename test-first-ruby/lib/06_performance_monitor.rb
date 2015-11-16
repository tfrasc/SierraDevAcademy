def measure(num = 1)
	first = Time.now
	avg = 0
	num.times do
		before = Time.now
		yield
		after = Time.now
		avg += (after - before)
	end
	if num > 1
		return (avg/num)
	end
	return (Time.now - first)
end