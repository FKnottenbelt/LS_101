# convert_number_rev_digits.rb

# Write a method that takes a positive integer as an argument and returns
# that number with its digits reversed.

def reversed_number(num)
  num.digits.join.to_i
end

def reversed_number(num)
  output =[]
  counter = num.to_s.size.to_i

  loop do
    break if counter == 0
    num, remainder = num.divmod(10)
    output << remainder
    counter -= 1
  end
  output.join.to_i
end

def reversed_number(num)
  output = []
  num.to_s.chars do |char|
    output.unshift(char)
  end
  output.join.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1

# LS solution
def reversed_number(number)
  string = number.to_s
  reversed_string = string.reverse
  reversed_string.to_i
end
