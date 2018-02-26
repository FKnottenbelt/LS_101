# what_century_is_that.rb
# Write a method that takes a year as input and returns the century.
# The return value should be a string that begins with the century number, and
# ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise
# the 20th century.

# i: year as integer
# o: century as string century number + st, nd, rd or th
# r: new centry year with 01: 1901 - 2000 = 20th
# r:  1 std
#     2 nd
#     3 rd
#     rest: th
#     exceptions: 11, 12, 13 get th
# d: not a hash for lookup table, because there are exceptions, so a case
# f: - find the century:
#      divide year by 100 and add 1
#      except when year ends on 00
#   - find the ending:
#     take the last number of century. look the ending up
#     except when the last 2 numbers of the century fit the exceptions
#   - put them together

def find_century(year)
  century_number = (year / 100) + 1
  century_number -= 1 if year % 100 == 0
  century_number
end

def find_ending(century)
  last = century.digits.shift

  case last
  when 1 then text = 'st'
  when 2 then text = 'nd'
  when 3 then text = 'rd'
  else text = 'th'
  end

  if [11, 12, 13].include?(century % 100)
    text = 'th'
  end
  text
end

def century(year)
  century_number = find_century(year)
  ending = find_ending(century_number)
  century_number.to_s + ending
end

# Examples:

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
