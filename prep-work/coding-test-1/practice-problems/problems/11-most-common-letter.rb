# Write a method that takes in a string. Your method should return the
# most common letter in the array, and a count of how many times it
# appears.
#
# Difficulty: medium.

def most_common_letter(string)
	count = 0
	i = 0
	j = 0
	ltr = '\0'
	temp = 0
	string = string.split('')
	ltr = string[1]
	while i < string.length
		while j < string.length
			if string[i] == string[j]
				temp+=1
			end
			j+=1
		end
		if(temp>count)
			ltr = string[i]
			count = temp
		end
		temp = 0
		i+=1
		j=i
	end
	return ltr,count
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts(
  'most_common_letter("abca") == ["a", 2]: ' +
  (most_common_letter('abca') == ['a', 2]).to_s
)
puts(
  'most_common_letter("abbab") == ["b", 3]: ' +
  (most_common_letter('abbab') == ['b', 3]).to_s
)
