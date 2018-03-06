# convert_num_to_string.rb

# In the previous two exercises, you developed methods that convert simple
# numeric strings to signed Integers. In this exercise and the next, you're
# going to reverse those methods.

# Write a method that takes a positive integer or zero, and converts it to
# a string representation.

# You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc. Your method should do
# this the old-fashioned way and construct the string by analyzing and
# manipulating the number.

#f: it's a manual conversion => use a hash to lookup

LOOKUP = { 0 => '0', 1 => '1', 2 => '2' , 3 => '3', 4 => '4', 5 => '5'} #etc

def integer_to_string(num)
  string =''
  num.digits.reverse.each do |digit|
    string << LOOKUP[digit]
  end
  string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'


