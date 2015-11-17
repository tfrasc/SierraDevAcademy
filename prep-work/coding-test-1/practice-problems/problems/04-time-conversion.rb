# Write a method that will take in a number of minutes, and returns a
# string that formats the number into `hours:minutes`.
#
# Difficulty: easy.

def time_conversion(minutes)
  hours = minutes / 60
  minutes = (minutes - (hours * 60))
  if minutes < 10
    minutes = "0" + minutes.to_s
  end
  display = [hours, ':', minutes]
  display.join
end

# These are tests to check that your code is working. After writing
# your solution, they should all print true.

puts('time_conversion(9) == "0:09": ' + (time_conversion(9) == '0:09').to_s)
puts('time_conversion(15) == "0:15": ' + (time_conversion(15) == '0:15').to_s)
puts('time_conversion(150) == "2:30": ' + (time_conversion(150) == '2:30').to_s)
puts('time_conversion(360) == "6:00": ' + (time_conversion(360) == '6:00').to_s)
