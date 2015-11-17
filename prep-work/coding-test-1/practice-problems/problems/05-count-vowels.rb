# Write a method that takes a string and returns the number of vowels
# in the string. You may assume that all the letters are lower cased.
# You can treat "y" as a consonant.
#
# Difficulty: easy.
#
# def count_vowels(string)
#   i = 0
#   string = string.split('')
#   string.each do |v|
#     case v
#      when 'a', 'e', 'i', 'o','u'
#       i += 1
#     end
#   end
#   i
# end
#
def count_vowels(string)
  i = 0
  string = string.split('')
  vowels = 'a', 'e', 'i', 'o','u'
  string.each do |v|
    if vowels.include?(v)
      i += 1
    end
  end
  i
end
# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts('count_vowels("abcd") == 1: ' + (count_vowels('abcd') == 1).to_s)
puts('count_vowels("color") == 2: ' + (count_vowels('color') == 2).to_s)
puts('count_vowels("colour") == 3: ' + (count_vowels('colour') == 3).to_s)
puts('count_vowels("cecilia") == 4: ' + (count_vowels('cecilia') == 4).to_s)
