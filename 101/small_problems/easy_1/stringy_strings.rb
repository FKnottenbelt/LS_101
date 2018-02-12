# Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1. The length of
# the string should match the given integer.

# Examples:

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# The tests above should print true.

####
# i: positive integer
# o: string of alternating 1s and 0s, always starting with 1
# r: string.length = integer

def stringy1(int)
  ('10' * (int / 2)) + ('1' * (int % 2))
end

def stringy(int, switch = '1')
  strings = ''

  int.times do |i|
    if switch == 0
      string = i.even? ? '0' : '1'
    else
      string = i.even? ? '1' : '0'
    end
    strings << string
  end

  strings
end
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
puts stringy(4, 0) == '0101'
