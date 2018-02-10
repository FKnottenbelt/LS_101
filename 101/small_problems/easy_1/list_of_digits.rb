# Write a method that takes one argument, a positive integer, 
# and returns a list of the digits in the number.

# i: positive Integer
# o: array of digits in the number

def digit_list number
  number.digits.reverse
end

#Examples:

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

##### alternatives
def digit_list(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)   # number = 1234 remainder = 5
                                            # dus: zoek laatste in number
    digits.unshift(remainder)               # push naar vooraan output array
    break if number == 0
  end
  digits
end

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end