def ftoc(f)
	f = ((f -32.0) / (9.0/5.0)) 
	return f.round
end

def ctof(c)
	c = ((c * 9.0/5.0) + 32.0)
	puts c
	return c
end