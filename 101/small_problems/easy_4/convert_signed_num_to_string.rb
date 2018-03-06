# convert_signed_num_to_string.rb

# In the previous exercise, you developed a method that converts non-negativ
# e numbers to strings. In this exercise, you're going to extend that method
# by adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string
# representation.

# You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc. You may, however, use
# integer_to_string from the previous exercise.

LOOKUP = { 0 => '0', 1 => '1', 2 => '2' , 3 => '3', 4 => '4', 5 => '5'} #etc

def integer_to_string(num)
  string = ''
  num.digits.reverse.each do |digit|
    string << LOOKUP[digit]
  end
  string
end

def signed_integer_to_string(num)
  if num == 0
    integer_to_string(num.abs)
  elsif num.negative?
    "-" << integer_to_string(num.abs)
  else
    "+" << integer_to_string(num.abs)
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

#nice:
def signed_integer_to_string(num)
  num < 0 ? sign = '-' : sign = '+'
  num = num.abs
  num != 0 ? integer_to_str(num).prepend(sign) : '0'
end
