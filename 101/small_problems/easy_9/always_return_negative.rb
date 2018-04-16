# always_return_negative.rb

# Write a method that takes a number as an argument. If the argument is a
# positive number, return the negative of that number. If the number is 0 or
# negative, return the original number.

# i: number
# o: is pos make negative
#   if 0 or neg, return original
# f: spaceship

def negative(num)
  case num <=> 0
  when -1 then num
  when 1 then -num
  when 0 then num
  else 'oeps'
  end
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

# LS solution
def negative(number)
  number > 0 ? -number : number
end
