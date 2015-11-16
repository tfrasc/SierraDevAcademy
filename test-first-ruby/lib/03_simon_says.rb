def echo(str)
		return "#{str}"
end

def shout(str)
	return "#{str.upcase}"
end

def repeat(str,num = 2)
	i = 0
	string = str
	while i < num - 1   do
		str += " " + string
		i += 1
	end
	return str
end

def start_of_word(str, num)
	string = ""
	i = 0
	while i < num
		string += str[i]
		i += 1
	end
	return string
end

def first_word(str)
	str = str.split(" ")
	return str[0]
end

def titleize(str)
	str = str.split(" ")
	first = true
	str.map! do |x|
		if (x == 'and' or x == "the" or x == "over") and !first
			x = x
		else
			first = false
			x = x.capitalize
		end
	end
	return str.join(" ")
end