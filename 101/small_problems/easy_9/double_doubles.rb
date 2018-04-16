# double_doubles.rb

# A double number is a number with an even number of digits whose left-side digits
# are exactly the same as its right-side digits. For example, 44, 3333, 103103,
# 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument,
# unless the argument is a double number; double numbers should be returned as-is.

# Note: underscores are used for clarity above. Ruby lets you use underscores
# when writing long numbers; however, it does not print the underscores when
#   printing long numbers. Don't be alarmed if you don't see the underscores
#   when running your tests.

# r: double = even , right = left
# i: number
# o: if not double then make double (integer)
# f: - see if input is equal length
#       to string
#   if so, see if double
#     - if index = len /2 : sub = 0...index
#   else  make double.

def double?(str_num)
  index = str_num.size / 2
  substring1 = str_num[0...index]
  substring2 = str_num[index..str_num.size]
  substring1 == substring2
end

def twice(num)
  str_num = num.to_s
  len = str_num.size
  if len.even?
    double?(str_num) ? output = num : output = num * 2
  else
    output = num * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# ls solution
def twice(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end
