def echo(str)
  "#{str}"
end

def shout(str)
  "#{str.upcase}"
end

def repeat(str,num = 2)
  i = 0
  string = str
  while i < num - 1   do
    str += " " + string
    i += 1
  end
  str
end

def start_of_word(str, num)
  string = ""
  i = 0
  while i < num
    string += str[i]
    i += 1
  end
  string
end

def first_word(str)
  str = str.split(" ")
  str[0]
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
  str.join(" ")
end
